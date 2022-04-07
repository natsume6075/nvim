command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis

command! Init e  ~/.config/nvim/init.vim

" 現在ハイライトしている/していない行以外を消す。d _ で yank を回避しないと、めちゃくちゃ遅くなる。
command! Filter  g!//d _
command! NFilter g//d _

" $SCRATCHES にメモを作成する。
command! -nargs=? Scratch let $DATE = expand(strftime('%Y-%m-%d')) | e $SCRATCHES/$DATE\_<args>.md

" terminal を下部に表示する TODO すでに開いているならそれを開く
command! ToggleSplitTerminal if &buftype ==# 'terminal' | close | else | call OpenSplitTerminal() | endif

