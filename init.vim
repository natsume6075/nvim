"
"                                          _ __ _,  ＿_
"                                      ,.-' 丶   '｀丶/
"                                    ／ ）     ￣     ＼
"                           _,..,_ /__／        r ―-､   ＼
"                        ／      ｀丶    ＿_    丶 ＿）  ヽ―-､_,
"                     _／             ＼/   ﾉ             | く ＼
"                    /                  ヽ￣              /  }￣
"                   /              _     |＿           ／   /
"                   |           ／  ｀ヽ.|  ｀ー---‐-´ __,ノ
"                  /           /   _＿  }ﾉ     __ -― ￣￣￣￣￣￣￣￣￣￣￣／＿＿＿
"                ／        ＿／  /￣     /   ,-                                  ／|
"               /     .／￣           _//   / ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|  |
"              /  _ ／ _ ,-  __ , __-   |_,/￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣| |  |
"              (ｰ´_,.´     | |                                                | |  |/|
"                ￣        | |    |￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|    | |    |
"                          | |    |                                      |    | | /| |
"                          | |    |                                      |    | ||/| |
"                          | |･>>>|                                      |    | || | |
"                          | |    |                                      |    | ||/  |
"                          | |    |                                      |    | |    |
"                          | |    |                                      |    | |    |
"                          | |    |     なつめ の init.vim               |    | |    |
"                          | |    |       かきこむ        たくわえる     |    | |    |
"                          | |    |       ニトロチャージ  とっておき     |    | |    |
"                          | |    |                                      |    | |    |
"                          | |    |                                      |    | |    |
"                          | |    |                                      |    | |    |
"                          | |    |                                      |    | |    |
"                          | |    |                                      |    | |    |
"                          | |    |＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿|    | |    |
"                          | |                                                | |    |
"                          | |                                                | |    |
"                          | |                                                | |    |
"                          | |                                                | |    |
"                          | |                                                | |    |
"                          | |                                                | |    |
"                          | |                                                | |    |
" ----------------------------------------------------------------------------------------------------

set nocompatible

let $XDG_CACHE_HOME = expand($HOME.'/.cache')
let $XDG_CONFIG_HOME = expand($HOME.'/.config')
let $XDG_DATA_DIRS = expand('/usr/local/share:/usr/share')
let $XDG_DATA_HOME = expand($HOME.'/.local/share')

set runtimepath+=$XDG_CONFIG_HOME/nvim/runtime/

let floating_win_width_percent =  0.9
let floating_win_height_percent = 0.9

augroup initvim
  autocmd!
augroup END

runtime! user/*.vim
runtime! plugins/*.vim

if IsWSL()
    runtime! user_local/wsl.vim
elseif has("mac")
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

" 以下は runtimepath に after/ が入っているので不要なはずだが...
runtime! after/*.vim

