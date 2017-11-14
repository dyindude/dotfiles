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
#https://github.com/djui/alias-tips
#
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

source ~/.env/zsh
source ~/.env/aliases
if [ `uname` = "Darwin" ]; then
    source ~/.env/osx
elif [ `uname` = "Linux" ]; then
    source ~/.env/linux
fi

#fix some keys
#TODO: test if these are needed in OSes other than OSX
bindkey "\033[1~" beginning-of-line #home
bindkey "\033[4~" end-of-line       #end
bindkey "^[[3~" delete-char         #delete
