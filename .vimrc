" Plugins
call plug#begin('~/.vim/plugged')
  " NTH plugins
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'w0rp/ale'
  Plug 'itchyny/lightline.vim'

  " Language plugins
  Plug 'chemzqm/vim-jsx-improve'
  Plug 'elzr/vim-json'
  Plug 'hdima/python-syntax'
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'prettier/vim-prettier'
call plug#end()

:colorscheme jellybeans
filetype plugin indent on
syntax enable

set autoread
set expandtab
set hlsearch
set lazyredraw
set nocompatible
set noswapfile
set number
set smarttab
set undofile

set backspace=2
set encoding=UTF-8
set foldlevel=99
set foldmethod=indent
set guioptions-=e  " Don't use GUI tabline
set laststatus=2
set shiftwidth=2
set showtabline=2  " Show tabline
set softtabstop=2
set statusline+=%m%m%m
set tabstop=2
set timeoutlen=1000
set ttimeoutlen=0
set undodir=~/.vim/undodir

let g:netrw_liststyle=3
let g:jsx_ext_require=0
let &t_SI = "\033[5 q"
let &t_EI = "\033[1 q"

" ctrlp
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_working_path_mode='w'

" nerdtree
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" prettier
let g:prettier#autoformat = 0
let g:prettier#config#semi = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#print_width = 100

" Leaders
let mapleader=","
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>l :ALELint<CR>
nmap <Leader>d <Plug>(coc-definition)
autocmd filetype go nmap <Leader>d :GoDef<CR>
autocmd filetype go nmap <Leader>r :GoFmt<CR>
autocmd filetype go nmap <Leader>t :GoTest<CR>
nmap <Leader>m :s#_\(\l\)#\u\1#g<CR>

autocmd filetype javascript nmap <Leader>r :Prettier<CR>
autocmd filetype typescript nmap <Leader>r :Prettier<CR>
autocmd filetype svelte nmap <Leader>r :Prettier<CR>
autocmd filetype python nmap <Leader>r :Black<CR>
autocmd filetype python nmap <leader>db oimport ipdb; ipdb.set_trace()<Esc>

" ALE
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 1
let g:ale_linters_ignore = {'typescript': ['tslint', 'tsserver']}
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'svelte': ['eslint'],
  \}
let g:ale_fixers = {
  \'javascript': ['prettier'],
  \'python': ['black']
  \}
let g:black_skip_string_normalization = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let vim_markdown_preview_github=1

autocmd filetype crontab setlocal nobackup nowritebackup
nmap <Tab> :b#<CR>
