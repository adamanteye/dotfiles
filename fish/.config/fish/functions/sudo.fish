# https://github.com/fish-shell/fish-shell/issues/7044
function sudo --wraps sudo
    for i in (seq 1 (count $argv))
        if command -q -- $argv[$i]
            command sudo-rs $argv
            return
        else if functions -q -- $argv[$i]
            if test $i != 1
                set sudo_args $argv[..(math $i - 1)]
            end
            command sudo-rs $sudo_args -E fish -C "source $(functions --no-details (functions | string split ', ') | psub)" -c '$argv' $argv[$i..]
            return
        end
    end

    command sudo-rs $argv
end
