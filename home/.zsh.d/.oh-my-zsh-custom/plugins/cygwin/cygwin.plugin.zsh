function wincmd() {
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
 
alias ipconfig='wincmd ipconfig'
alias netstat='wincmd netstat'
alias netsh='wincmd netsh'
alias cscript='wincmd cscript'

alias ping='wincmd /c/Windows/system32/PING.EXE'
alias open="cygstart"
