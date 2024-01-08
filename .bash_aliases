# requires exa
alias ls='exa --color=always'
alias ll='exa --color=always -lah'

alias less='less -I'
alias grep='grep --color=auto'
alias show-cert="openssl x509 -noout -text -in $1"
alias show-req="openssl req -noout -text -in $1"
alias rand="openssl rand -base64 18"
alias k="/usr/local/bin/kubectl"
alias kdc='kubectl --dry-run=client -o yaml'
alias kds='kubectl --dry-run=server -o yaml'
alias wetter="curl http://wttr.in/berlin"
alias git-history="git log --graph --oneline --decorate --all"
