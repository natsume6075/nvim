
  nnoremap <silent> çlang1 :
        \:call Ime_off()<CR>
        \:let current_ime_mode = 1<CR>
        \:hi FoldColumn ctermbg=black<CR>
  nnoremap <silent> çlang2 :
        \:let current_ime_mode = 0<CR>
        \:hi FoldColumn ctermbg=16<CR>
  inoremap <silent> çlang1 <C-o>:
        \:let current_ime_mode = 1<CR>
  inoremap <silent> çlang2 <C-o>:
        \:let current_ime_mode = 0<CR>

