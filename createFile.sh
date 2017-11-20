#!/bin/sh

#  aaa.sh
#  
#
#  Created by Aditya Satalkar on 8/7/17.
#

createFile()
{
while IFS='' read -r line || [[ -n "$line" ]]; do

var="$line"


filename="$var"".txt"
echo "$filename"
echo "$var" | tr -d '"'  >> "$filename"

done < "$1"

}

createFile $1
