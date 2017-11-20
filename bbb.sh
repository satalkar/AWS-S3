#!/bin/sh

#  bbb.sh
#
#
#  Created by Aditya Satalkar on 8/8/17.
#

openSubFile()
{
less $1 | while read line
do

#echo "$line"


filename="$1"

name="$(echo $filename | cut -f 1 -d '.')"


./get_obj_acl.sh $name $line

done

}

while IFS='' read -r line || [[ -n "$line" ]]; do
    #echo "Object Key: $line"
    var="$line"
    filename="$line"".txt"

    echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "$line"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"
	echo "/"

    openSubFile $filename

done < "$1"
