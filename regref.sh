#!/bin/zsh

# Simple search in regex_reference database
# Author: Belaja-akacija
# V.1.0.2 -- Test build
# TODO:
# - Store category names in an array and allow tab completion for them when using -c flag
# - Figure out how to not allow certain flags to be used together

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
        result=$(grep --color=always -iE "$item" ~/Documents/scripts/regref/regref.txt )
        echo $result
}

Regex()
{
        item=$OPTARG
        result=$(grep --color=always -E "$item" ~/Documents/scripts/regref/regref.txt )
        echo $result
}

List()
{
        list=$(grep --color=never -E "(^\|\s(\w+\s)+)" ~/Documents/scripts/regref/regref.txt)
        echo $list
}

Help()
{
        echo "\nWelcome to the RegEx Cheatsheet! (v.1.0.3)\nHere are your options: "
        echo
        echo "Usage: regref [OPTION]... [SEARCH]\nNOTE: for RegEx searches instead of keywords, use double quotes\n"
        echo "-l -- list all categories"
        echo "-c -- choose a category to view"
        echo "-i -- search for a specific item (case insensitive)"
        echo "-I -- search for a specific item (case sensitive)"
        echo "-v -- verbose mode, for debugging purposes"
        echo "-h -- this help menu"
        echo
}


while getopts "c:i:I:lhv" flag
do
        case "${flag}" in
                c)
                        Category
                        ;;
                i)
                        #if [[$flag =~ $testing]];
                        #then
                        #Item
                        #elif [[$flag !=~ $noIFlag]];
                        #then
                        #echo "Not possible."
                        #exit
                        #fi
                        Item
                        ;;
                I)
                        Regex
                        ;;

                #I) echo "yes";;

                l) List;;
                h) Help;;
                v)
                        set -xv;;
                *) echo "Invalid option: -$flag"
                        exit;;
        esac
done
