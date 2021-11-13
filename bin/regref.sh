#!/bin/zsh

# Simple search in regex_reference database
# Author: Belaja-akacija
# V.1.0.4a
#
# Idea: maybe get the pwd then find the files needed from there backwards?
# but this assumes that the user is in the current working directory as the program... We'll see


Category()
{
        category=$OPTARG
        search=$(pcregrep -Mi "(^\|\s+($category)+.+\n)([+=]+\n)(\|.+\n)+" $HOME/Documents/scripts/regref/data/regref.txt)
        echo $search

}

Item()
{
        item=$OPTARG
        result=$(grep --color=always -iE "$item" $HOME/Documents/scripts/regref/data/regref.txt )
        echo $result
}

Regex()
{
        item=$OPTARG
        result=$(grep --color=always -E "$item" $HOME/Documents/scripts/regref/data/regref.txt )
        echo $result
}

List()
{
        list=$(grep --color=never -E "(^\|\s(\w+\s)+)" $HOME/Documents/scripts/regref/data/regref.txt)
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
                        Item
                        ;;
                I)
                        Regex
                        ;;

                l) List;;
                h) Help;;
                v)
                        set -xv;;
                #shortlist)
                        #echo c i I l h v
                        #;;
                *) echo "Invalid option: -$flag"
                        exit;;
        esac
done
