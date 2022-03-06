" ---------------------------------------
"  Key Map (n):
" ---------------------------------------
"{{{

" spell
nnoremap <C-s> z=
" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp







" folding -------------------------------------------------- {{{

noremap  <silent> zw :echo FoldCCnavi()<CR>
nnoremap <silent> zf za
nnoremap <silent> zF zA
nnoremap <silent> zM zM
nnoremap <silent> zj zj
nnoremap <silent> zk zk
nnoremap <silent> zd zd
nnoremap <silent> zD zD
nnoremap <silent> zc zc
nnoremap <silent> zC zC
nnoremap <silent> zi zi
" なにかつぶした
nnoremap <silent> za zR
nnoremap <silent> zA zM
nnoremap <silent> zj :<C-u>call <SID>smart_foldjump('j')<CR>
nnoremap <silent> zk :<C-u>call <SID>smart_foldjump('k')<CR>

function! s:smart_foldjump(direction)" {{{
  if a:direction == 'j'
    let [cross, trace, compare] = ['zj', ']z', '<']
  else
    let [cross, trace, compare] = ['zk', '[z', '>']
  endif

  let i = v:count1
  while i
    let save_lnum = line('.')
    exe 'keepj norm! '. trace
    let trace_lnum = line('.')
    exe save_lnum

    exe 'keepj norm! '. cross
    let cross_lnum = line('.')
    if cross_lnum != save_lnum && eval('cross_lnum '. compare. ' trace_lnum')
          \ || trace_lnum == save_lnum
      let i -= 1
      continue
    endif

    exe trace_lnum
    let i -= 1
  endwhile
  mark `
  norm! zz
endfunction
" }}}
" Ref: http://d.hatena.ne.jp/leafcage/20130212/1360636769

" }}}

" about buffer (airline) ---------------------{{{
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab
"}}}

" interface between pain and buffer ---------------------{{{
" move current pain to new buffer
" (if current window has only one pane, split into two tabs)
nnoremap <silent> <Leader>t :<C-u>call <SID>MoveToNewBuf()<CR>
function! s:MoveToNewBuf()" {{{
  tab split
  tabprevious
  if winnr('$') > 1
    close
  elseif bufnr('$') > 1
    buffer #
  endif
  tabnext
endfunction
" }}}
"}}}




" map <f6>/<f18> to add language_specific/global dictionary
nnoremap <f6>  :<C-u>.tabedit $LANG_DICTIONARY<CR>:sort u<CR>:w<CR>
vnoremap <f6>  "zy :!echo <C-r>z>> $LANG_DICTIONARY<CR><CR>
nnoremap <f18> :<C-u>.tabedit $GLOBAL_DICTIONARY<CR>:sort u<CR>:w<CR>
vnoremap <f18> "zy :!echo <C-r>z>> $GLOBAL_DICTIONARY<CR><CR>
" <f11> conceal syntax の呼び出し（vim）
autocmd initvim filetype tex  nnoremap <f11>
      \ :<C-u>.tabedit $XDG_CACHE_HOME/dein/repos/github.com/keitanakamura/tex-conceal.vim/after/syntax/tex.vim<CR>
" <f12> conceal のきりかえ
nnoremap <f12> :
      \:let conceallevel=(conceallevel/2+1)%2*2<CR>
      \:if conceallevel == 0<CR>
      \:    set conceallevel=0<CR>
      \:else<CR>
      \:    set conceallevel=2<CR>
      \:endif<CR>
      \<CR>

" }}} 

" ---------------------------------------
"  Key Map (c):
" ---------------------------------------
"{{{
cnoremap <C-y> <HOME>bufdo :
"}}}

" ---------------------------------------
"  Key Map (v):
" ---------------------------------------
"{{{
vnoremap  *  "zy/\V<C-r>z<CR>

" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]



" vnoremap Y :<BS><BS><BS><BS><BS>
vnoremap Y "*y

" xmap (     <plug>(neosnippet_expand_target)(<CR>
" xmap {     <plug>(neosnippet_expand_target){<CR>
" xmap [     <plug>(neosnippet_expand_target)[<CR>
" xmap <     <plug>(neosnippet_expand_target)<<CR>
" xmap "     <plug>(neosnippet_expand_target)"<CR>
" xmap '     <plug>(neosnippet_expand_target)'<CR>

"}}}

" ---------------------------------------
"  Key Map (i):
" ---------------------------------------
"{{{
inoremap <silent> <C-f> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>




let paren_list = '('

function! Match_Paren() abort
  if expand('<cWORD>') =~ 'https\?:\/\/'
    return ":!open ".expand('<cWORD>')."\<CR>"
  elseif expand('<cWORD>') =~ '^\(\$\?\(\w\|\ \)\+\|\~\)\?\(\/\(\.\?\(\(\w\|\ \)\+\)\)\)\+\/'
    return ":e ".expand('<cWORD>')."\<CR>"
  else
    return "K"
  endif
endfunction


set matchpairs=(:),{:},[:],<:>



" ひとつ上の行をいただく
" i_CTRL-Y を最後までやる
" CTRL-Y の表示がこのマッピングがあるためにディレイかかっちゃって使いづらい上に，あんまり使ってないのでオフ
" imap <C-y>L  <Up><Right><ESC>y$i<Down><ESC>pa<CR><C-o>dd<left>





"}}}
"}}}



" --- Conceal: --------------------{{{
let conceallevel=0
set conceallevel=0
set concealcursor=""
"}}}


" ---------------------------------------
"  Mapping For Colemak:
" ---------------------------------------
"{{{
" nmap j <Plug>(anzu-n-with-echo)
" nmap J <Plug>(anzu-N-with-echo)
" noremap n gj
" noremap <silent> N     :keepjumps normal ─J<CR>
" xnoremap <expr>  N     To_bottom_of_window_OR_scroll_next_page()
"
" noremap k e
" noremap K E
" noremap e gk
" noremap <silent> E     :keepjumps normal ─K<CR>
" xnoremap <expr>  E     To_top_of_window_OR_scroll_previous_page()
"
" noremap l i
" noremap L I
" noremap i l
" noremap I $
" "}}}

" ---------------------------------------
"  Plugin Setting:
" ---------------------------------------
"{{{
" deoplete --------------------- {{{

"let g:neocomplcache_enable_auto_select = 1

call deoplete#custom#source('_', 'matchers'  ,  ['matcher_head']) "完全一致だけ
call deoplete#custom#source('_', 'sorters'   ,  ['sorter_rank'])
call deoplete#custom#source('_', 'converters',  ['converter_remove_overlap', 'converter_truncate_abbr','converter_truncate_menu', 'converter_auto_paren'])
" デフォルト設定
"call deoplete#custom#source('_', 'matchers'  , ['matcher_fuzzy'])
"call deoplete#custom#source('_', 'sorters'   ,  ['sorter_rank'])
"call deoplete#custom#source('_', 'converters',  ['converter_remove_overlap', 'converter_truncate_abbr','converter_truncate_menu'])

" 一つ前の文字が ない（カーソル位置が1） or \s(改行・タブ・半スペ) にマッチする
function! s:Check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" 選択を tab キーで行う。単語の後ろで tab キーを押すと deoplete を呼び出す（無効化）
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <sid>Check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
inoremap <expr> <TAB>   pumvisible() ? deoplete#complete_common_string() : "\<TAB>"
"}}}

" neosnippet --------------------- {{{

" a<C-h> の理由：
"   例えば { を使ったマッピングがある影響で { を入力すると待機モードになる。
"   待機モードで expand を呼び出しても即座に展開はされず，二度押しが必要だった。
"   他にも待機モードになるような任意の入力で即座に展開できなかった。
"   一旦適当な文字 a を打ってそれを消す操作を挟むことで，一度押しでいけるようにした。
" 内部的にインサートモードを抜けるので，InsertLeave が発火する。


"}}}




" evervim --------------------- {{{
" let g:evervim_devtoken='S=s1:U=950c7:E=17007f452d0:C=168b0432528:P=1cd:A=en-devtoken:V=2:H=708160efd6d58adcc078a7f8ea1c5563'
" first time settings
" :EvervimSetup
" }}}


" Deol -----------------------{{{
tnoremap  <CR>  <Plug>(deol_execute_line)
tnoremap  <C-p> <Plug>(deol_previous_prompt)
tnoremap  <C-n> <Plug>(deol_next_prompt)
tnoremap  <C-y> <Plug>(deol_paste_prompt)
tnoremap  <C-z> <Plug>(deol_bg)
tnoremap  e     <Plug>(deol_edit)

"}}}

"}}}

" ---------------------------------------
"  Language Specific Setting:
" ---------------------------------------
"{{{
filetype on
filetype plugin indent on

" Variables depend on language
let $LANG = "no defined"
let $LANG_COMMENT_TOKEN = "no defined"



" vim --------------------------
autocmd initvim FileType vim
      \ let $LANG = "vim"

" neosnippet -------------------
autocmd initvim BufNewFile  *.snip  put='# hogehoge snippets'

" tex --------------------------
" autocmd initvim BufNewFile,BufRead *.tex set filetype=tex
autocmd initvim FileType tex
      \ | let $LANG = "tex"
      \ | set foldmethod=expr
      \ | set shiftwidth=2
      \ | set foldcolumn=5
let g:tex_conceal="adgmb"

augroup texfile
  autocmd BufRead,BufNewFile *.tex set filetype=tex
  let md_to_latex  = "pandoc --from=markdown --to=latex"
  autocmd Filetype tex let &formatprg=md_to_latex
augroup END

autocmd initvim BufNewFile  *.tex  put='%! TEX root = /path/to/thesis.tex'

let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})
let g:vimtex_compiler_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
" -pvc
let g:vimtex_compiler_latexmk = {'continuous': 1}
let g:vimtex_quickfix_open_on_warning = 1
" autocmd BufNewFile,BufRead *.tex nmap <C-c> <plug>(vimtex-compile)

let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_view_method = 'skim'
let g:vimtex_view_automatic = 1
" let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/MacOS/Skim'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
" 分割してるとバグる？
" let g:vimtex_quickfix_autojump = 1
let g:vimtex_quickfix_mode     = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1

let g:Tex_IgnoredWarnings =
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\n".
      \"You have requested\n".
      \"Missing number, treated as zero.\n".
      \"There were undefined references\n".
      \"Citation %.%# undefined\n".
      \"LaTeX Font Warning:"
let g:Tex_IgnoreLevel = 8


function! s:previewTex() range
  let l:tmp = @@
  silent normal gvy
  let l:selected = split(@@, "\n")
  let @@ = l:tmp

  let l:template1 = ["\\input{env.tex}",
        \"\\begin{document}"]
  let l:template2 = ["\\end{document}"]

  let l:output_file = "preview.tex"
  call writefile(extend(extend(l:template1, l:selected), template2), l:output_file)
  silent call system("latexmk preview.tex")
  silent call system("open -ga /Applications/Skim.app preview.pdf")
endfunction
let maplocalleader = "\<Space>"
autocmd initvim FileType tex
      \ | nmap <buffer> <localleader>la vae:call <SID>previewTex()<CR>
      \ | nmap <buffer> <localleader><localleader> vae:call <SID>previewTex()<CR>
      \ | vnoremap <buffer> <localleader>la :call <SID>previewTex()<CR>
      \ | nmap <buffer> <localleader>lt <plug>(vimtex-toc-toggle)sj
      \ | nmap <buffer> <localleader>lj f{yi{:e <C-r>"<CR>
" Ref: http://mmi.hatenablog.com/entry/2015/01/02/003517
" 環境単位でコンパイルできる。
" カードル移動に伴って自動的に表示するようにする？
" 表示のためのアプリやスペースの選択（amethyst は邪魔 ツールバーも邪魔）
"   最前列で内容に合わせてなるべく小さく
" キャッシュしておいて素早く表示する

" json -------------------------
autocmd initvim FileType json
      \ let $LANG = "json"
"}}}


" ---------------------------------------
"  Fired Lastly:
" ---------------------------------------
"{{{

autocmd initvim VimEnter *
      \ let $LANG_DICTIONARY = expand($XDG_CONFIG_HOME.'/nvim/my_dictionary/'.$LANG.'.dict')
autocmd initvim VimEnter *
      \ set dictionary+=$LANG_DICTIONARY

let $GLOBAL_DICTIONARY = expand($XDG_CONFIG_HOME.'/nvim/my_dictionary/_.dict')
set dictionary+=$GLOBAL_DICTIONARY


" Ref: https://vim-jp.org/vim-users-jp/2009/10/08/Hack-84.html
" Save fold settings and cursor pos.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile'                       | mkview | endif
autocmd BufRead      * if expand('%') != '' && &buftype !~ 'nofile' && &buftype !~ 'help' | silent loadview | endif
"}}}

