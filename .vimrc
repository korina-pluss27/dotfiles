" Plugins
call plug#begin('~/.vim/plugged')
  " NTH plugins
  Plug 'preservim/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'dense-analysis/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-vinegar'

  " Language plugins
  Plug 'prettier/vim-prettier'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'elzr/vim-json'

  Plug 'sheerun/vim-polyglot'

call plug#end()

" lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'relativepath', 'custom_modified' ] ],
      \   },
      \ 'component_function' : {
      \   'custom_modified' : 'LightlineModified'
      \   }
      \ }

function! LightlineModified ()
  let modified = &modified ? '!!!!!' : ''
    return modified
endfunction

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
:colorscheme jellybeans
filetype plugin indent on
syntax enable

set t_Co=256
set background=dark
set noshowmode
set noswapfile
set autoread
set hlsearch
set lazyredraw
set number
set smarttab
set undofile
set undodir=~/.vim/undodir
set incsearch
set backspace=2
set encoding=UTF-8
set foldlevel=99
set foldmethod=indent
set laststatus=2
set expandtab
set shiftwidth=2
set timeoutlen=1000
set ttimeoutlen=0

let g:jsx_ext_require=0
" set cursor shape in different modes
let &t_SI = "\033[5 q"
let &t_EI = "\033[1 q"
" set highlight color for extra whitespace
let g:better_whitespace_ctermcolor='white'

" nerdcommenter
let g:NERDSpaceDelims = 1

" nerdtree
let NERDTreeMinimalUI = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeStatusline = -1

" prettier
let g:prettier#autoformat = 0
let g:prettier#config#semi = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#print_width = 100

" Leaders
let mapleader=","
" toggle comment
nmap <Leader>q <Plug>NERDCommenterToggle<CR>
" toggle nerdtree
nmap <Leader>n :NERDTreeToggle<CR>
" go to code definition
nmap <Leader>d <Plug>(coc-definition)
" go back to previous buffer
nmap <Tab> :b#<CR>
" run prettier
autocmd filetype javascript nmap <Leader>r :Prettier<CR>
autocmd filetype typescript nmap <Leader>r :Prettier<CR>

" ALE
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 1
let g:ale_linters = {
  \ 'javascriptreact': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'python': ['flake8'],
  \}
let g:ale_fixers = {
  \ 'javascriptreact': ['prettier'],
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \}

