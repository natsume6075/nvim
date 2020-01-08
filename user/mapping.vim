" ----------------+--------+--------+--------+----------+--------+---------+--------------.
"  Commands\Modes | Normal | Visual | Select | Operator | Insert | Command | Others       |
" ----------------+--------+--------+--------+----------+--------+---------+--------------|
"  map            |   @    |   @    |   @    |    @     |        |         |              |
"  nmap           |   @    |        |        |          |        |         |              |
"  vmap           |        |   @    |   @    |          |        |         |              |
"  smap           |        |        |   @    |          |        |         |              |
"  xmap           |        |   @    |        |          |        |         |              |
"  omap           |        |        |        |    @     |        |         |              |
" ----------------+--------+--------+--------+----------+--------+---------+--------------|
"  map!           |        |        |        |          |   @    |    @    |              |
"  imap           |        |        |        |          |   @    |         |              |
"  lmap           |        |        |        |          |   @    |    @    | Lang-Arg     |
"  cmap           |        |        |        |          |        |    @    |              |
"  tmap           |        |        |        |          |        |         | terminal Job |
" ----------------+--------+--------+--------+----------+--------+---------+--------------.


let mapleader = "\<Space>"
let maplocalleader = ","

" --- all ---------------------------------------------------{{{
map  <BS> <C-h>
map! <BS> <C-h>
"}}}

" --- map ---------------------------------------------------{{{
noremap H _
noremap L $
map gm %


" 思い通りになるJK
noremap <expr>  J     To_bottom_of_window_OR_scroll_next_page()
function! To_bottom_of_window_OR_scroll_next_page() abort" {{{
  if winline() > winheight(0) - 5
    return "\<C-f>L"
  else
    return "L"
  endif
endfunction" }}}

noremap <expr>  K     To_top_of_window_OR_scroll_previous_page()
function! To_top_of_window_OR_scroll_previous_page() abort" {{{
  if winline() < 5
    return "\<C-b>H"
  else
    return "H"
  endif
endfunction" }}}

"}}}

" --- nmap --------------------------------------------------{{{
nnoremap Y y$
nnoremap j gj
nnoremap k gk

nnoremap <C-p> :<C-p>
nnoremap <silent> <ESC> :nohl<CR><ESC>
nnoremap <silent> <C-c> :nohl<CR><C-c>
nnoremap <silent> <C-{> :nohl<CR><C-{>
nmap <silent> <C-h>        :bprevious<CR>
nmap <silent> <C-l>        :bnext<CR>

" 文字数をカウンティングする
nnoremap <Leader>cou :%s/.//gn
nnoremap <Leader>con J
nnoremap <expr> <Leader>sub Move_cursor_pos_mapping(":%s/<C-r>0/<C-r>0<CURSOR>/g")

" delete only last char in current line
nnoremap <silent>d, :
      \:let save_curpos = getcurpos()<CR>
      \A<C-h><ESC>
      \:call setpos('.', save_curpos)<CR>

" http://www.ipentec.com/document/regularexpression-url-detect
nnoremap <expr> _  Open_reference_OR_URL()
function! Open_reference_OR_URL() abort" {{{
  if expand('<cWORD>') =~ 'https\?:\/\/'
    return ":!open ".expand('<cWORD>')."\<CR>"
  elseif expand('<cWORD>') =~ '^\(\$\?\(\w\|\ \)\+\|\~\)\?\(\/\(\.\?\(\(\w\|\ \)\+\)\)\)\+\/'
    return ":e ".expand('<cWORD>')."\<CR>"
  else
    return "K"
  endif
endfunction
" }}}

"}}}

" --- vmap --------------------------------------------------{{{

vnoremap <expr> <Leader>sub Move_cursor_pos_mapping(":s/<C-r>0/<C-r>0<CURSOR>/g")
vnoremap <expr> _  Open_reference_OR_URL()
"}}}

" --- map! --------------------------------------------------{{{
map! jj <ESC>
map! ｊｊ <ESC>
"}}}

" --- imap --------------------------------------------------{{{
imap <expr> <C-l>   (neosnippet#jumpable() ? "\<plug>(neosnippet_jump)" : pumvisible() ? deoplete#close_popup() : "\<Tab>")

"}}}




inoremap <C-a> <Home>
" " アンドゥを抜けないで左に動かす．
inoremap <C-b> <C-g>U<left>
" inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-k> d$
inoremap <C-n> <Down>
inoremap <C-p> <Up>




