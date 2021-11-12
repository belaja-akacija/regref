#!/bin/zsh

# Simple search in regex_reference database
# Author: Belaja-akacija
# V.1.0.2 -- Test build

Category()
{
        category=$OPTARG
        #search2=$(cat ~/Documents/scripts/regref/regref.txt | pcregrep -Mi "(^\|\s+($category)+.+\n)([+=]+\n)(\|.+\n)+")
        #echo $search2
        search=$(pcregrep -Mi "(^\|\s+($category)+.+\n)([+=]+\n)(\|.+\n)+" ~/Documents/scripts/regref/regref.txt)
        echo $search

}

Item()
{
        item=$OPTARG
        result=$(grep --color=always -iE $item ~/Documents/scripts/regref/regref.txt )
        echo $result
}

List()
{
        list=$(grep --color=never -E "(^\|\s(\w+\s)+)" ~/Documents/scripts/regref/regref.txt)
        echo $list
}

Help()
{
        echo "\nWelcome to the RegEx Cheatsheet! (v.1.0.2)\nHere are your options"
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


