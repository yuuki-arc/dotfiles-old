#!/bin/sh

# ref. http://masutaka.net/chalow/2014-03-19-2.html

# prepare
brew tap phinze/homebrew-cask 
brew tap homebrew/versions
brew tap caskroom/homebrew-versions 
brew update 

# homebrew
brew install brew-cask
brew install android-sdk
brew install android-ndk
brew install ant
brew install apple-gcc42
brew install asciidoc
brew install autoconf
brew install cairo
brew install cmake
brew install cocot
brew install cscope
brew install docbook
brew install docbook-xsl
brew install fontconfig
brew install fontforge
brew install freetype
brew install gdbm
brew install gettext
brew install ghc
brew install git
brew install glib
brew install gmp
brew install gnu-getopt
brew install go
brew install gobject-introspection
brew install grep
brew install harfbuzz
brew install haskell-platform
brew install hub
brew install icu4c
brew install jpeg
brew install libevent
brew install libffi
brew install libpng
brew install libtiff
brew install macvim
brew install mecab
brew install mecab-ipadic
brew install memcached
brew install mysql55
brew install nkf
brew install openssl
brew install pango
brew install pcre
brew install pixman
brew install pkg-config
brew install python
brew install rbenv
brew install rbenv-gemset
brew install readline
brew install reattach-to-user-namespace
brew install redis
brew install rrdtool
brew install ruby-build
brew install sqlite
brew install ag
brew install tig
brew install tmux
brew install tree
brew install v8
brew install vim
brew install wget
brew install xmlto
brew install xz
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install doxygen
brew install libpng
brew install graphviz

#cask
brew cask install alfred
brew cask install bartender
brew cask install dropbox
brew cask install firefox
brew cask install bartender
brew cask install sourcetree
brew cask install iterm2
brew cask install appcleaner
brew cask install evernote
brew cask install filezilla

#cask (install specify)
brew cask install --caskroom=/Applications google-chrome

#cask (require password)
brew cask install karabiner
brew cask install totalfinder
brew cask install vagrant
brew cask install xquartz
