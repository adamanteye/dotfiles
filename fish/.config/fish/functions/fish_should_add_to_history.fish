function fish_should_add_to_history
    for cmd in cd ls rm open cp
        string match -qr "^$cmd" -- $argv; and return 1
    end
    return 0
end
