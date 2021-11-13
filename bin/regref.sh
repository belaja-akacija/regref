#!/bin/zsh

# Simple search in regex_reference database
# Author: Belaja-akacija
# V.1.0.3

Category()
{
        category=$OPTARG
        search=$(pcregrep -Mi "(^\|\s+($category)+.+\n)([+=]+\n)(\|.+\n)+" ~/Documents/scripts/regref/data/regref.txt)
        echo $search

}

Item()
{
        item=$OPTARG
        result=$(grep --color=always -iE "$item" ~/Documents/scripts/regref/data/regref.txt )
        echo $result
}

Regex()
{
        item=$OPTARG
        result=$(grep --color=always -E "$item" ~/Documents/scripts/regref/data/regref.txt )
        echo $result
}

List()
{
        list=$(grep --color=never -E "(^\|\s(\w+\s)+)" ~/Documents/scripts/regref/data/regref.txt)
        echo $list
}

Help()
{
        echo "\n\tWelcome to the RegEx Cheatsheet! (v.1.0.3)"
        echo
        echo "\tUsage: regref [OPTION]... [SEARCH]\n      NOTE: for RegEx searches instead of keywords, use double quotes\n"
        echo "  +  -c   #-----------> choose a category to view"
        echo "  +  -h   #-----------> this help menu"
        echo "  +  -i   #-----------> search for a specific item (case insensitive)"
        echo "  +  -I   #-----------> search for a specific item (case sensitive)"
        echo "  +  -l   #-----------> list all categories"
        echo "  +  -v   #-----------> verbose mode, for debugging purposes"
        echo
}


while getopts "c:i:I:lhv" flag
do
        case "${flag}" in
                c)
                        Category
                        ;;
                i)
                        Item
                        ;;
                I)
                        Regex
                        ;;

                l) List;;
                h) Help;;
                v)
                        set -xv;;
                shortlist)
                        echo c i I l h v
                        ;;
                *) echo "Invalid option: -$flag"
                        exit;;
        esac
done
