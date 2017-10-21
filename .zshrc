# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#export ZSH_THEME="agnoster"
#export ZSH_THEME="muse"
export ZSH_THEME="refined"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(osx colored-man git github history-substring-search z)

fpath=($HOME/src/eriwen/gradle-completion /usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# added by travis gem
[ -f /Users/ewendelin/.travis/travis.sh ] && source /Users/ewendelin/.travis/travis.sh

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/ewendelin/.gvm/bin/gvm-init.sh" ]] && source "/Users/ewendelin/.gvm/bin/gvm-init.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $HOME/.profile

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/ewendelin/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/ewendelin/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/ewendelin/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/ewendelin/google-cloud-sdk/completion.zsh.inc'
fi

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

