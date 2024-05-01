# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# Helpful aliases

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Helpful Aliases
alias l='eza -lh  --icons=auto'
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias mkdir='mkdir -p'
alias ssh='kitten ssh'
alias tree='tree -a -I .git'
alias cat='bat'
alias c='clear' # clear terminal
alias mkdir='mkdir -p'

# Git Aliases
alias gac='git add . && git commit -m'
alias gs='git status'
alias gpush='git push origin'
alias lg='lazygit'

# Important Aliases
alias yd='yt-dlp -f "bestvideo[height<=1080]+bestaudio" --embed-chapters --external-downloader aria2c --concurrent-fragments 4'
alias td='yt-dlp --external-downloader aria2c -o "%(title)s."'
alias vim='nvim'
alias grep='rg --color=auto'
alias ghistory='cat ~/.zsh_history | fzf'
alias up='sudo pacman -Sy && sudo pacman -Su && yay -Su'

# VPN Aliases
alias vpn-up='sudo tailscale up --exit-node=raspberrypi --accept-routes'
alias vpn-down='sudo tailscale down'
warp ()
{
    sudo systemctl "$1" warp-svc
}

# Utils Aliases
alias apps-space='expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqe | sort) <(pacman -Qqg base base-devel | sort)) | sort -n'
alias files-space='sudo ncdu --exclude /.snapshots /'
alias ld='lazydocker'

# Other Aliases
alias cr='mpv --yt-dlp-raw-options=cookies-from-browser=firefox'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
lsfind ()
{
    ll "$1" | grep "$2"
}


# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Fnm
eval "$(fnm env --use-on-cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6
