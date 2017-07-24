syntax on
"colorscheme luna
"colorscheme lucius
"irlineTheme lucius
"mtom/tlib_vim"
autocmd vimenter
"* VimFiler
"NERDTree
set cursorline
set background=dark
set list
set listchars=tab:\|\ ,trail:·,nbsp:·
set laststatus=2
"set showtabline=2
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '>'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_mode='a'
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"set guifont=Roboto\ Mono\ Regular\ 11
set guifont=Terminus\ 11
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set autochdir
"set nocompatible
"if &compatible
set nocompatible
"endif
"set rtp+=~/.config/nvim/dein
set number
set laststatus=2
filetype off  "обязательно!

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()
"call dein#begin('~/.vim/bundle')

"call dein#add('.config/nvim/dein/repos/github.com/Shougo')
"call dein#add('Shougo/neocomplete.vim')

filetype plugin indent on
" обязательно!

function LessToCss()
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "silent !lessc " . current_file . " " . filename . ".css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss()

" Less compile
"autocmd FileWritePost,BufWritePost *.less :call LessCSSCompress()
function! LessCSSCompress()
  let cwd = expand('<afile>:p:h')
  let name = expand('<afile>:t:r')
  if (executable('lessc'))
    cal system('lessc '.cwd.'/'.name.'.less > '.cwd.'/'.name.'.css &')
  endif
endfunction

Plugin 'gmarik/Vundle.vim'
"репозитории на github
Bundle 'tpope/vim-fugitive'
Bundle 'lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"репозитории vim/scripts
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'

"git репозитории (не на github)
Bundle 'git://git.wincent.com/command-t.git'
"локальные git репозитории(если работаете над собственным плагином)
"Bundle 'file:///Users/gmarik/path/to/plugin'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
"Bundle 'zhaocai/linepower.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/vimfiler.vim'
Plugin 'jiangmiao/auto-pairs'
"Plugin '/jiangmiao/auto-pairs/blob/master/plugin/auto-pairs.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
"Plugin 'airblade/vim-gitgutter'
Bundle 'genoma/vim-less'
"call dein#end()

"filetype plugin indent on


let g:airline#extensions#airline#enabled = 1
let g:airline_theme = 'custom'
colorscheme one
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#airline#left_sep = '>'
"let g:airline#extensions#airline#left_alt_sep = '>'
"let g:airline_theme='luna'
"Plugin 'git://github.com/Lokaltog/powerline.git'

"set showtabline=2
let g:airline_powerline_fonts = 1

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
