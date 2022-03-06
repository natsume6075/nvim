command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis

command! Init e  ~/.config/nvim/init.vim
