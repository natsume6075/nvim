
let $XDG_DATA_DIRS = expand('/usr/local/share:/usr/share')
let $XDG_DATA_HOME = expand($HOME.'/.local/share')

" set fileformat=unix

set number
" set spell

set hidden

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"--- Motion ---------------------{{{
set whichwrap=<,>,[,]
" set whichwrap=<,>,[,],h,l
set backspace=indent,eol,start
" わりとカーソルがクリックで移動するのは邪魔くさいけど，ホイールによるスクロールだけは便利なので．
set mouse=a
set virtualedit=block
" スクロールの余裕を確保する
set scrolloff=2
" maintain cursor position
autocmd initvim BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
"}}}

" --- Yank, Paste, Resisters ----------- {{{
" set clipboard+=unnamedplus
autocmd initvim TextYankPost *
      \ echomsg "yank"string(v:event.regcontents)" to reg: ".v:event.regname
"}}}


" --- Tab / invisible character ----------- {{{
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" オートインデント
set autoindent
" インデントはスマートインデント
set smartindent
" タブを >--- 半スペを . で表示する
set listchars=tab:>-,trail:.
" 不可視文字を表示する
set list
"}}}


" --- Search ------------------------------ {{{
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" }}}


" ---------------------------------------
"  IME Settings:
" ---------------------------------------
"{{{
augroup initvim

  let g:current_ime_mode = 0

  function! Ime_off() abort
    if has('win64')
      echo "Someone please open the windows!"
:call system('AutoHotkeyU64.exe "Documents/ime_on.ahk"')
    elseif has('mac')
      call system("osascript -e 'tell application \"System Events\" to key code 102' &")
    elseif has('unix')
      call system('AutoHotkeyU64.exe "/UserArea/J0129312/Documents/ime_off.ahk"')
    else
      echo "not defined"
    endif
  endfunction

  function! Ime_on() abort
    if has('win64')
      echo "Someone please open the Window(s)!"
    elseif has('mac')
      call system("osascript -e 'tell application \"System Events\" to key code 104' &")
    elseif has('unix')
      call system('AutoHotkeyU64.exe "/UserArea/J0129312/Documents/ime_on.ahk"')
    else
      echo "not defined"
    endif
  endfunction

  autocmd InsertEnter *
        \ if g:current_ime_mode == 1 |
        \   call Ime_on() |
        \ endif
  autocmd InsertLeave *
        \ if g:current_ime_mode == 1 |
        \   call Ime_off() |
        \ endif

  imap <silent>っj <ESC>
  imap <silent> jj <ESC>

  noremap  çlang1 <Nop>
  noremap! çlang1 <Nop>
  noremap  çlang2 <Nop>
  noremap! çlang2 <Nop>
  nnoremap <silent> çlang1 :
        \:call Ime_off()<CR>
        \:let current_ime_mode = 1<CR>
        \:hi FoldColumn ctermbg=black<CR>
  nnoremap <silent> çlang2 :
        \:let current_ime_mode = 0<CR>
        \:hi FoldColumn ctermbg=16<CR>
  inoremap <silent> çlang1 <C-o>:
        \:let current_ime_mode = 1<CR>
        \<C-o>:hi FoldColumn ctermbg=black<CR>
  inoremap <silent> çlang2 <C-o>:
        \:let current_ime_mode = 0<CR>
        \<C-o>:hi FoldColumn ctermbg=16<CR>

augroup END
"
" :call system('AutoHotkeyU64.exe "/UserArea/J0129312/Documents/ime_on.ahk"')
" :call system('AutoHotkeyU64.exe "/UserArea/J0129312/Documents/ime_off.ahk"')
"}}}


" init.vim を保存したときにリロード
autocmd initvim BufWritePost $XDG_CONFIG_HOME/nvim/init.vim so $XDG_CONFIG_HOME/nvim/init.vim


imap jj <ESC>
imap ｊｊ <ESC>
nmap <silent> <F8> <Plug>MarkdownPreview

nnoremap  :<Up>

inoremap  <Home>
inoremap  <Left>
inoremap  <Del>
inoremap  <End>
inoremap  <Right>
inoremap  d$
inoremap  <Down>
inoremap  <Up>
inoremap  

command! Init e  ~/.config/nvim/init.vim









hi Folded     term=standout ctermbg=2 ctermfg=white
hi FoldColumn term=standout ctermbg=16 ctermfg=2


