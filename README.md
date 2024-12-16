# .dotfiles


## Clone Repo

```sh
git clone https://github.com/eynsfordcq/.dotfiles.git --recurse-submodules
```


## Usage

#### Install 

```sh
# this script checks whether brew is installed, if not, it will install brew as well.

# install everything
./install.sh

# install brews only
./install.sh brew

# install casks only
./install.sh casks
```

#### Mac Configs

```sh
# this script will: 
# set some keybinding stuff,
# set some mouse settings
# set some keyboard shortcut 
# set raycast launch key
# might need to re-login for it to take effect
./mac-config.sh
```

#### Stow 

```sh
# stow everything
stow . 

# stow ssh configs
stow -t ~/.ssh/ .ssh
```

#### Raycast setup

- in `raycast extensions -> script commands`
    - add directories `~/.raycast/scripts`
- in raycast, search `import quicklinks`
    - select `~/.raycast/quicklinks/quicklinks.json`
