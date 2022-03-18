command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis

command! Init e  ~/.config/nvim/init.vim

" 現在ハイライトしている行以外を消す。d _ で yank を回避しないと、めちゃくちゃ遅くなる。
command! Filter g!//d _

