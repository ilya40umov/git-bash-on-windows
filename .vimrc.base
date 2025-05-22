"
" sensible.vim
"

set nocompatible
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set incsearch
set laststatus=2
set ruler
set wildmenu
set scrolloff=1
set sidescroll=1
set sidescrolloff=2
set display+=lastline
set display+=truncate
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set autoread
set history=1000
set tabpagemax=50
set sessionoptions-=options
set viewoptions-=options

"
" End of sensible.vim
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
