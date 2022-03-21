set termguicolors
set cursorline

" :Unite -auto-preview colorscheme
" で一覧を表示する
" https://h2plus.biz/hiromitsu/entry/674
" カラースキームをまとめたサイト

" colorscheme my_default
" colorscheme molokai
" colorscheme anotherdark
" colorscheme bubblegum
" colorscheme buddy
" colorscheme elflord
" colorscheme hybrid_reverse
" colorscheme hybrid
" colorscheme japanesque
" colorscheme atom
" colorscheme solarized
colorscheme iceberg
" colorscheme gotham

" --- colorscheme 共通の調整 ---"
hi SpellBad None
hi SpellCap None
hi SpellRare None
" hi Visual ctermbg = 8
" hi Folded     term=standout ctermbg=0 ctermfg=white
" hi FoldColumn term=standout ctermbg=16 ctermfg=2
" " test "{{{
" "}}}
" hi Pmenu    ctermfg=255 ctermbg=17
" hi PmenuSel ctermfg=255 ctermbg=27
" highlight conceal ctermfg=7 ctermbg=black guibg=darkgray
" hi MatchParen ctermbg=240
" hi clear CursorLine
" hi CursorColumn ctermbg=0
" hi CursorLineNr term=bold   cterm=NONE ctermfg=215 ctermbg=NONE


" --- colorscheme ごとの調整 ---"

if g:colors_name == "japanesque"
    hi Search ctermbg=yellow
endif

