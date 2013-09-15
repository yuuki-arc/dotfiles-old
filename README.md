## インストール
### homebrew
1. ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
1. brew doctor
1. http://xquartz.macosforge.org/landing/ からdmgファイルをダウンロードしてインストール
1. sudo chown -R $USER /usr/local

### zsh
1. brew install --disable-etcdir zsh
1. sudo vi /etc/shells
1. 最後の行に追加  
   /usr/local/bin/zsh
1. chpass -s /usr/local/bin/zsh
1. chpass
1. 以下の行があればOK  
   Shell: /usr/local/bin/zsh
1. sudo cp /usr/local/Cellar/zsh/5.0.2/lib/zsh/pcre.so /usr/lib/zsh/4.3.11/zsh

### zsh-completions
1. brew install zsh-completions
1. cd /usr/local/share/zsh/site-functions
1. ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh _brew
1. rm -f ~/.zcompdump

### git
1. brew install git
1. export PATH=/usr/local/bin:/usr/bin:$PATH

### dotfiles
1. cd $HOME
1. git clone
1. sh -x ./dotfiles/setup.sh

### vim
1. brew install vim --with-python --with-ruby --with-perl

### vim - NeoBundleInstall
1. git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
1. :NeoBundleInstall

### tmux 
1. brew tap homebrew/dupes
1. brew install homebrew/dupes/grep
1. brew unlink python
1. sudo easy_install pip
1. pip install --user git+git://github.com/Lokaltog/powerline
1. mkdir ~/.config
1. git clone https://github.com/Lokaltog/powerline ~/.config/
1. brew link --override python
1. fc-cache -f
1. ~/.fonts/にあるRicty ... for Powerline.ttf をopenしてインストール
1. iTerm2の環境設定でフォントを選択


