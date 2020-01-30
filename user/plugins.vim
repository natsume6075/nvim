set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$XDG_CACHE_HOME/dein')

  " コメントアウト外したら以下のコマンドを実行する
  " :call dein#recache_runtimepath()

  call dein#begin('$XDG_CACHE_HOME/dein')

  " Let dein manage dein
  call dein#add('$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim')

  " core plugin
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/unite.vim')
  " call dein#add('poppyschmo/deoplete-latex')
  " call dein#add('Shougo/neco-syntax')
  " call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/deol.nvim')

  call dein#add('osyo-manga/vim-anzu')
  " call dein#add('bronson/vim-trailing-whitespace')


  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('iamcco/markdown-preview.vim')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('tyru/open-browser.vim')

  call dein#add('jonathanfilip/vim-lucius')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('ujihisa/unite-colorscheme')
  call dein#add('KeitaNakamura/tex-conceal.vim')
  call dein#add('kakkyz81/evervim')
  call dein#add('tyru/caw.vim')
  call dein#add('altercation/vim-colors-solarized')

  " call dein#add('powerline/fonts')
  " call dein#add('Lokaltog/vim-powerline')
  call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')
  " call dein#add('vim-jp/vimdoc-ja')
  " call dein#add('thinca/vim-ft-help_fold')
  call dein#add('tpope/vim-fugitive')
  call dein#add('LeafCage/foldCC.vim')

  call dein#add('lervag/vimtex')
  call dein#add('cohama/lexima.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('jceb/vim-orgmode')
  call dein#add('mattn/calendar-vim')
  call dein#add('dhruvasagar/vim-table-mode')

  " Required :
  call dein#end()
  call dein#save_state()
endif

" Required :
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()

endif

let g:dein#auto_recache = 1

call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1

" call map(dein#check_clean(), "delete(v:val, 'rf')")
