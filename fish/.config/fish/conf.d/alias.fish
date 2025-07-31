alias hx='helix'
alias c='clear'

alias makepkg='send-heartbeat "package for AUR" && /usr/bin/makepkg'
alias bluetoothctl='send-heartbeat "manage bluetooth device" && /usr/bin/bluetoothctl'
alias docker='send-heartbeat "mess around with docker" && /usr/bin/docker'
alias kmt='send-heartbeat "sign git commit" && git commit'
alias cl='send-heartbeat "clone git repository" && git clone'
alias pass='send-heartbeat "manage password" && /usr/bin/pass'
alias zotero='send-heartbeat "browse library in zotero" && /usr/bin/zotero'
alias n='send-heartbeat "boot laptop" && /usr/bin/niri-session'
alias h='send-heartbeat "boot laptop" && /usr/bin/Hyprland'
alias mutt='send-heartbeat "check emails" && neomutt'
alias news='send-heartbeat "read RSS feeds" && newsboat'
alias telegram-desktop='send-heartbeat "open telegram" && /usr/bin/telegram-desktop'
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
alias htop='send-heartbeat "view htop" && glances'
alias scp='gpg-connect-agent updatestartuptty /bye >/dev/null && /usr/bin/scp -C'
alias rm='rm -vi'

alias rsync='gpg-connect-agent updatestartuptty /bye >/dev/null && /usr/bin/rsync'
alias ssh='send-heartbeat "initiate SSH connection" && gpg-connect-agent updatestartuptty /bye >/dev/null && /usr/bin/ssh'
alias poweroff='send-heartbeat "shut down laptop" && /usr/bin/poweroff'

alias ip='ip --color=auto'

alias chrome='google-chrome-stable'

alias weather-beijing='curl wttr.in/beijing'
alias weather-yinchuan='curl wttr.in/yinchuan'

alias debian-builder='docker run -it --rm --name debian --network host -e HTTP_PROXY=http://[::1]:10801 -v "$HOME/Documents/debian:/home/debian:rw" -v "/etc/wgetrc:/etc/wgetrc:ro" -e DEBFULLNAME -e DEBEMAIL ghcr.io/adamanteye/debian-builder:latest'

alias setproxy='export ALL_PROXY=http://[::1]:10801 && export HTTPS_PROXY=http://[::1]:10801'
alias unsetproxy='export ALL_PROXY= && export HTTPS_PROXY='

alias gitcountcode='git ls-files | grep -vE "(png|jpg|ico|svg|pdf|lock)" | xargs wc -l'
alias gitcountall='git diff --stat "$(git hash-object -t tree /dev/null)"'
