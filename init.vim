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
  call dein#load_toml('~/.config/nvim/dein/dein_lang.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml', {'lazy': 1})
  call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
  call dein#add('sainnhe/gruvbox-material')
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
set completeopt=menuone,noinsert
set t_Co=256
set nocompatible
set ignorecase 
set incsearch
set inccommand=split
set conceallevel=0
set signcolumn=yes
let g:vim_json_syntax_conceal = 0

let g:AutoClosePreserveDotReg = 0

" colorscheme setting
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable 

set background=dark
let g:gruvbox_material_palette = 'original'
colorscheme gruvbox-material

" let g:loaded_matchparen=1
" highlight MatchParen ctermfg=NONE ctermbg=0 guibg=#2572A2 guifg=#eeeeee
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight SpecialKey ctermbg=NONE guibg=NONE
" highlight LineNr ctermfg=NONE guibg=NONE cterm=NONE guifg=#ffb244
" highlight CursorLineNr ctermfg=NONE guibg=NONE cterm=NONE guifg=#ffb244
" highlight SignColumn ctermfg=NONE guibg=NONE cterm=NONE guifg=#ffb244
" highlight EndOfBuffer ctermbg=NONE guibg=NONE

" yank highlight
highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#2572A2

" Key map setting
let mapleader = "\<Space>"
noremap ; : 
nnoremap <C-h> gT 
nnoremap dm) vmzi)o`zod
nnoremap <C-l> gt
noremap <Space>i %
tnoremap <Esc> <C-\><C-n>
nmap s <Nop>
xmap s <Nop>

nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
xnoremap <silent> <Space> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap # <Space>:%s/<C-r>///g<Left><Left>
inoremap <C-t> <Esc><Left>"zx"zpa
nnoremap <silent> <Space>l :<C-u>nohlsearch<CR><C-l>
nnoremap x "_x
nnoremap s "_s

function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction

" node setting
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Python setting
let g:python_host_prog = expand('/usr/bin/python2')

let g:python3_host_prog = expand('/usr/local/bin/python3')

" vim-devicons
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:webdevicons_enable_airline_statusline = 1

" set filetype
autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" coc-go	
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" treesitter setting
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = {
        'tsx',
        'jsx',
        'lua',
        'javascript',
        'typescript',
        'go',
        'ruby',
        'html',
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
    disable = {'tsx','jsx'}
    },
    ensure_installed = 'all' -- one of 'all', 'language', or a list of languages
}
EOF

" いつの日か使うと信じて...
" nvim-lsp setting
" :lua << END
"   require'nvim_lsp'.tsserver.setup{}
"   require'nvim_lsp'.cssls.setup{}
"   require'nvim_lsp'.ccls.setup{}
"   require'nvim_lsp'.html.setup{}
"   require'nvim_lsp'.solargraph.setup{}
"   require'nvim_lsp'.vuels.setup{}
" END
