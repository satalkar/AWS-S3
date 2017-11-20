#!/bin/sh

#  ls-buckets.sh
#  
#
#  Created by Aditya Satalkar on 8/3/17.
#

#"aws s3api list-buckets" this command retrieves a list of all the buckets in AWS in a JSON format
<<"COMMENT"

{
    "Buckets": [
        {
            "Name": "bucket1",
            "CreationDate": "2016-07-02T00:20:53.000Z"
        },
        {
            "Name": "bucket2",
            "CreationDate": "2016-08-26T12:39:59.000Z"
        },
        {
            "Name": "bucket3",
            "CreationDate": "2015-09-21T14:57:48.000Z"
        },
        {
            "Name": "bucket4",
            "CreationDate": "2015-07-28T04:29:54.000Z"
        },
        {
            "Name": "bucket5",
            "CreationDate": "2017-04-23T06:01:38.000Z"
        },
        {
            "Name": "bucket6",
            "CreationDate": "2017-04-26T18:31:59.000Z"
        },
        {
            "Name": "bucket7",
            "CreationDate": "2016-04-11T21:25:53.000Z"
        },
        {
            "Name": "bucket8",
            "CreationDate": "2015-10-06T18:18:20.000Z"
        },
        {
            "Name": "bucket8",
            "CreationDate": "2016-06-07T17:10:16.000Z"
        },
        {
            "Name": "bucket9",
            "CreationDate": "2015-10-15T13:48:59.000Z"
        },
        {
            "Name": "bucket10",
            "CreationDate": "2016-04-21T18:12:03.000Z"
        },
        {
            "Name": "bucket11",
            "CreationDate": "2014-11-21T21:03:53.000Z"
        },
        {
            "Name": "bucket12",
            "CreationDate": "2015-01-14T05:01:09.000Z"
        }
    ],
    "Owner": {
        "DisplayName": "abcdef",
        "ID": "2EjPicHqCPVfXUnciJrgJqWh2EjPicHqCPVfXUnciJrgJqWh"
    }
}

COMMENT


#so to only retrieve the Key from this json and print it into a text file we need to parse the JSON
#to do that I've used the jq library for shell
#the command here would be jq 'Buckets[].Name'
#this command is appended to the aws s3api list-objects command
#so the variable var only gets the Bucket Names in it from the retrieved JSON
var="$(aws s3api list-buckets | jq '.Buckets[].Name')"

#this Bucket Name is then printed to a text file
#I'm also using | tr -d '"' to remove the " sign from being stored in the textfile
echo "$var" | tr -d '"'  >> list_of_buckets.txt
