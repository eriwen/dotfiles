# allow approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS

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
. $HOME/.dotfiles/.scripts/z.sh
