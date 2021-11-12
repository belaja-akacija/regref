#!/bin/zsh

# Simple search in regex_reference database
# V.1.0.1

Category()
{
        category=$OPTARG
        file=$(<~/Documents/Linux_Cheat_Sheets/regex_reference.txt)
        #search= $(echo "$file" | grep -iE "^(\|\s(${category})+.+\n)([+=]+\n)(\|.+\n)+")
        #echo $search
        #search=$(cat regref.txt | pcregrep -Mi "(^\|\s+($category)+.+)([+=]+)(\|.+)+")
        #echo $search
        search2=$(cat ~/Documents/scripts/regref/regref.txt | pcregrep -Mi "(^\|\s+($category)+.+\n)([+=]+\n)(\|.+\n)+")
        echo $search2

}

Item()
{
        item=$OPTARG
        result=$(cat ~/Documents/scripts/regref/regref.txt | grep --color=always -iE $item)
        echo $result
}

List()
{
        list=$(cat ~/Documents/scripts/regref/regref.txt | grep --color=never -E "(^\|\s(\w+\s)+)")
        echo $list
}

Help()
{
        echo "\nWelcome to the RegEx Cheatsheet! (v.1.0.1)\nHere are your options"
        echo
        echo "-l -- list all categories"
        echo "-c -- choose a category to view"
        echo "-i -- search for a specific item (case insensitive)"
        echo "-h -- this help menu"
        echo
}

while getopts "c:i:lh" flag
do
        case "${flag}" in
                c)
                        Category
                        ;;
                i) Item;;
                l) List;;
                h) Help;;
                *) echo "Invalid option: -$flag"
                        exit;;
        esac
done


