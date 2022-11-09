inoremap jk <ESC>
runtime macros/matchit.vim
let mapleader = " "
filetype plugin indent on
syntax on

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" Disable alt menu keys
set winaltkeys=no

" Go to next window
nnoremap <C-u> <C-w>w<CR>

nnoremap <C-w> :w<CR>
nnoremap <C-s> :x<CR>
nnoremap <C-q> :q<CR>

" Change window with Alt+key
nnoremap <silent> ë :wincmd h<CR>
nnoremap <silent> ê :wincmd l<CR>
nnoremap <silent> è :wincmd j<CR>
nnoremap <silent> ì :wincmd k<CR>

" file explorer
nnoremap <Leader>da :Lexplore<CR>
nnoremap <Leader>dd :Lexplore %:p:h<CR>

" tab keyboard shorcuts
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-j> gT
nnoremap <C-k> gt

" For Cutlass plugin - use s to cut
nnoremap s d
xnoremap s d
nnoremap ss dd
nnoremap S D

" Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

nnoremap <Leader>h :noh<CR>

set lines=45 columns=150
set guifont=Monospace\ 12

set number
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set complete-=i

set scrolloff=2
set sidescrolloff=5

set autoread

:winpos 212 42

let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3

" let g:ctrlp_show_hidden = 1

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> <Leader>dd :Lexplore<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

if (has("termguicolors"))
  set termguicolors
endif

call plug#begin()

  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'chriskempson/base16-vim'
 
  "Plug 'vhda/verilog_systemverilog.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'vimtaku/hl_matchit.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 

  Plug 'Raimondi/delimitMate'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-surround'
  Plug 'svermeulen/vim-cutlass'

call plug#end()

set background=dark
colorscheme base16-snazzy

