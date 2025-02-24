function passgen --description "Generate a random password"
    argparse 'l/len=' -- $argv
    set -l length 16

    if set -q _flag_len
        set length $_flag_len
    end

    head -c 512 /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*()-_+=' | head -c $length
    echo
end
