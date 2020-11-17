if !&compatible
  set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml('~/.config/nvim/dein/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein/dein_lsp.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein/dein_fern.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein/dein_lang.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml', {'lazy': 1})
  call dein#add('neoclide/coc.nvim', { 'merged': 0 })
  call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins)>0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

source ~/.config/nvim/dein.rc.vim

set fileformat=unix
set fileformats=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set cmdheight=1
set rtp+=/usr/local/opt/fzf
set encoding=UTF-8
set number             
set autoindent        
set expandtab
set tabstop=2          
set shiftwidth=2       
set expandtab          
set clipboard=unnamed  
set hls               
set t_Co=256
set nocompatible
set ignorecase 
set incsearch
set inccommand=split
set conceallevel=0
set signcolumn=yes
set cursorline
set splitright

" Key map setting
let mapleader = "\<Space>"
noremap ; : 
noremap <Space>i %
nmap s <Nop>
xmap s <Nop>
nmap sv :vsplit <CR><C-w>w<plug>(wintabs_close)<C-w>w

nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # :%s/\<<C-r><C-w>\>//g<Left><Left>
xnoremap <silent> <Space> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap # :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Space>l :<C-u>nohlsearch<CR><C-l>
nnoremap x "_x

function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction

" node setting
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Python setting
let g:python_host_prog = '/usr/bin/python2'

let g:python3_host_prog = '/usr/local/bin/python3'

" set filetype
autocmd FileType vue syntax sync fromstart
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" treesitter setting
lua <<EOF	
require'nvim-treesitter.configs'.setup {	
  highlight = {	
    enable = true,	
    disable = {	
      'lua',	
      'ruby',	
      'html',	
      'toml',
      'c_sharp',	
      'css',	
      'vue',	
    }	
  },	
  incremental_selection = {	
    enable = true,	
  },	
  refactor = {	
    highlight_definitions = {	
      enable = false,	
    },	
    highlight_current_scope = {	
      enable = false,	
    },	
    smart_rename = {	
      enable = false,	
    },	
    navigation = {	
      enable = false,	
    }	
  },	
  textobjects = { -- syntax-aware textobjects	
    enable = true,
  },
  ensure_installed = 'maintained' -- one of 'all', 'language', or a list of languages	
}	
EOF	
