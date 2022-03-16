" maintain cursor position
autocmd initvim BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
autocmd initvim BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")

" init.vim を保存したときにリロード
autocmd initvim BufWritePost $XDG_CONFIG_HOME/nvim/init.vim so $XDG_CONFIG_HOME/nvim/init.vim

" デフォルト設定の textwidth 設定上書き
autocmd initvim VimEnter * setlocal textwidth=0

" *.fish => filetype=sh
autocmd initvim BufNewFile,BufRead *.fish setfiletype sh

" terminal を insert mode ではじめる
autocmd TermOpen * startinsert
" terminal にはいったら insert mode にする
" autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif

