# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab


# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza $realpath'


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
alias yd='yt-dlp -f "bestvideo[height<=1080]+bestaudio" --embed-chapters --external-downloader aria2c --concurrent-fragments 8 --throttled-rate 100K'
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


# Shell Intergrations
# eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="/home/vasu/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
