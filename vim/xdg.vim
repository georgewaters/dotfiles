let s:cache_path = exists($XDG_CACHE_HOME) ? $XDG_CACHE_HOME . '/vim' : $HOME . '/.cache/vim'

" Swap cache
if !isdirectory(s:cache_path . '/swap')
  call mkdir(s:cache_path . '/swap', 'p')
endif
set directory=s:cache_path/swap//
execute 'set directory=' . escape(s:cache_path, '') . '/swap//'

" Backup cache
if !isdirectory(s:cache_path . '/backup')
  call mkdir(s:cache_path . '/backup', 'p')
endif
execute 'set backupdir=' . escape(s:cache_path, '') . '/backup//'

" Double slash does not actually work for backupdir, here's a fix
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')

" Undo cache - see :help persistent-undo
if !isdirectory(s:cache_path . '/undo')
  call mkdir(s:cache_path . '/undo', 'p')
endif
execute 'set undodir=' . escape(s:cache_path, '') . '/undo//'
set undofile

set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
let g:netrw_home=$XDG_CACHE_HOME . '/vim'
