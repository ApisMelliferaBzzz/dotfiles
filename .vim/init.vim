syntax on
"colorscheme luna
"colorscheme lucius
colorscheme one-modded
"irlineTheme lucius
"mtom/tlib_vim"
autocmd vimenter
set mouse=a
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

set guifont=Roboto\ Mono\ Regular\ 11
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set autochdir
set nocompatible
set number
set laststatus=2
filetype off  "обязательно!

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()

filetype plugin indent on
" обязательно!

nnoremap <F5> :BuffergatorOpen<CR>

function LessToCss()
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "silent !lessc " . current_file . " " . filename . ".css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss()


autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" " buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
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
"Plugin 'Shougo/vimfiler.vim'
Plugin 'jiangmiao/auto-pairs'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'jeetsukumaran/vim-buffergator'
"Bundle 'genoma/vim-less'

let g:airline#extensions#airline#enabled = 1
let g:airline#extensions#airline#left_sep = '>'
"let g:airline#extensions#airline#left_alt_sep = '>'
let g:airline_theme='custom'
"Plugin 'git://github.com/Lokaltog/powerline.git'

let g:buffergator_autodismiss_on_select = 0
let g:buffergator_display_regime = "bufname"
let g:buffergator_sort_regime    = "filepath"
let g:buffergator_autoupdate = 1
let g:buffergator_viewport_split_policy = "B"

set termguicolors
"set showtabline=2
let g:airline_powerline_fonts = 1

hi CursorLine cterm=NONE
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
