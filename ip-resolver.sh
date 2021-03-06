#!/bin/bash
# uncomment for verbosity
#set -x

# your virustotal api-key
APIKEY=""
# IP to check related domains
IP=""
# request limit of virustotal API
LIMIT=40 # max
# virustotal API v3
URL="https://www.virustotal.com/api/v3/ip_addresses/${IP}/resolutions?limit=$LIMIT"

for i in {1..500}; do
echo "checking $URL page $i";
curl -s -X GET --url $URL  -H "x-apikey: $APIKEY" > ./resolutions-${i}.txt
URL=`grep "cursor=" ./resolutions-${i}.txt | grep "next" |awk -F " " '{print $NF}' | sed 's/"//g' `
# virustotal limit 4r/m
sleep 20

done

cat resolutions-* | grep host_name | sort | uniq |awk -F " " '{print $NF}' | sed 's/"//g' | sed 's/,//g' > ./parsed-list.txt
