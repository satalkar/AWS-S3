#!/bin/sh

#  setup.sh
#  
#
#  Created by Aditya Satalkar on 8/4/17.
#

#cd Documents/ObjectKeys/

sh ./ls-buckets.sh

sh ./createFile.sh list_of_buckets.txt

sh ./get-bucket-acl.sh list_of_buckets.txt

sh ./list-objects.sh list_of_buckets.txt

sh ./bbb.sh list_of_buckets.txt