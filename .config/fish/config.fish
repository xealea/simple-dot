if status is-interactive
    # Commands to run in interactive sessions can go here
end

# glyph
function fish_prompt
    set -g fish_color_cwd blue
    printf '%s%s ' (set_color $fish_color_cwd)  
end

set -g fish_greeting ""

eval (starship init fish)

# Awesome Alias
## System commands
alias ls 'ls --color=auto'
alias tarnow 'tar -acf'
alias untar 'tar -zxvf'
alias wget 'wget -c'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias dir 'dir --color=auto'
alias vdir 'vdir --color=auto'
alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'
alias diff 'diff --color=auto'

# Improved commands
alias ls 'lsd --group-dirs first'
alias lt 'lsd --tree'
alias top 'htop'
alias cat 'bat --pager=never --theme=ansi'
alias catf 'bat --theme=ansi'

# Clear vkpurge alias
function clrk
    sudo vkpurge rm all
end

# XBPS
alias vu 'sudo xbps-install -Suv'
alias vp 'sudo xbps-install'
alias vr 'sudo xbps-remove -Rcon'
alias vfr 'sudo xbps-remove -Rcon -F'
alias vq 'xbps-query -l'
alias vf 'vq | grep'
alias vs 'xbps-query -Rs'
alias vd 'xbps-query -x'

# Flatpak
alias fu 'flatpak update'
alias fi 'flatpak install'
alias ff 'flatpak repair'
alias fs 'flatpak search'
alias fl 'flatpak list'
alias fr 'flatpak uninstall --delete-data'
alias fc 'flatpak uninstall --unused'

# Nix
alias nu 'nix-env -u'
alias nf 'nix-env --query'
alias na 'nix-env --query "*"'
alias ni 'nix-env -i'
alias nr 'nix-env -e'
alias ns 'nix search'
alias no 'nix-env --rollback'
alias ncl 'nix-channel --list'
alias nca 'nix-channel --add'
alias ncu 'nix-channel --update'

# Specials
alias b 'bleachbit'
function be
    bleachbit
end

function fre
    sudo fc-cache -f -v
    fc-cache -f -v
end

function cu
    xu; and nu; and fu
end

# System Controls
alias halt 'loginctl suspend'
alias poweroff 'loginctl poweroff'
alias reboot 'loginctl reboot'
alias shutdown 'loginctl shutdown'
alias zzz 'loginctl sleep'
