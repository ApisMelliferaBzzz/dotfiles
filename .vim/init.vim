syntax on
"colorscheme luna
"colorscheme lucius
colorscheme onemodded
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

let g:onedark_color_overrides = {
\ "red": { "gui": "#777777", "cterm": "204", "cterm16": "1" },
\ "dark_red": { "gui": "#F07178", "cterm": "196", "cterm16": "9" },
\ "green": { "gui": "#CCCCCC", "cterm": "114", "cterm16": "2" },
\ "yellow": { "gui": "#666666", "cterm": "180", "cterm16": "3" },
\ "dark_yellow": { "gui": "#555555", "cterm": "173", "cterm16": "11" },
\ "blue": { "gui": "#595959", "cterm": "39", "cterm16": "4" },
\ "purple": { "gui": "#AAAAAA", "cterm": "170", "cterm16": "5" },
\ "cyan": { "gui": "#BBBBBB", "cterm": "38", "cterm16": "6" },
\ "white": { "gui": "#999999", "cterm": "145", "cterm16": "7" },
\ "black": { "gui": "#0d0d0d", "cterm": "235", "cterm16": "0" },
\ "visual_black": { "gui": "NONE", "cterm": "NONE", "cterm16": "0" },
\ "comment_grey": { "gui": "#333333", "cterm": "59", "cterm16": "15" },
\ "gutter_fg_grey": { "gui": "#454545", "cterm": "238", "cterm16": "15" },
\ "cursor_grey": { "gui": "#111111", "cterm": "236", "cterm16": "8" },
\ "visual_grey": { "gui": "#222222", "cterm": "237", "cterm16": "15" },
\ "menu_grey": { "gui": "#222222", "cterm": "237", "cterm16": "8" },
\ "special_grey": { "gui": "#222222", "cterm": "238", "cterm16": "15" },
\ "vertsplit": { "gui": "#111111", "cterm": "59", "cterm16": "15" }
\}


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
