nnoremap <silent> <C-f>
            \ :Defx<CR>

autocmd initvim FileType defx setlocal nonu
autocmd initvim FileType defx setlocal foldcolumn=0
autocmd initvim FileType defx nmap <buffer> <C-l> <Nop>
autocmd initvim FileType defx nmap <buffer> <C-h> <Nop>

autocmd initvim FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

    " explorer operations
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> l
                \ defx#is_directory() ?
                \ defx#do_action('open') :
                \ defx#do_action('multi', ['quit', 'drop'])
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_or_close_tree', 'recursive:0')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> s
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> a
                \ defx#do_action('toggle_ignored_files')



    nnoremap <silent><buffer><expr> .
                \ defx#do_action('cd', [substitute(expand("%:p"), "/[^/]*$", "", "g")])
    nnoremap <silent><buffer><expr> g
               \ defx#do_action('cd', [system('git rev-parse --show-toplevel 2> /dev/null')[:-2]])
    nnoremap <silent><buffer><expr> %
                \ defx#do_action('cd', tmp)
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')

    " 
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')

    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'Time')

    " file operations
    nnoremap <silent><buffer><expr> Y
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_multiple_files')


    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:filename:type:size:time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    " nnoremap <silent><buffer><expr> <C-l>
                "\ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')

    nnoremap <silent><buffer><expr> >
                \ defx#do_action('resize', defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> <
                \ defx#do_action('resize', defx#get_context().winwidth - 10)

    nnoremap <silent><buffer><expr> P
                \ defx#do_action('preview', [])

    " close preview window when defx is hidden
    autocmd! BufHidden \[defx\]* pclose

endfunction


" Like Textmate icons.
call defx#custom#column('mark', {
            \ 'directory_icon': '▸',
            \ 'readonly_icon': '✗',
            \ 'selected_icon': '✓',
            \ })

" Layout at startup.
call defx#custom#option('_', {
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

