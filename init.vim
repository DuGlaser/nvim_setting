if !&compatible
  set nocompatible
endif

" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('jacoborus/tender.vim')
  call dein#load_toml('~/.config/nvim/dein.toml')
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if dein#check_install()
  call dein#install()
endif

set rtp+=/usr/local/opt/fzf
set encoding=UTF-8
set number             
set autoindent        
set expandtab
set tabstop=2          
set shiftwidth=2       
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
let g:AutoClosePreserveDotReg = 0
" colorscheme
colorscheme lucario
syntax enable 
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE 

" キーバインド
" <モード> [later][now]
noremap ; : 
nnoremap <C-h> gT 
nnoremap dm) vmzi)o`zod
nnoremap <C-l> gt
noremap <Space>h ^
noremap <Space>l $
noremap <Space>t :tabnew<CR>:te<CR>
map <C-n> <plug>NERDTreeTabsToggle<CR>
tnoremap <Esc> <C-\><C-n>


" node_moduleの設定
let g:node_host_prog = system('echo -n $(which neovim-node-host)')

" Pythonの設定
let g:python_host_prog = expand('/usr/local/bin/python2')
let g:python3_host_prog = expand('/usr/local/bin/python3')

" Golang
let g:sonictemplate_vim_template_dir = [
\ '~/.config/nvim/template',
\]

" vim-devicons
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:webdevicons_enable_airline_statusline = 1

