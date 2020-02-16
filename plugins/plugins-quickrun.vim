
nnoremap <silent><leader>r :QuickRun<CR>  " キーマップの設定
let g:quickrun_config = get(g:, 'quickrun_config', {})

" let g:quickrun_config._ = {
"            \ 'outputter/error/success': 'buffer',
"            \ 'outputter/error/error': 'quickfix',
"            \ 'outputter/quickfix/open_cmd': 'copen',
"            \ 'runner': 'vimproc',
"            \ 'runner/vimproc/updatetime': 60,
"            \ 'hook/time/enable': 1
"            \ }


let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }


let g:quickrun_config.java = {
    \ 'input': 'input',
    \ 'runner': 'system'
    \ }

let g:quickrun_config.cpp = {
    \ 'command': 'g++-9',
    \ 'input': 'input',
    \ 'runner': 'system'
    \ }



