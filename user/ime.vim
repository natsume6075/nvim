augroup ime

  function! Ime_off() abort
    if has('win64')
      echo "Someone please open the windows!"
    elseif has('mac')
      call system("osascript -e 'tell application \"System Events\" to key code 102' &")
    elseif has('unix')
      call system('AutoHotkeyU64.exe "$XDG_CONFIG_HOME/nvim/user_local/ime_off.ahk"')
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
      call system('AutoHotkeyU64.exe "$XDG_CONFIG_HOME/nvim/user_local/ime_on.ahk"')
    else
      echo "not defined"
    endif
  endfunction


  autocmd InsertLeave * call Ime_off()

  imap <silent>っj  <ESC>
  imap <silent>っｊ <ESC>
  imap <silent> jj  <ESC>

augroup END
