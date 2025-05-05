" Basic Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " VI compatible mode is disabled so that VIm things work
set shortmess+=I " Disable the default Vim startup message

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set ruler               " show the cursor position all the time
syntax on               " turn on syntax highlighting
" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>
set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype indent on      " load filetype specific indent files
set autoindent
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    " Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=12        " Keep cursor in approximately the middle of the screen

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
nmap Q <Nop>

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python


" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
let g:molokai_original = 0

" Keymapping
let mapleader = " "
inoremap jj <esc>


" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
" find the current file in NERDTree
nnoremap <Leader>f :NERDTreeFind<CR>

" fugitive
nnoremap <Leader>g :Git<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

let g:ctrlp_switch_buffer = 'et'

" Ignore files for completion
set wildignore+=*/tmp/*,*/.git/*,*/tmp/*,*.swp,*.zip,*.so  " Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe              " Windows

" Exclude files and directories
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Local customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
