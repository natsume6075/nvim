" Vim syntax file
" Language:         logcat
" Maintainer:       Atsuyuki Natsume
" Latest Revision:  2022-03-03

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Define color palette
hi def LogF_color ctermfg=white guifg=white ctermbg=red guibg=red
hi def LogE_color ctermfg=red guifg=red
hi def LogW_color ctermfg=brown guifg=brown
hi def LogI_color ctermfg=blue guifg=blue
hi def LogD_color ctermfg=darkgreen guifg=darkgreen
hi def LogV_color ctermfg=gray guifg=gray


" Define number
syn match Number '\W\d*\W'

" Define error levels
syn match LogF ' F '
syn match LogE ' E '
syn match LogW ' W '
syn match LogI ' I '
syn match LogD ' D '
syn match LogV ' V '

" Define time stamp
syn match Time '^[0-9|-]* [0-9|:|.]*'

" Define file name
syn match File '\u\w*\.\w*'


hi def link Number Number
" hi def link LogF LogF_color
" hi def link LogE LogE_color
" hi def link LogW LogW_color
hi def link LogI LogI_color
" hi def link LogD LogD_color
" hi def link LogV LogV_color
hi def link Time Comment
hi def link File Type

