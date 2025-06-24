set -gx EDITOR helix
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT -c
set -gx VISUAL helix

set -gx DEBEMAIL "ada@adamanteye.cc"
set -gx DEBFULLNAME adamanteye

if status is-interactive
    if test "$XDG_SESSION_TYPE" = wayland
        fortune ada
    end
end

function fish_greeting
end

if not contains "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/.local/bin" $PATH
end

# rustup
source "$HOME/.cargo/env.fish"

# gpg and ssh
if test -S (gpgconf --list-dirs agent-ssh-socket)
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    set -gx GPG_TTY (tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null
end
