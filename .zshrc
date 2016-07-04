# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rafal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz promptinit
promptinit
prompt fade blue

export PATH=/home/rafal/bin:$PATH

# Display current branch in RPROMPT
function current_branch {
if git rev-parse --git-dir > /dev/null 2>&1; then
  : # This is a valid git repository (but the current working
    # directory may not be the top level.
    # Check the output of the git rev-parse command if you care)

    echo '(' `git rev-parse --abbrev-ref HEAD` ')'
else 
  : # this is not a git repository
fi
} 

RPROMPT='$(current_branch)'

# Useful keybindings
bindkey '^r' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word