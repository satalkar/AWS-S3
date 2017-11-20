#!/bin/sh

#
#  Created by Aditya Satalkar on 8/3/17.
#

#"aws s3api list-objects --buckets bucket-name" this command retrieves all the object keys in a json format
<<"COMMENT"


{
   "Contents":[
      {
         "Key":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh",
         "LastModified":"2017-01-23T15:58:06.000Z",
         "ETag":"\"2EjPicHqCPVfXUnciJrgJqWh-2\"",
         "Size":58552332,
         "StorageClass":"STANDARD",
         "Owner":{
            "DisplayName":"abcdef",
            "ID":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh"
         }
      },
      {
         "Key":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh",
         "LastModified":"2017-03-16T14:01:44.000Z",
         "ETag":"\"2EjPicHqCPVfXUnciJrgJqWh-1\"",
         "Size":10581990,
         "StorageClass":"STANDARD",
         "Owner":{
            "DisplayName":"abcdef",
            "ID":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh"
         }
      },
      {
         "Key":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh",
         "LastModified":"2017-05-19T00:05:13.000Z",
         "ETag":"\"2EjPicHqCPVfXUnciJrgJqWh-2\"",
         "Size":52438762,
         "StorageClass":"STANDARD",
         "Owner":{
            "DisplayName":"abcdef",
            "ID":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh"
         }
      },
      {
         "Key":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh",
         "LastModified":"2017-01-25T15:25:47.000Z",
         "ETag":"\"2EjPicHqCPVfXUnciJrgJqWh-1\"",
         "Size":7387912,
         "StorageClass":"STANDARD",
         "Owner":{
            "DisplayName":"abcdef",
            "ID":"2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh"
         }
      }
   ]
}


COMMENT

#read file gives as argument on command line
#the file is list_of_buckets.txt
while IFS='' read -r line || [[ -n "$line" ]]; do
#echo "Object Key: $line"
var="$line"

#create a text file of each bucket listed in list_of_buckets.txt
filename="$var"".txt"

#so to only retrieve the Key from this json and print it into a text file we need to parse the JSON
#to do that I've used the jq library for shell
#the command here would be jq 'Contents[].Key'
#this command is appended to the aws s3api list-objects command
#so the variable var only gets the Key in it from the object
cmd="$(aws s3api list-objects --bucket $line | jq '.Contents[].Key')"

#this key is then printed to a text file
#I'm also using | tr -d '"' to remove the " sign from being stored in the textfile
echo "$cmd" | tr -d '"'  >> "$filename"

done < "$1"