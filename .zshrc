# Determine the base path for Homebrew based on the OS
if [[ "$(uname)" == "Darwin" ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# load plugins
source $BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history config
setopt appendhistory # append commands instead of overwrite
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# zoxide (replaces cd)
eval "$(zoxide init zsh --cmd cd)"

# aliases
alias ls='eza'
alias ll='ls -l'
alias cat='bat'
alias rm='trash'


