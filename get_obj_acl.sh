#!/bin/bash



#Defining a function here
print2CSV()
{
#Priniting the results into a CSV file   bucket | object | Type | DisplayName (if applicable) | URI | Permission
filename="$1"".csv"

echo "$2,$3,$4,$5" | tr -d '"' >> "$filename"
}

doJob()
{
#while IFS='' read -r line || [[ -n "$line" ]]; do
#echo "Object Key: $line"



#storing the aws reply in a variable named json because the reply received from aws is in JSON format
json="$(aws s3api get-object-acl --bucket $1 --key $2)"



#filtering the results that only have Group in it
grants="$(echo "$json" | jq '.Grants[] | select (.Grantee.Type | contains("Group"))')"


#create a loop from here {


#storing the Grantee Type in typ variable
typ="$(echo "$grants" | jq '.Grantee.Type')"

#storing the Grantee URI in uri variable
uri="$(echo "$grants" | jq '.Grantee.URI')"

#storing the Grantee Permission in perm variable
perm="$(echo "$grants" | jq '.Permission')"

#printing results
#echo "The type is : $typ"
#echo "The URI is : $uri"
#echo "The perm is : $perm"

#Priniting the results into a CSV file   bucket | object | Type | DisplayName (if applicable) | URI | Permission

#Invoking the parameterized print function
print2CSV $1 $2 $typ $uri $perm


#loop ends here }

#done < "$1"
}

doJob $1 $2
