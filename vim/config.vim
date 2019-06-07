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

" Ensure :w triggers watch events
set backupcopy=yes

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

" Colour scheme
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

" FZF
let g:fzf_buffers_jump = 1

" ranger.vim
let g:ranger_replace_netrw = 1

" ProjectLocal
let g:projectlocal_project_markers = ['.git', '.vimrc', 'package.json']

" Vim Markdown
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" Deoplete
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Custom functions
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" Keyboard shortcuts
" Clear search result highlights
nnoremap <silent> <leader>/ :noh<return>

" Show file list with FZF
map <C-p> :Files<CR>

" Ranger at the current location
map <C-\> :Ranger<CR>

" Search uses of the word under the cursor
nnoremap <leader>t :call fzf#vim#tags(expand('<cword>'))<return>
" Search uses of the selected text
command! SelectedTextTags call fzf#vim#tags(s:get_visual_selection())
vnoremap <leader>t :<C-U>SelectedTextTags<return>

" Search for filenames matching the name under the cursor
nnoremap <leader>gf :call fzf#vim#files(expand('<cword>'))<return>
" Search for files with the selected text
command! SelectedTextFiles call fzf#vim#files(s:get_visual_selection())
vnoremap <leader>gf :<C-U>SelectedTextFiles<return>

" Insert a new line without leaving normal mode
nnoremap <leader><return> i<return><esc>
