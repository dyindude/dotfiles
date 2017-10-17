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


## zplug begin
source ~/.zplug/init.zsh

#shamelessly stolen lines from https://terriblecode.com/blog/zplug-from-a-former-oh-my-zsh-user/
zplug "mafredri/zsh-async", from:github, defer:0  #required for pure
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
#need to look into how to theme the highlighting
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
#i like pure's prompt style, but can I put the path/git stuff in RPROMPT?
zplug "phanimahesh/purer", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
# may want to put this in another file, and set an easy toggle for faster startups
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

## zplug end

#PROMPT="%63F>%f "
#RPROMPT="%93F%2d%f"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
