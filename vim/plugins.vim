" Install Vim Plug if it doesn't already exist
if !filereadable($VIM_CONFIG_PATH.'/autoload/plug.vim')
  silent !curl -fLo $VIM_CONFIG_PATH/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Vim Plugins with Vim Plug
call plug#begin($VIM_CONFIG_PATH . '/plugged')
Plug 'ajh17/VimCompletesMe'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'krisajenkins/vim-projectlocal'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'shawncplus/phpcomplete.vim'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

