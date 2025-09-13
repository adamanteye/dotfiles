abbr -a c clear
abbr -a k kubectl

abbr -a vim hx
abbr -a wk wl-copy
abbr -a kmt 'git kmt'
abbr -a n niri-session
abbr mutt neomutt
abbr news newsboat
abbr -a g git
abbr -a t tmux
alias t='taskwarrior-tui'

alias objdump='/usr/bin/objdump -M suffix'

alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lh --color=auto'

alias less='less -r'
alias grep='grep --color=auto'
alias cat='batcat --style=plain --paging=never'
alias rm='rm -vi'

alias ip='ip --color=auto'

alias chrome='google-chrome-stable'

alias weather-beijing='curl wttr.in/beijing'
alias weather-yinchuan='curl wttr.in/yinchuan'

abbr -a debian-builder 'docker run -it --rm --name debian --network host -e HTTP_PROXY=http://[::1]:10801 -v "$HOME/Documents/debian:/home/debian:rw" -v "/etc/wgetrc:/etc/wgetrc:ro" -e DEBFULLNAME -e DEBEMAIL ghcr.io/adamanteye/debian-builder:latest'

abbr -a setproxy 'export ALL_PROXY=http://[::1]:10801 && export HTTPS_PROXY=http://[::1]:10801'
abbr -a unsetproxy 'export ALL_PROXY= && export HTTPS_PROXY='

alias gitcountcode='git ls-files | grep -vE "(png|jpg|ico|svg|pdf|lock)" | xargs wc -l'
alias gitcountall='git diff --stat "$(git hash-object -t tree /dev/null)"'
