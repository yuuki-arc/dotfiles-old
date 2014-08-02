alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias ctags="/usr/local/bin/ctags"

alias sshe="cocot -t UTF-8 -p EUC-JP -- ssh"

alias be="bundle exec"

eval "$(hub alias -s)"

alias g="git"
alias gc="git commit -v"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gba="git branch -a"
alias ga="git add"
alias gm="git merge"
alias gf="git fetch"
alias gup="git fetch && git rebase"
alias ggpush="git push origin $(current_branch)"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gla="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gd="git diff"
alias gdc="git diff --cached"
alias gr="git rebase"
alias gs="git status --short --branch"
alias gsd="gs && gd"
alias gsa="gs && ga"
alias gsco="gs && gc"
alias gsrh="gs && grh"
alias gbrs="git browse"
