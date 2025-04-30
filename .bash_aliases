# if no make is available and mingw32-make is available, then use it as make
if [ ! -x "$(command -v make)" ] && [ -x "$(command -v mingw32-make)" ]; then
  alias make=mingw32-make

  _make_targets() {
    COMPREPLY=( $(compgen -W "$(awk -F: '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {print $1}' Makefile 2>/dev/null)" -- "${COMP_WORDS[1]}") )
  }
  complete -F _make_targets make
fi


