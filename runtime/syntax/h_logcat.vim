" Vim syntax file
" Language:         h_logcat
" Maintainer:       natsume6075
" Latest Revision:  2022-03-08

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Define color palette
hi def LogI_color ctermfg=blue guifg=blue
hi def LogD_color ctermfg=darkgreen guifg=darkgreen
hi def LogV_color ctermfg=gray guifg=gray

" Define common words
syn keyword boolean true false Enable Disable enable disable
syn match float "\<\d\+\(\.\d\+\)*\>"
syn match string "\"\w*\""

" Define file name
syn match File '\w*[a-zA-Z]\w*\(\.\w\+\)\+'

" Define error levels
syn match LogF ' F '
syn match LogE ' E '
syn match LogW ' W '
syn match LogI ' I '
syn match LogD ' D '
syn match LogV ' V '

" Define time stamp
syn match Time '^[0-9|-]* [0-9|:|.]*'

" developmental keyword
syn keyword keyword_ppp getDataSharingParameter DataSharingSettingAllEnabled PrivacyActivity getShowDataSharingParameter PrivacyManagerService isPrivacyProtectionSupported checkUploadPermission
syn keyword keyword_tsu TsuConnectionStateMachine

hi def link LogF ErrorMsg
hi def link LogE ErrorMsg
hi def link LogW WarningMsg
hi def link LogI LogI_color
hi def link LogD LogD_color
hi def link LogV LogV_color
hi def link Time NonText
hi def link File Type
hi def link boolean Boolean
hi def link keyword_ppp Keyword
hi def link keyword_tsu Keyword

