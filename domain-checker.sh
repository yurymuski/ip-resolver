#!/bin/bash
# uncomment for verbosity
#set -x

# IP to check related domains
IP=""

for domain in `cat ./parsed-list.txt`; do
echo $domain;
ACTUAL_COUNT=`dig $domain +short | grep -c $IP`

if [ $ACTUAL_COUNT -lt 1 ]; then
  echo "$domain is not actual"
else
	echo  "$domain is ok"
  echo $domain >> ./actual-list.txt
fi

done
