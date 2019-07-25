" Install Vim Plug if it doesn't already exist
if !filereadable($VIM_CONFIG_PATH.'/autoload/plug.vim')
  silent !curl -fLo $VIM_CONFIG_PATH/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Vim Plugins with Vim Plug
call plug#begin($VIM_CONFIG_PATH . '/plugged')
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'francoiscabrol/ranger.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'rbgrouleff/bclose.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'w0rp/ale'
call plug#end()

