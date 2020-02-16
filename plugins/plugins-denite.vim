
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  " filtering ウィンドウを開く
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  " Denite を閉じる
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
endfunction

