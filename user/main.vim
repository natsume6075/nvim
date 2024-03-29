" --- variables:        --------------------{{{
let current_file_pass = expand("%")
let current_file_name = substitute(expand("%:p"), "^.*/", "", "g")
let current_dir       = substitute(expand("%:p"), "/[^/]*$", "", "g")

let save_curpos = getcurpos()
"}}}

" --- Global Settings: ---------------------{{{
set fenc=utf-8
let &backupdir = g:data_home . '/nvim/backup'
set backup
let &directory = g:data_home . '/nvim/swap'
set swapfile
set autoread
set hidden
set textwidth=0
set display=lastline
set pumheight=12
set spell
set spelllang=en,cjk
set updatetime=100      " default 4000
"}}}

" --- Motion -------------------------------{{{
set whichwrap=<,>,[,]
set backspace=indent,eol,start
set mouse=
set virtualedit=block
set scrolloff=2
"}}}

" --- Undo ---------------------------------{{{
let &undodir = g:data_home . '/nvim/undo'
set undofile
set undolevels=1000

autocmd initvim VimEnter *
            \ if isdirectory(&undodir) == 0 |
            \     echomsg "notice: undo directory is not exist" |
            \ endif
"}}}

" --- Yank, Paste, Resisters ---------------{{{
" yank したときに内容とディレクトリを echo する
autocmd initvim TextYankPost *
            \ echomsg "yank"string(v:event.regcontents)" to reg: ".v:event.regname
" buffer 間で reg を共有するための記述
autocmd initvim TextYankPost * :wv
autocmd initvim FocusGained * :rv!

" WSL連携用のclipboard設定
let g:clipboard = {
    \   'name': 'myClipboard',
    \   'copy': {
    \      '+': 'win32yank.exe -i',
    \      '*': 'win32yank.exe -i',
    \    },
    \   'paste': {
    \      '+': 'win32yank.exe -o',
    \      '*': 'win32yank.exe -o',
    \   },
    \   'cache_enabled': 1,
    \ }


" }}}

" --- viminfo(shada) ------------------------------{{{
" file location は、デフォルトで ~/.local/share/nvim/shada
set shada='100,<50,s10,h

" }}}

" --- Folding ------------------------------{{{
set foldenable
set foldmethod=marker
set foldmarker=\{{{,\}}}
set foldtext=FoldCCtext()
let g:foldCCtext_head = ''
" let g:foldCCtext_tail = 'printf(" %s[%4d lines Lv%-2d ]%s  ", v:folddashes, v:foldend-v:foldstart+1, v:foldlevel, v:folddashes)'
let g:foldCCtext_tail = 'printf(" %s[ %4d   %s  ", substitute(repeat("[", v:foldlevel-1), "[[[[[", "V ", "g"), v:foldend-v:foldstart+1, (repeat("]", v:foldlevel).repeat(" ", 5-v:foldlevel))[0:4])'
set foldcolumn=3
set fillchars=vert:\|
" foldcolumn が足りなくなった時に，自動で大きくする バグあり
" Ref: http://leafcage.hateblo.jp/entry/20111223/1324705686
let g:foldCCtext_enable_autofdc_adjuster = 1
" Don't save options.
set viewoptions-=options
" }}}

" --- Information --------------------------{{{
set number
set visualbell
set showmatch
set matchtime=1
set showcmd
set ruler
set laststatus=2
" }}}

" --- Tab / Indent / invisible character ---{{{
set tabstop=4
set softtabstop=0
set shiftwidth=0     " 改行やコマンドでのインデント幅。0だとtabstopの値を使う
set expandtab
set smarttab

set autoindent
set smartindent

" タブを >--- 行末の半スペを . で表示する
set list
set listchars=tab:>-,trail:.
" }}}

" --- Search -------------------------------{{{
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
" }}}

" --- about help ---------------------------{{{
" If true Vim master, use English help file.
set helplang& helplang=ja,en
"}}}
