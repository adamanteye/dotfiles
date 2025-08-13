alias hx='helix'
alias c='clear'

alias wk='wl-copy'
alias kmt='git commit'
alias n='niri-session'
alias h='Hyprland'
alias mutt='neomutt'
alias news='newsboat'
alias g='git'
alias z='zellij'
alias t='taskwarrior-tui'

alias objdump='/usr/bin/objdump -M suffix'

alias l='lsd'
alias ls='lsd'
alias la='lsd -A'
alias ll='lsd -lh'

alias cp='uu-cp -g'
alias less='less -r'
alias grep='grep --color=auto'
alias tree='lsd --tree'
alias cat='bat --style=plain --paging=never'
alias scp='gpg-connect-agent updatestartuptty /bye >/dev/null && /usr/bin/scp -C'
alias rm='rm -vi'

alias rsync='gpg-connect-agent updatestartuptty /bye >/dev/null && /usr/bin/rsync'
alias ssh='gpg-connect-agent updatestartuptty /bye >/dev/null && /usr/bin/ssh'

alias ip='ip --color=auto'

alias chrome='google-chrome-stable'

alias weather-beijing='curl wttr.in/beijing'
alias weather-yinchuan='curl wttr.in/yinchuan'

alias debian-builder='docker run -it --rm --name debian --network host -e HTTP_PROXY=http://[::1]:10801 -v "$HOME/Documents/debian:/home/debian:rw" -v "/etc/wgetrc:/etc/wgetrc:ro" -e DEBFULLNAME -e DEBEMAIL ghcr.io/adamanteye/debian-builder:latest'

alias setproxy='export ALL_PROXY=http://[::1]:10801 && export HTTPS_PROXY=http://[::1]:10801'
alias unsetproxy='export ALL_PROXY= && export HTTPS_PROXY='

alias gitcountcode='git ls-files | grep -vE "(png|jpg|ico|svg|pdf|lock)" | xargs wc -l'
alias gitcountall='git diff --stat "$(git hash-object -t tree /dev/null)"'
