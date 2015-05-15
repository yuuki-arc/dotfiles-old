#!/bin/sh
 
 
VALUE_ICON=`cygpath -d "$HOME/cocos2d-x/cocos2d-x-3.6/cocos2dx_portrait.png"`
VALUE_TITLE="terminal"
VALUE_MESSAGE="Ha!!"
 
while getopts hi:t:m: OPT
do
        case $OPT in
                "i" ) FLG_ICON="TRUE" ; VALUE_ICON="$OPTARG" ;;
                "t" ) FLG_TITLE="TRUE" ; VALUE_TITLE="$OPTARG" ;;
                "m" ) FLG_MESSAGE="TRUE" ; VALUE_MESSAGE="$OPTARG" ;;
                "h" ) echo "Usage: notify-send [options of 'growl for windows' ...] message" ; exit 0 ;;
        esac
done 
 
/cygdrive/c/Program\ Files\ \(x86\)/Growl\ for\ Windows/growlnotify.com /i:"$VALUE_ICON" /t:"$VALUE_TITLE" "$VALUE_MESSAGE"

