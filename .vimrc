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

" ruby autocomplete

" bracket autocomplete
" inoremap { {<CR>}<Esc>ko

inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko

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

" Fix green lines that show up on some terminal settings
map <C-k> k<C-l>

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
Plug 'farmergreg/vim-lastplace'
Plug 'vim-autoformat/vim-autoformat'
Plug 'triglav/vim-visual-increment'

call plug#end()
