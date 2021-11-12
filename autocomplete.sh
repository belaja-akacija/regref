_script()
{
        _script_commands=$(~/Documents/scripts/regref/regref.sh)

        local cur
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

        return 0
}
complete -o nospace -F _script ./regref.sh
