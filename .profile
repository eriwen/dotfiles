# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# RVM suggests using gcc instead of llvm (which Apple now symlinks gcc to)
export CC=/usr/local/bin/gcc-4.2

for file in ~/.{private,vars,paths,aliases,zprofile,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# {{{
# Node Completion - Auto-generated, do not touch.
# shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

# Load gvm
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
