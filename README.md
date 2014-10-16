## 最新の手順に組み込むもの
* pip install
* ghq
* submodule (oh-my-zsh etc.)

### homesick
1. (sudo) gem install homesick
1. xcode-select --install
1. homesick clone yuuki-arc/dotfiles
1. cd ~ && homesick symlink dotfiles
1. git submodule update --init home/.zsh.d/.oh-my-zsh

### homesick (option)
1. cd ~/.homesick/repos/dotfiles
1. git config remote.origin.url

### homebrew
1. ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
1. brew doctor

### brew-cask
1. sh home/brewfile.sh

### zsh / zsh-completions
1. ~~brew install zsh --disable-etcdir~~
1. ~~brew install zsh-completions~~
1. sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
1. cat /etc/shells
1. chsh -s /usr/local/bin/zsh

(ここまで想定通りに進むことを確認）

### Xcode (+Cocos2d-x)

#### Xcode
```sh
$ curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh
$ ghq get mduvall/flatland-xcode
$ mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes 
$ cp Flatland.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/

XCodeを起動してテーマ変更＆フォントMenlo 13pt
```

#### Cocos2d-x templates
```sh
$ ghq get anzfactory/XcodeTemplates
$ mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates
$ cp -r cocos2d-x\ v2.2.x ~/Library/Developer/Xcode/Templates/File\ Templates/
$ cp -r cocos2d-x\ v3.0.x ~/Library/Developer/Xcode/Templates/File\ Templates/
```

#### phpenv
```sh
$ git clone https://github.com/laprasdrum/phpenv.git ~/.phpenv
```

## インストール（旧手順）
### homebrew
1. ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
1. brew doctor
1. http://xquartz.macosforge.org/landing/ からdmgファイルをダウンロードしてインストール
1. sudo chown -R $USER /usr/local

### zsh
1. brew install --disable-etcdir zsh
1. sudo mv /etc/zshenv /etc/zprofile
1. sudo vi /etc/shells
1. 最後の行に追加  
   /usr/local/bin/zsh
1. chsh -s /usr/local/bin/zsh
1. chsh
1. 以下の行があればOK  
   Shell: /usr/local/bin/zsh

### zsh-completions
1. brew install zsh-completions
1. cd /usr/local/share/zsh/site-functions
1. ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh _brew
1. rm -f ~/.zcompdump

### zsh-syntax-highlighting
1. brew install zsh-syntax-highlighting
1. .zshrc のファイル最後に以下の行を追加  
   source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### git
1. brew install git
1. export PATH=/usr/local/bin:/usr/bin:$PATH
1. wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight ~/bin
1. chmod +x ~/bin/diff-highlight

### go
1. brew install go

### dotfiles
1. cd $HOME
1. git clone
1. sh -x ./dotfiles/setup.sh

### gem
1. git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src

### vim
1. brew install vim --with-python --with-ruby --with-perl

### vim - NeoBundleInstall
1. git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
1. :NeoBundleInstall

### tmux (+powerline)
1. brew tap homebrew/dupes
1. brew install homebrew/dupes/grep
1. brew unlink python
1. sudo easy_install pip
1. sudo chown $USER /usr/local/bin/pip*
1. pip install --user git+git://github.com/Lokaltog/powerline
1. mkdir ~/.config
1. cp -R ~/Library/Python/2.7/lib/python/site-packages/powerline/config_files ~/.config/powerline
1. brew link --override python
1. fc-cache -f
1. ~/.fonts/にあるRicty ... for Powerline.ttf をopenしてインストール
1. iTerm2の環境設定でフォントを選択
