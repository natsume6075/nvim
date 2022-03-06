" deoplete/neosippet ---------------------
let g:neosnippet#snippets_directory='$XDG_CONFIG_HOME/nvim/my_snippets'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('min_pattern_length', 1)

" Right でトップ候補を保管 (fish意識)
imap <expr> <Right> pumvisible() ? "\<C-n>\<C-m>" : "\<Right>"

inoremap <expr> <S-TAB> deoplete#smart_close_popup()
imap <expr> <C-k> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
            \ pumvisible() ? Finite_increase_pum() :
            \ "\<Plug>(neosnippet_jump)"

" 一番上の expand できるキーワードでスニペットを展開する
function! Finite_increase_pum()"{{{
    if g:counter < 100
        let g:counter += 1
        return "\<C-n>"."\<C-k>"
    else
        let g:counter = 0
        return "\<S-TAB>"
    endif
endfunction
let counter = 0
"}}}

vmap <C-k>     <plug>(neosnippet_expand_target)

