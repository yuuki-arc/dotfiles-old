## 1. セットアップ準備

### SSH公開鍵
githubからセットアップ情報を取得するのでSSH接続するため鍵の作成を行う。  
参考: https://help.github.com/articles/generating-ssh-keys/

#### 作成

```console
$ ssh-keygen -t rsa -C hoge@hoge.com -f ~/.ssh/github_rsa
※passphraseは空でいいので何も入力しないでそのままEnterを押す

$ cat ~/.ssh/github_rsa.pub >> ~/.ssh/authorized_keys
$ chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
$ echo "IdentityFile ~/.ssh/github_rsa" >> ~/.ssh/config
```

#### SSH公開鍵をgithubに登録

```console
$ pbcopy < ~/.ssh/github_rsa.pub
```

githubの[SSH keys](https://github.com/settings/ssh)ページで **Add SSH Key** ボタンで登録

### Xcode関連のインストール
この後のdotfiles環境構築するにあたって、
Xcode及びCommand Line Toolsが入っていることが前提となるため事前にインストールする。

```console
$ xcode-select --install
$ sudo xcodebuild -license
※ `license agreements` が表示されるので `agree` を入力してEnterを押す
```

## 2. dotfilesをベースに環境構築

### homesickインストール
homesickを使ってdotfilesをローカルにクローンする。

```console
$ sudo gem install homesick
$ homesick clone git@github.com:yuuki-arc/dotfiles.git ※SSHで取得するため
$ homesick symlink dotfiles
```

### Brew-fileでアプリの一括インストール
homebrewパッケージ管理には[Brew-file](https://github.com/rcmdnk/homebrew-file)を使っているので
下記の手順でインストールする。
※homebrewとbrew-caskはBrew-fileのインストールと同時に入るため明示的に入れなくてもOK。

```console
$ curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh |sh
$ brew file set_repo -r yuuki-arc/Brewfile
$ export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
$ brew file update
```

下記の点に関しては今後の改善材料。
* 依存関係でひっかかるアプリがあるのでその都度個別に `brew install` しないといけない
* サービスの自動起動設定(※)は個別に行う

#### ※ サービスの自動起動設定
```
ln -sfv /usr/local/opt/mysql55/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/jenkins/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
```

### シェルをzshに切り替え
これまでの手順で必要なものは揃ってるので下記のコマンドをうてばOK。

```console
$ sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
$ cat /etc/shells
$ chsh -s /usr/local/bin/zsh
```

## 3. Mackupでアプリ毎の設定をリストア
アプリ毎に設定している内容を[Mackup](https://github.com/lra/mackup)を使ってリストアする。
Dropboxで同期しているので、最初にDropboxでローカルに同期しておく。  
※ Mackup管理のファイルがhomesick管理のファイルとバッティングする可能性があることに注意。
（Mackupでどのファイルがリストアされるか、アプリごとに確認しておく）

1. Dropboxのアプリを起動してローカルにファイルを同期する
2. Mackupでリストアする

```
$ pip install mackup ※pipはデフォルトでインストール済みの模様
$ mackup restore
```

iTerm2の設定もリストアされたので、以降の手順についてはiTerm2を起動して作業してもよい。

## 4. 周辺ツールのインストール

### Powerline & Rictyフォント
```console
$ ## brew tap sanemat/font
$ ## brew reinstall -—powerline -—vim-powerline ricty
$ cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
```

### その他
#### nodebrew
```console
$ curl -L git.io/nodebrew | perl - setup
$ source ${ZDOTDIR}/.zshrc
$ nodebrew install-binary v0.12.0
```

#### phpbrew
```console
$ curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
$ chmod +x phpbrew
$ sudo mv phpbrew /usr/bin/phpbrew
$ phpbrew init
```

#### misc
```console
$ git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src #gem
$ git clone https://github.com/laprasdrum/phpenv.git ~/.phpenv #phpenv
$ brew install vim --with-python --with-ruby --with-perl #vim
$ brew cask install --caskroom=/Applications google-chrome
$ brew cask install --caskroom=/Applications firefox-ja
$ brew cask alfred link
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
