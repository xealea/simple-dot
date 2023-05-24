if status is-interactive
    # Commands to run in interactive sessions can go here
end

# glyph
function fish_prompt
    set -g fish_color_cwd red
    printf '%s%s ' (set_color $fish_color_cwd) 󱜯
end

# greeting
#set -g fish_greeting "
#
#	█░█░█ █▀▀ █░░ █▀▀ █▀█ █▀▄▀█ █▀▀   █▄▄ ▄▀█ █▀▀ █▄▀ ░
#	▀▄▀▄▀ ██▄ █▄▄ █▄▄ █▄█ █░▀░█ ██▄   █▄█ █▀█ █▄▄ █░█ █
#"


set -g fish_greeting ""
