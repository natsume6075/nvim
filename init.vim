runtime! user/*.vim

if has("mac")
    runtime! user_local/mac.vim
elseif has("unix")
    runtime! user_local/unix.vim
elseif has("win64")
    runtime! user_local/win64.vim
elseif has("win32unix")
    runtime! user_local/win32unix.vim
elseif has("win32")
    runtime! user_local/win32.vim
endif
