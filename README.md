# nvim_setting

```
.
├── LICENSE
├── README.md
├── UltiSnips
│   └...
├── coc-options.vim
├── coc-settings.json
├── dein
│   ├── dein.toml
│   ├── dein_lang.toml
│   └── dein_lazy.toml
├── dein.rc.vim
└── init.vim
```

## Requirements
* Neovim nightly
* Node
* Python3

## init.vim
deinの読み込みや全体の設定をしています

## dein.rc.vim
deinのプラグインを高速で更新するための設定をしています。GITHUB TOKENを記述しているためignoreしています。

```vim
" update plugins command :call dein#check_update(v:true)
let g:dein#install_github_api_token = 'GITHUB TOKEN'
```

## UltiSnips
snippetの設定ファイル以下に配置します。

## dein
プラグインの設定をしています

### dein.toml
どのファイルでも最初から使いたいものを設定しています。

### dein_lazy.toml
インサートモードに入ったときに記述するなどの遅延読み込みをしたいものをここに設定しています。

### dein_lang.toml
言語ごとに読み込みたいプラグインをここでは設定しています。

## coc-options.vim
coc全体の設定をしています。

## coc-settings.json
cocのプラグインごとの設定をしています。

## Benchmark

benchmark with <a href="https://github.com/rhysd/vim-startuptime">vim-startuptime</a>

```
Total Average: 172.232200 msec
Total Max:     232.473000 msec
Total Min:     158.428000 msec
```
