#!/bin/bash
echo "Starting audio pull"
url=$1
name=$(date +%F-%T)
file="/home/ec2-user/rsah/archive/$2-$name.mp3"
echo "Creating stream file $file"
while true; do curl -o - $url ; done>$file
