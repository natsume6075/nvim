" Vim syntax file
" Language:         h_logcat
" Maintainer:       natsume6075
" Latest Revision:  2022-03-08

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

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

" Define developmental keyword
syn keyword keyword_ppp getDataSharingParameter DataSharingSettingAllEnabled PrivacyActivity getShowDataSharingParameter PrivacyManagerService isPrivacyProtectionSupported checkUploadPermission setPrivacySettingValues getPrivacySettingValues setPrivacySettingList
syn keyword keyword_tsu TsuConnectionStateMachine


" Link syntax to highlight
hi def link LogF DiagnosticError
hi def link LogE DiagnosticError
hi def link LogW DiagnosticWarn
hi def link LogI DiagnosticInfo
hi def link LogD Debug
hi def link LogV DiagnosticHint

hi def link Time Comment
hi def link File Type
hi def link boolean Boolean
hi def link keyword_ppp Keyword
hi def link keyword_tsu Keyword

