set -gx EDITOR helix
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT -c
set -gx VISUAL helix

set -gx DEBEMAIL "ada@adamanteye.cc"
set -gx DEBFULLNAME adamanteye

if status is-interactive
    fortune ada
end

function fish_greeting
end

if not contains "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/.local/bin" $PATH
end

# rustup
source "$HOME/.cargo/env.fish"

# gpg and ssh
set -e SSH_AGENT_PID
set -e SSH_AUTH_SOCK
gpg-connect-agent reloadagent /bye >/dev/null
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
