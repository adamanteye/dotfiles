set -x EDITOR hx
set -x MANROFFOPT -c
set -x VISUAL hx
set -x BROWSER firefox
set -x ALL_PROXY 'http://[::1]:10801'
set -x HTTPS_PROXY 'http://[::1]:10801'
set -x HTTP_PROXY 'http://[::1]:10801'
set -x SOCKS_PROXY 'socks://[::1]:10800'

set -x DEBEMAIL "adamanteye@disroot.org"
set -x DEBFULLNAME "Xuelin Yang"

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

# cargo bin
if not contains "$HOME/.cargo/bin" $PATH
    set -x PATH "$HOME/.cargo/bin" $PATH
end

# gpg and ssh
if test -S (gpgconf --list-dirs agent-ssh-socket)
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
