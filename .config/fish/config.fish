if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

eval (starship init fish)

# Awesome Alias
## System commands
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

# Arch
alias pacs 'sudo pacman -Syu'
alias paci 'sudo pacman -S'
alias pacr 'sudo pacman -Rs'
alias pacq 'pacman -Q'
alias pacinfo 'pacman -Qi'
alias pacfiles 'pacman -Ql'
alias paruup 'paru -Syu'
alias parui 'paru -S'
alias parur 'paru -Rs'
alias paruq 'paru -Q'
alias paruinfo 'paru -Qi'
alias parufiles 'paru -Ql'

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
