PATH=/usr/local/mysql/bin:$PATH
export PATH
eval "$(rbenv init -)"
export NODE_PATH=/usr/local/lib/node_modules

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/usr0600205/cocos2d-x-3.1.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Applications/adt-bundle-mac-x86_64-20140321/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH
