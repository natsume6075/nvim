set wildmenu
set wildmode=longest,full
set wildmenu
set wildmenu
nmap <silent> <C-h>        :bprevious<CR>
nmap <silent> <C-l>        :bnext<CR>

" --- small trick: -----------------------------------------{{{
" delete only last char in current line
nnoremap <silent>d, :
      \:let save_curpos = getcurpos()<CR>
      \A<C-h><ESC>
      \:call setpos('.', save_curpos)<CR>

nnoremap <expr> Ssub Move_cursor_pos_mapping(":%s/<C-r>0/<C-r>0<CURSOR>/g")
vnoremap <expr> Ssub Move_cursor_pos_mapping(":s/<C-r>0/<C-r>0<CURSOR>/g")
"}}}

command! Init e  ~/.config/nvim/init.vim



" --- Global Functions: --------------------{{{
let save_curpos = getcurpos()
let $CURRENT_FILE_PASS = expand("%")
let $CURRENT_FILE_NAME = substitute(expand("%:p"), "^.*/", "", "g")
let $CURRENT_DIR       = substitute(expand("%:p"), "/[^/]*$", "", "g")
let save_curpos = getcurpos()


" pos は配列で，その扱いがおかしいっぽい？
function! g:Set_curpos() abort
  call setpos('.', save_curpos)
endfunction

function! s:move_cursor_pos_mapping(str, ...)
  let left = get(a:, 1, "<Left>")
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction
function! Move_cursor_pos_mapping(str)
  return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction
" Ref: http://d.hatena.ne.jp/osyo-manga/20130424/1366800441
"}}}

" --- Global Settings: ---------------------{{{
set fenc=utf-8
set backupdir=$XDG_DATA_HOME/nvim/backup
set backup
set directory=$XDG_DATA_HOME/nvim/swap
set swapfile
set autoread
set hidden
set textwidth=0
set display=lastline
set pumheight=12
set spell
set spelllang=en,cjk
"}}}

" --- Motion -------------------------------{{{
set whichwrap=<,>,[,]
set backspace=indent,eol,start
set mouse=a
set virtualedit=block
set scrolloff=2
"}}}

" --- Undo ---------------------------------{{{
set undodir=$XDG_DATA_HOME/nvim/undo
set undofile
set undolevels=1000
"}}}

" --- Yank, Paste, Resisters ---------------{{{
autocmd initvim TextYankPost *
      \ echomsg "yank"string(v:event.regcontents)" to reg: ".v:event.regname
autocmd initvim TextYankPost * :wv
autocmd initvim FocusGained * :rv!
" }}}

" --- viminfo ------------------------------{{{
set viminfo+=n$XDG_DATA_HOME/nvim/viminfo
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

" --- Tab / invisible character ------------{{{
set expandtab
set tabstop=2
set shiftwidth=2
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


" ---------------------------------------
"  Commands Settings:
" ---------------------------------------
"{{{
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis

" 文字数をカウンティングする
command! Cou :%s/.//gn


"}}}

" ---------------------------------------
"  Autocmd:
" ---------------------------------------
"{{{
" maintain cursor position
autocmd initvim BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
autocmd initvim BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")

" init.vim を保存したときにリロード
autocmd initvim BufWritePost $XDG_CONFIG_HOME/nvim/init.vim so $XDG_CONFIG_HOME/nvim/init.vim
"}}}


