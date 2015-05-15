#!/bin/bash

bin_path=.homesick/repos/dotfiles/home/bin_win
full_path=$HOME/.homesick/repos/dotfiles/home/bin_win
for file in `find $full_path -type f -name '*' | grep -v '$full_path/.git$' | perl -nle 'm!.homesick/repos/dotfiles/home/bin_win/(.+)$! and print $1'`; do
    ln -s $full_path/$file $HOME/bin/$file
done
