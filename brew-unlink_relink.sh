# https://gist.github.com/fijimunkii/10501585
ls -1 /usr/local/Library/LinkedKegs | while read line; do echo $line; brew unlink $line; brew link --force $line; done
brew list -1 | while read line; do brew unlink $line; brew link $line; done
