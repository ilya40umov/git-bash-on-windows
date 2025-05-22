" -----------------------------------------------------------------
" VimPlug
"
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" -----------------------------------------------------------------
" Vim settings
"

" Allows to re-use the same window and switch from an unsaved buffer without saving it first.
set hidden

" Instead of failing a command because of unsaved changes, 
" raise a dialogue asking if you wish to save changed files.
set confirm

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Preserve undo info on quit
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000

" Show no folding
set foldcolumn=0

" Default identation
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab

" YAML documents are required to have a 2 space indentation. However, Vim does not set this by default.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Deal with the screen blicking in VIM
set belloff=all

" -----------------------------------------------------------------
"  Color scheme

" Enable RGB colors
set termguicolors
" Use 'one' color scheme
colorscheme one
set background=dark
autocmd! ColorScheme * hi VertSplit ctermbg=59

" -----------------------------------------------------------------
" NERDTree
" https://github.com/preservim/nerdtree
"

" Quit vim if NERDTree is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcuts
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
