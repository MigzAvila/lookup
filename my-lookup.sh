#!/bin/bash


function my-lookup(){
    #User must provide three arguments to run script
    local file_name="$1"
    local last_name="$2"

    if [ ! -z "$file_name" ] && [ ! -z "$last_name" ] && [[ $file_name == *".txt" ]]; then 
        # concatenate home directory with the file name passed by the user
        local filename="$HOME/$file_name"
        # Check if the file exists
        if [ -f "$filename" ]; then
            echo -e "Results: \n"
            # regex to match the name passed by the user in the file 
            grep -P "^(?:[a-zA-z]+ )*(?:$last_name)$" $filename
            echo -e "\nGoodbye!"
        else 
            # Print error since the file does not exist
            echo -e "\n\033[0;31m$filename does not exist.\n\n\033[0;32mPlease provide me with a file for me to find names based on the last name you provided."
        fi
    else 
        echo -e "\033[0;31m\n\nYou need to provide me with two arguments for this script to work.\n\033[0;32mUsage: my-lookup <text file name> <last name>"
    fi
}

