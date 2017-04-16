aliasutil () {
    alias_file="$HOME/.aliases"
    if [ -n "$alias_file" ]; then
        touch "$alias_file"
    fi;

    case $1 in
         replace-alias)
             alias alias='aliasutil add'
             ;;
         add)
             shift
             alias "$@"
             echo alias $(printf "'%s'" "${@[@]}") >> "$alias_file"
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
             source "$alias_file"
             ;;
         *)
             aliasutil-die "unrecognised operation: $1"
             ;;
    esac
}

aliasutil-die() {
    echo >&2 "$*"
}
