#!/bin/bash

# Check and install homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brews=(
    "bat"
    "bitwarden-cli"
    "eza"
    "ffmpeg"
    "fzf"
    "git"
    "go"
    "helm"
    "htop"
    "jq"
    "kubectl"
    "node"
    "pi-coding-agent"
    "pnpm"
    "ripgrep"
    "rustup"
    "sshs"
    "starship"
    "stow"
    "telnet"
    "terraform"
    "tldr"
    "trash"
    "uv"
    "wget"
    "xz"
    "zoxide"
    "powerlevel10k"             # zsh plugins
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
)

brew_casks=(
    "bitwarden"
    "bruno"
    "claude-code"
    "codexbar"
    "dbx"
    "dockdoor"
    "headlamp"
    "iterm2"
    "keka"
    "obsidian"
    "orbstack"
    "raycast"
    "tabby"
    "tailscale-app"
    "unnaturalscrollwheels"
    "visual-studio-code"
)

case "$1" in
    "brew")
        for brew in "${brews[@]}"; do
            brew install "$brew"
        done
        ;;
    "casks")
        for cask in "${brew_casks[@]}"; do
            brew install --cask "$cask"
        done
        ;;
    "")
        # brews
        for brew in "${brews[@]}"; do
            brew install "$brew"
        done
        # casks
        for cask in "${brew_casks[@]}"; do
            brew install --cask "$cask"
        done
        ;;
    *) 
        echo "Invalid argument. Use 'brew' to install brew packages, 'casks' to install casks, or no argument to install both."
        exit 1
        ;;
esac

echo "Done"
exit 0
