nnoremap <silent> <C-s>
           \ :Defx<CR>

autocmd initvim FileType defx setlocal nonu
autocmd initvim FileType defx setlocal foldcolumn=0
autocmd initvim FileType defx nmap <buffer> <C-l> <Nop>
autocmd initvim FileType defx nmap <buffer> <C-h> <Nop>

autocmd initvim FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

    " Explorer operations
    nnoremap <silent><buffer><expr> j
                \                       line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \                       line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> h
                \                       defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> l
                \                       defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['quit', 'drop'])
    nnoremap <silent><buffer><expr> o
                \                       defx#is_directory() ? defx#do_action('open_or_close_tree', 'recursive:0')  : defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> O
                \                       defx#is_directory() ? defx#do_action('open_or_close_tree', 'recursive:10') : defx#do_action('multi', ['close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree'])
    nmap     <silent><buffer><expr> s
                \                       defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \                       defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> <ESC>
                \                       defx#do_action('clear_select_all') . '<ESC>'
    nnoremap <silent><buffer><expr> p
                \                       defx#do_action('preview', [])
    " nnoremap <silent><buffer><expr> f
    "            \                       defx#do_action('search', 'defx')

    " Information to display
    nnoremap         <buffer><expr> -a
                \                       defx#do_action('toggle_ignored_files')
    nnoremap         <buffer><expr> -l
                \                       defx#do_action('toggle_columns', 'mark:indent:icon:filename')
    nnoremap         <buffer><expr> -sn
                \                       defx#do_action('toggle_sort', 'filename') . defx#do_action('redraw')
    nnoremap         <buffer><expr> -ss
                \                       defx#do_action('toggle_sort', 'size') . defx#do_action('redraw')
    nnoremap         <buffer><expr> -st
                \                       defx#do_action('toggle_sort', 'time') . defx#do_action('redraw')
    nnoremap         <buffer><expr> -se
                \                       defx#do_action('toggle_sort', 'extension') . defx#do_action('redraw')

    " Directory operations TODO
    nnoremap         <buffer><expr> cwd
                \                       defx#do_action('change_vim_cwd')
    nnoremap         <buffer><expr> cd.
                \                       defx#do_action('cd', [substitute(expand("%:p"), "/[^/]*$", "", "g")])
    nnoremap         <buffer><expr> cd~
                \                       defx#do_action('cd')
    nnoremap         <buffer><expr> cd%
               \                       defx#do_action('cd', current_dir)
    nnoremap         <buffer><expr> cdg
                \                       defx#do_action('cd', [system('git rev-parse --show-toplevel 2> /dev/null')[:-2]])

    " File operations
    nnoremap <silent><buffer><expr> N
                \                       defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> Y
                \                       defx#do_action('copy')
    nnoremap <silent><buffer><expr> M
                \                       defx#do_action('move')
    nnoremap <silent><buffer><expr> P
                \                       defx#do_action('paste')
    nnoremap <silent><buffer><expr> D
                \                       defx#do_action('remove')
    nnoremap <silent><buffer><expr> R
                \                       defx#do_action('rename')

    " advanced
    nnoremap <silent><buffer><expr> yy
                \                       defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> !
                \                       defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \                       defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> ;
                \                       defx#do_action('repeat')
    nnoremap         <buffer><expr> <C-l>
               \                       defx#do_action('redraw')

    " appearance
    nnoremap <silent><buffer><expr> >
                \                       defx#do_action('resize', defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> <
                \                       defx#do_action('resize', defx#get_context().winwidth - 10)

    " close preview window when defx is hidden
    autocmd! BufHidden \[defx\]* pclose
    " autocmd! BufWinLeave * isFloating then bufferから消す

    " auto preview
    " autocmd! CursorMoved <buffer> call defx#call_action("preview", [])


endfunction


" Like Textmate icons.
call defx#custom#column('mark', {
            \ 'directory_icon': '▸',
            \ 'readonly_icon': '✗',
            \ 'selected_icon': '✓',
            \ })

" Layout at startup.
call defx#custom#option('_', {
            \ 'columns': 'git:mark:indent:icon:filename:type:size:time',
            \ 'sort': 'filename',
            \ 'split': 'floating',
            \ 'vertical_preview': v:true,
            \ 'floating_preview': v:true,
            \ 'preview_width': float2nr(&columns * g:floating_win_width_percent / 2),
            \ 'preview_height': float2nr(&lines * g:floating_win_height_percent),
            \ 'wincol': float2nr((&columns - (&columns * g:floating_win_width_percent)) / 2),
            \ 'winrow': float2nr((&lines - (&lines * g:floating_win_height_percent)) / 2),
            \ 'winwidth': float2nr(&columns * g:floating_win_width_percent / 2),
            \ 'winheight': float2nr(&lines * g:floating_win_height_percent),
            \ 'show_ignored_files': 1,
            \ 'buffer_name': 'exlorer',
            \ 'toggle': 1,
            \ 'resume': 1,
            \ })

