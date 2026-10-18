# Map shell roles to the terminal palette; RGB values belong in Foot.
status is-interactive; or return

set -g fish_color_normal normal
set -g fish_color_command blue
set -g fish_color_builtin brblue
set -g fish_color_function blue
set -g fish_color_keyword brcyan
set -g fish_color_param normal
set -g fish_color_option yellow
set -g fish_color_quote magenta
set -g fish_color_redirection cyan
set -g fish_color_end brcyan
set -g fish_color_error red --bold
set -g fish_color_comment brblack --italics
set -g fish_color_operator brcyan
set -g fish_color_escape green
set -g fish_color_autosuggestion brblack
set -g fish_color_valid_path --underline
# Use palette-based inverse colors for selections and search matches.
set -g fish_color_selection black --background=white
set -g fish_color_search_match black --background=white
set -g fish_color_history_current brcyan
set -g fish_color_cwd brblue
set -g fish_color_cwd_root red
set -g fish_color_user normal
set -g fish_color_host normal
set -g fish_color_host_remote brcyan
set -g fish_color_status red
set -g fish_color_cancel red

set -g fish_pager_color_prefix brblue --bold
set -g fish_pager_color_completion normal
set -g fish_pager_color_description brblack
set -g fish_pager_color_progress brcyan --background=black
set -g fish_pager_color_selected_background --background=white
set -g fish_pager_color_selected_prefix black --bold
set -g fish_pager_color_selected_completion black
set -g fish_pager_color_selected_description black
