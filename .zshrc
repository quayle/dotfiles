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

export PATH=/home/rafal/bin:$PATH:/usr/sbin

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
bindkey \^K kill-line
bindkey \^U backward-kill-line

# Disable /etc/hosts completion, as it has no use for me and slows down zsh
zstyle ':completion:*' hosts off

# ZSH tab completion of git commands is very slow. How can I turn it off
# http://superuser.com/questions/458906/ddg#459057
__git_files () { 
    _wanted files expl 'local files' _files     
}

alias xdebug-on='sudo php5enmod -s cli xdebug'
alias xdebug-off='sudo php5dismod -s cli xdebug'
alias xhprof-on='sudo php5enmod -s fpm xhprof'
alias xhprof-off='sudo php5dismod -s fpm xhprof'
