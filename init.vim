inoremap jk <ESC>
runtime macros/matchit.vim
let mapleader = " "
filetype plugin indent on
syntax on

nnoremap <C-w> :w<CR>
nnoremap <C-s> :x<CR>
nnoremap <C-q> :q<CR>

" For Cutlass plugin - use s to cut
nnoremap s d
xnoremap s d
nnoremap ss dd
nnoremap S D

" EasyMotion
nmap e <Plug>(easymotion-overwin-f)
nmap E <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

" set lines=45 columns=150

set number
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set complete-=i

set scrolloff=2
set sidescrolloff=5

set autoread

set signcolumn=yes
set updatetime=300

set autochdir

" Install vim-plug if not found
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'chriskempson/base16-vim'
 
  Plug 'vhda/verilog_systemverilog.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'vimtaku/hl_matchit.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 

  Plug 'Raimondi/delimitMate'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-surround'
  Plug 'svermeulen/vim-cutlass'

  Plug 'easymotion/vim-easymotion'

  "Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


