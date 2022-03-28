" bottom に小さい split window を作り、フォーカスする。
function! OpenBottomBar() abort
    split
    wincmd j
    resize 20
endfunction

" bottom に小さい split window を作り、フォーカスする。
" terminal バッファがすでに存在するなら、それを開く。そうでないなら、terminal コマンドを打つ。
function! OpenSplitTerminal() abort
    call OpenBottomBar()

    " bufnr は、複数にマッチするときに -1 を返してしまうので2つ目を開いてしまっていてだめ。
    let termnr = bufnr("term://")
    if termnr == -1
        terminal
    else
        " buffer は、複数にマッチするときに開けないのでだめ。
        buffer term://*
    endif

endfunction

" カーソル位置と command line に打ち込む文字列を指定する
" Ref: http://d.hatena.ne.jp/osyo-manga/20130424/1366800441
" example:
"     vnoremap <expr> <Leader>sub Move_cursor_pos_mapping(":s/<C-r>0/<C-r>0<CURSOR>/g")
function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction
function! Move_cursor_pos_mapping(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

