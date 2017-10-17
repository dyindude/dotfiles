# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install

## zplug begin
source ~/.zplug/init.zsh

zplug "plugins/git",   from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

## zplug end

PROMPT="%63F>%f "
RPROMPT="%93F%2d%f"
