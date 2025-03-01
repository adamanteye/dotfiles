function fish_should_add_to_history
    for cmd in cd git ls rm open
        string match -qr "^$cmd" -- $argv; and return 1
    end
    return 0
end
