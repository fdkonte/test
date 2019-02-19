#!/usr/bin/env bash

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

# login to jump box
echo "Test"

# configure aws cli export variables
export AWS_ACCESS_KEY_ID=ASDFLKASDFKLSKLDF
export AWS_SECRET_ACCESS_KEY=ADKFASKFADFSKDAFSKDFSKADFSKADFS

# run inventory command redirect to file
bosh -e main ssh -c 'apt list --installed' >> installed-packages.txt

# aws s3 cp to folder the inventory file
aws s3 cp installed-packages.txt s3://$current_time.installed-packages.txt

# remove file
rm installed-packages.txt

# logout
exit
