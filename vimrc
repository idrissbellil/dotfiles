" enable syntax
syntax enable


filetype plugin on

" highlight the screen line
set cul 

" highlight spelling mistake
" set spell

" Pattern to suggest corrections
set sps=best

" set line numbering
" set nu

" no vi compatibility
set nocp

" show match for partly typed search command
set is

" show status bar
set ru

" visual bell
set vb

" adjust case when completion
set inf

" tab number of spaces
set ts=2
set sw=2
set sts=2

" expad tab to spaces
set et

" set indent of new line
set ai

" clever autoindenting
" set si

" enable specific indenting for c code
set cin

" words that cause more c indent
set cinw=if,else,while,do,for,switch

" indenting as previous line
set ci
set pi

" end of line at last of file
set eol

" fix eol
set fixeol

" no backup
set nowb
set nobk

" automatically read when editted externally
set ar

" no swap file
set noswf

" show matches of commands
set wmnu
" ignore case
set ic

" wrap long lines
set wrap

" preserve intendation in wraped files
set bri
" let g:pymode_python = 'python3'
" let g:jedi#force_py_version=3

" filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let base16colorspace=256
set termguicolors

set ls=2
set nocompatible
filetype plugin on
syntax on

let g:jedi#show_call_signatures = "2"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
colorscheme base16-google-dark                                                                  
set guifont=consolas\ 9
set nu

set number
set relativenumber

autocmd! BufReadPost * :if line('$') > 20 | set foldenable | set foldlevel=0 | endif

set exrc
set secure

" Plugins will be downloaded under the specified directory.
" call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" List ends here. Plugins become visible to Vim after this call.
" call plug#end()

au BufRead /tmp/mutt-* set tw=72
