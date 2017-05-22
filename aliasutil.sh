
with-plain-alias () {
    local alis_aliased old_alias
    if [ -n "$aliases[alias]" ]; then
        alias_aliased=yes
        old_alias=$aliases[alias]
    fi;

    if [ -n "$alias_aliased" ]; then
        unalias alias
    fi;

    "$@"

    if [ -n "$alias_aliased" ]; then
        alias alias=$old_alias
    fi;
}

safe-alias () {
    with-plain-alias alias "$@"
}



aliasutil () {
    local command
    alias_file="$HOME/.aliases"
    if [ -n "$alias_file" ]; then
        touch "$alias_file"
    fi;

    case $1 in
         replace-alias)
             safe-alias alias='aliasutil add'
             ;;
         add)
             shift
             safe-alias "$@"
             echo -E  alias $(printf "'%s'" "${@[@]}") >> "$alias_file"
             ;;
         last)
             shift;
             if [ -z "$1" ]; then
                 aliasutil-die "usage: aliasutil last name: alias the last command"
             fi;

             # Evil (eval) magic to get quoting right
             eval safe-alias "$1"=$(printf "'%s'" ${history[$#history][@]})
             eval command=$(printf "'%s'" ${history[$#history][@]})
             echo -E "alias \"$1\"=$command" >> "$alias_file"
             ;;
         edit)
             $EDITOR "$alias_file"
             ;;
         remove)
             shift
             removed="$1"
             unalias "$1"
             sed -Ei "/^alias '$removed=/ d" "$alias_file"
             ;;
         list)
             cat "$alias_file"
             ;;
         load)
             with-plain-alias source "$alias_file"
             ;;
         *)
             aliasutil-die "unrecognised operation: $1"
             ;;
    esac
}

aliasutil-die() {
    echo >&2 "$*"
}
