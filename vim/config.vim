" Allows another file to be opened without writing the existing file first
set hidden
" Size of the command history to remember
set history=1000
" Allow per-project .vimrc files
set exrc
" Only allow shell and write commands in per-project .vimrc files if the file
" is owned by us.
set secure
set encoding=utf-8

" Turn on filetype detection
filetype on
" Turn on syntax highlighting
syntax on
" Turn on filetype-specific indentation
filetype indent plugin on

" Highlight search results
set hlsearch

" Incrementally search
set incsearch

" Ignore case when searching with lower-case
set ignorecase
set smartcase

" Indentation
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Line numbers
set nu
set ruler

" Copy to and from the system clipboard
set clipboard=unnamedplus

" Enable persistent undo.
set undofile
set undodir=~/.vim-undo
set undolevels=1000
set undoreload=10000

" Show matching brakcets
set showmatch

" Auto-reload ~/.vimrc on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Automatically remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Colour scheme from https://github.com/morhetz/gruvbox
colorscheme gruvbox
set background=dark

" Nerd Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-\> :NERDTreeToggle %<CR>

" ProjectLocal
let g:projectlocal_project_markers = ['.git', '.vimrc', 'package.json']

" Vim Markdown
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" Status line
set statusline+=%{gutentags#statusline()}

" Gutentags
let g:gutentags_define_advanced_commands=1

" Keyboard shortcuts
" Clear search result highlights
nnoremap <silent> <leader>/ :noh<return>

" Custom commands
command! ESLintFix !npx eslint --fix %
