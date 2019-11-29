augroup initvim

  let g:current_ime_mode = 0

  function! Ime_off() abort
    if has('win64')
      echo "Someone please open the windows!"
    elseif has('mac')
      call system("osascript -e 'tell application \"System Events\" to key code 102' &")
    elseif has('unix')
      call system('AutoHotkeyU64.exe "/UserArea/J0129312/Documents/ime_off.ahk"')
    else
      echo "not defined"
    endif
  endfunction

  function! Ime_on() abort
    if has('win64')
      echo "Someone please open the Window(s)!"
    elseif has('mac')
      call system("osascript -e 'tell application \"System Events\" to key code 104' &")
    elseif has('unix')
      call system('AutoHotkeyU64.exe "/UserArea/J0129312/Documents/ime_on.ahk"')
    else
      echo "not defined"
    endif
  endfunction

  autocmd InsertEnter *
        \ if g:current_ime_mode == 1 |
        \   call Ime_on() |
        \ endif
  autocmd InsertLeave * call Ime_off()
  " autocmd InsertLeave *
        "\ if g:current_ime_mode == 1 |
        "\   call Ime_off() |
        "\ endif

  imap <silent>っj <ESC>
  imap <silent> jj <ESC>

  noremap  çlang1 <Nop>
  noremap! çlang1 <Nop>
  noremap  çlang2 <Nop>
  noremap! çlang2 <Nop>
  nnoremap <silent> çlang1 :
        \:call Ime_off()<CR>
        \:let current_ime_mode = 1<CR>
        \:hi FoldColumn ctermbg=black<CR>
  nnoremap <silent> çlang2 :
        \:let current_ime_mode = 0<CR>
        \:hi FoldColumn ctermbg=16<CR>
  inoremap <silent> çlang1 <C-o>:
        \:let current_ime_mode = 1<CR>
        \<C-o>:hi FoldColumn ctermbg=black<CR>
  inoremap <silent> çlang2 <C-o>:
        \:let current_ime_mode = 0<CR>
        \<C-o>:hi FoldColumn ctermbg=16<CR>

augroup END
