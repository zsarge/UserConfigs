"" Color Scheme:
" colors elflord
"" disabled because of gruvbox

" set line endings
set ff=dos

set noexpandtab
" set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

" display whitespace
set listchars=eol:¬,tab:>-,nbsp:⎵,trail:~,space:_,extends:>,precedes:<

set scrolloff=10
set number

" bracket autocomplete
" inoremap { {<CR>}<Esc>ko

inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" Nerd tree settings
"" rebind ctrl + n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeShowHidden=1

" Nerd commenter settings
"" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let mapleader = ","

" Gruvbox settings
autocmd vimenter * colorscheme gruvbox
set background=dark    " Setting dark mode

" Install Plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugs 
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()
