# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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
