" Install Vim Plug if it doesn't already exist
let s:vim_plug_path = $VIM_CONFIG_PATH.'/autoload/plug.vim'
if empty(glob(s:vim_plug_path))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Vim Plugins with Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'ajh17/VimCompletesMe'
Plug 'beyondwords/vim-twig'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jiangmiao/auto-pairs'
Plug 'krisajenkins/vim-projectlocal'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

