# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install

## clone zplug if it doesn't exist
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug.git ~/.zplug
fi

## clone tpm if it doesn't exist
#does this belong in zshrc?
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

#needs to be loaded before zsh-syntax-highlighting
#http://blog.patshead.com/2012/01/using-and-customizing-zsh-syntax-highlighting-with-oh-my-zsh.html
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

## zplug begin
source ~/.zplug/init.zsh

#shamelessly stolen lines from https://terriblecode.com/blog/zplug-from-a-former-oh-my-zsh-user/
#zplug "mafredri/zsh-async", from:github, defer:0  #required for pure
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
#need to look into how to theme the highlighting
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
#i like pure's prompt style, but can I put the path/git stuff in RPROMPT?
#zplug "phanimahesh/purer", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
# may want to put this in another file, and set an easy toggle for faster startups
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## zplug end

#PROMPT="%63F>%f "
#RPROMPT="%93F%2d%f"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

#need to test out what all these actually do
#http://blog.patshead.com/2012/01/using-and-customizing-zsh-syntax-highlighting-with-oh-my-zsh.html
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[precommand]=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=none
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none
source ~/.prompt.zsh
#remove right side indent for promptline
ZLE_RPROMPT_INDENT=0
