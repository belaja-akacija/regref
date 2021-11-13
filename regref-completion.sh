#/usr/bin/zsh
# Need to figure out why this pcregrep command works in the shell, but not in the script
_completion_pruning()
{
        # The regex for the search
        #(^\|\s+(\w[A-Za-z]\w+\s)+)


        data=`pcregrep -M "(^\|\s+(\w[A-Za-z]\w+\s)+)" ~/Documents/scripts/regref/data/regref.txt`
        echo $data

}
_regref_completions()
{
        COMPREPLY=($(compgen -W "$(pcregrep -M "(^\|\s+(\w[A-Za-z]\w+\s)+)" ~/Documents/scripts/regref/data/regref.txt)"))
}

complete -F _regref_completions regref.sh

# In testing still
#_completion_pruning
