abbr -a c clear
abbr -a k kubectl
abbr -a vim hx
abbr -a wk wl-copy
abbr -a kmt 'git kmt'
abbr -a n networkctl
abbr -a snapshot 'sudo btrfs su sn -r / /bk-$(date +%Y-%m-%d).d'
abbr -a s sudo
abbr -a tcp 'ss -t'
abbr -a udp 'ss -u'
abbr -a sys systemctl
abbr -a nt 'nc -vz -w2'
abbr -a news newsboat
abbr -a g git
abbr -a j journalctl
abbr -a h hx
abbr -a hl hledger
abbr -a t tmux
abbr -a sw sway

alias objdump='/usr/bin/objdump -M suffix'

alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lh --color=auto'

alias less='less -r'
alias grep='grep --color=auto'
alias rm='rm -vi'

alias ip='ip --color=auto'

alias m=neomutt

abbr -a setproxy 'export ALL_PROXY=http://[::1]:10801 && export HTTPS_PROXY=http://[::1]:10801'
abbr -a unsetproxy 'export ALL_PROXY= && export HTTPS_PROXY='

alias gitcountcode='git ls-files | grep -vE "(png|jpg|ico|svg|pdf|lock)" | xargs wc -l'
alias gitcountall='git diff --stat "$(git hash-object -t tree /dev/null)"'
