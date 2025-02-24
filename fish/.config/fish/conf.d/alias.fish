alias hx='helix'
alias c='clear'
alias h='Hyprland'
alias mutt='neomutt'
alias news='newsboat'

alias l='ls'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lh'

alias grep='grep --color=auto'
alias tree='tree -C'
alias cat='bat --style=plain --paging=never'
alias less='bat --style=plain'
alias top='htop'
alias scp='scp -C'
alias rm='rm -vi'

alias pacman='sudo pacman'
alias systemctl='sudo systemctl'
alias ip='sudo ip --color=auto'
alias journalctl='sudo journalctl'
alias dmesg='sudo dmesg'

alias debian-builder='docker run -it --rm --name debian --network host -e HTTP_PROXY=http://[::1]:10801 -v "$HOME/Documents/debian:/home/debian:rw" -v "/etc/wgetrc:/etc/wgetrc:ro" -e DEBFULLNAME -e DEBEMAIL ghcr.io/adamanteye/debian-builder:master'

alias setproxy='export all_proxy=http://[::1]:10801'
alias unsetproxy='export all_proxy='

alias gitcountcode='git ls-files | grep -vE "(png|jpg|ico|svg|pdf|lock)" | xargs wc -l'
alias gitcountall='git diff --stat "$(git hash-object -t tree /dev/null)"'
