set -x EDITOR hx
set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"
set -x MANROFFOPT -c
set -x VISUAL hx

set -x DEBEMAIL "ada@adamanteye.cc"
set -x DEBFULLNAME adamanteye

# fortune
if status is-interactive
    if test "$XDG_SESSION_TYPE" = wayland
        # fortune ada
    end
end

function fish_greeting
end

# local bin
if not contains "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/.local/bin" $PATH
end

# gpg and ssh
if test -S (gpgconf --list-dirs agent-ssh-socket)
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
