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

nnoremap zh zMzv

nnoremap <C-p> :<C-p>
nnoremap <silent> <ESC> :nohl<CR><ESC>
nnoremap <silent> <C-c> :nohl<CR><C-c>
nnoremap <silent> <C-{> :nohl<CR><C-{>
nmap <silent> <C-k>        :bprevious<CR>
nmap <silent> <C-j>        :bnext<CR>

nnoremap <C-t> :ToggleSplitTerminal<CR>

" 文字数をカウンティングする
" nnoremap <Leader>cou :%s/.//gn

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

" --- function key ------------------------------------------{{{
" default: map <f1> to display the help file
" map <f2> to toggle show Information
nnoremap <f2> :
      \:set cursorcolumn!<CR>
" map <f4> to edit init.vim
nnoremap <f4> :<C-u>.tabedit $XDG_CONFIG_HOME/nvim/init.vim<CR>
" map <f5> to source init.vim
nnoremap <f5> :<C-u>source $XDG_CONFIG_HOME/nvim/init.vim<CR>
" map language_specific/global neosnippet edit
nnoremap <f7>  :NeoSnippetEdit -horizontal<CR>
xnoremap <f7>  y :NeoSnippetEdit -horizontal<CR>Gp
nnoremap <f19> :NeoSnippetEdit -horizontal _<CR>
xnoremap <f19> y :NeoSnippetEdit -horizontal _<CR>Gp

"}}}

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
" spell
inoremap <C-s> <C-x>s

"}}}

" --- cmap --------------------------------------------------{{{
cnoremap    <C-a> <Home>
cnoremap    <C-b> <left>
cnoremap    <C-d> <Del>
cnoremap    <C-e> <End>
cnoremap    <C-f> <Right>
cnoremap    <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap    <C-n> <Down>
cnoremap    <C-p> <Up>

"}}}

" --- tmap --------------------------------------------------{{{
tnoremap <ESC> <C-\><C-n>
tnoremap <C-t> <Cmd>ToggleSplitTerminal<CR>

"}}}

