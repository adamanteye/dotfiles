function cpl
    echo file://(realpath $argv[1]) | wl-copy -t text/uri-list
end
