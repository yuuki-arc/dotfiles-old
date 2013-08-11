" neobundle.vim
set nocompatible
"set rtp+=~/.config/powerline/powerline/bindings/vim/plugin/powerline.vim
set rtp+=/Users/colors/.config/powerline/powerline/bindings/vim/plugin/powerline.vim
 

filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/vim-scripts/taglist.vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/vim-scripts/TwitVim.git'
NeoBundle 'taichouchou2/alpaca_powertabline'

let g:Powerline_symbols = 'fancy'

filetype plugin on
filetype indent on
