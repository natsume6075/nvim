let g:pluginrc_dir = g:vimrc_dir . '/plugins'
let s:dein_dir = g:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" install dein
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

let s:toml_file = g:pluginrc_dir . '/dein.toml'

let g:dein#auto_recache = 1

if dein#load_state(s:dein_dir)

  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)

  " core plugin
  " call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/denite.nvim')
  " call dein#add('Shougo/unite.vim')
  " call dein#add('rking/ag.vim')
  " " call dein#add('poppyschmo/deoplete-latex')
  " " call dein#add('Shougo/neco-syntax')
  " " call dein#add('Shougo/neco-vim')
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  " call dein#add('kristijanhusak/defx-git')
  " 
  " call dein#add('Shougo/deol.nvim')
  " call dein#add('thinca/vim-quickrun')
  " call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  " 
  " call dein#add('osyo-manga/vim-anzu')
  " " call dein#add('bronson/vim-trailing-whitespace')
  " 
  " call dein#add('kannokanno/previm')
  " call dein#add('iamcco/markdown-preview.vim')
  " call dein#add('scrooloose/nerdcommenter')
  " call dein#add('tyru/open-browser.vim')
  " 
  " call dein#add('jonathanfilip/vim-lucius')
  " call dein#add('KeitaNakamura/tex-conceal.vim')
  " " call dein#add('kakkyz81/evervim')
  " 
  " " --- colorschemes --- "
  " call dein#add('ujihisa/unite-colorscheme')
  " call dein#add('flazz/vim-colorschemes')
  " call dein#add('altercation/vim-colors-solarized')
  " call dein#add('yasukotelin/shirotelin')
  " call dein#add('whatyouhide/vim-gotham')
  " call dein#add('ulwlu/elly.vim')
  " 
  " " call dein#add('vim-jp/vimdoc-ja')
  " " call dein#add('thinca/vim-ft-help_fold')
  " call dein#add('tpope/vim-fugitive')
  " call dein#add('airblade/vim-gitgutter')
  " 
  " call dein#add('LeafCage/foldCC.vim')
  " 
  " call dein#add('lervag/vimtex')
  " call dein#add('tpope/vim-surround')
  " call dein#add('mattn/calendar-vim')
  " 
  " " --- language specific --- "
  " call dein#add('plasticboy/vim-markdown')
  " call dein#add('dhruvasagar/vim-table-mode')

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


if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" call map(dein#check_clean(), "delete(v:val, 'rf')")

