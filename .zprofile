autoload -U compinit
compinit

compdef _git g=git

autoload select-word-style
select-word-style shell

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

setopt completeinword
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS
# superglobs
setopt extendedglob
unsetopt caseglob

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi

# GRC colorizes nifty unix tools all over the place
if $(grc &>/dev/null)
then
  source `brew --prefix`/etc/grc.bashrc
fi

# Initialize z script
. `brew --prefix`/etc/profile.d/z.sh
