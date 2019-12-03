" :Unite -auto-preview colorscheme
" で一覧を表示する

colorscheme my_default
" colorscheme molokai
" colorscheme chocolatepapaya
" colorscheme anotherdark
" colorscheme bubblegum
" colorscheme buddy
" colorscheme emacs
" colorscheme elflord
" colorscheme desert
" colorscheme hybrid_reverse
" colorscheme hybrid

" set background=dark


hi Visual ctermbg = 6

highlight conceal ctermfg=7 ctermbg=black guibg=darkgray
" test "{{{
"}}}
hi Folded     term=standout ctermbg=17 ctermfg=white
hi FoldColumn term=standout ctermbg=16 ctermfg=2
" 欲を言うなら，fold しても1行目の構文ハイライトは維持したい。


" https://h2plus.biz/hiromitsu/entry/674
" カラースキームをまとめたサイト

hi MatchParen ctermbg=240

hi spellbad NONE
hi SpellCap NONE
hi SpellRare NONE
hi SpellLocal NONE

set cursorline
hi clear CursorLine
hi CursorColumn ctermbg=0
hi CursorLineNr term=bold   cterm=NONE ctermfg=215 ctermbg=NONE
