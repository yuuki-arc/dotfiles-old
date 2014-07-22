PATH=$HOME/bin:/usr/local/mysql/bin:/usr/local/bin:$HOME/.nodebrew/current/bin:$PATH
export PATH

# Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH


if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
if  [ -d ${HOME}/cocos2d-x-3.1.1 ] ; then
  export COCOS_CONSOLE_ROOT=$HOME/cocos2d-x-3.1.1/tools/cocos2d-console/bin
  export PATH=$COCOS_CONSOLE_ROOT:$PATH
fi

# Add environment variable NDK_ROOT for cocos2d-x
if [ -d /Applications/adt-bundle-mac-x86_64-20140321 ] ; then
  export NDK_ROOT=/Applications/adt-bundle-mac-x86_64-20140321/android-ndk-r9d
  export PATH=$NDK_ROOT:$PATH
fi
