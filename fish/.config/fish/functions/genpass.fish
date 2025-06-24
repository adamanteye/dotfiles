function genpass
    head -c 28 /dev/urandom | sha512sum -b | head -c 26
end
