#!/bin/bash

#B. Using Apache log example create a script to answer the following questions:

filename="apache_logs.txt"

echo "=========================================================="
echo "1. From which ip were the most requests?"
awk '{print $1}' $filename | sort | uniq -c | sort -g | tail -n 1 | awk '{print "      IP: " $2, "Requests: " $1}'
echo "=========================================================="
echo "2. What is the most requested page?"
awk '{print $7}' $filename | sort | uniq -c | sort | tail -n 1 | awk '{print "     Page: " $2, "Requests: " $1}'
echo "=========================================================="
echo "3. How many requests were there from each ip?"
awk '{print $1}' $filename | sort | uniq -c  | awk '{print "     IP: " $2, "Requests: " $1}'
echo "=========================================================="
echo "4. What non-existent pages were clients referred to?"
awk '{print $7}' $filename | grep "404" | uniq
echo "=========================================================="
echo "5. What time did site get the most requests?"
awk '{print $4}' $filename | sort | uniq -dc | sort -r | head -n 10 | awk '{print "     Time: " $2, "Requests: " $1}'
echo "=========================================================="
echo "6. What search bots have accessed the site? (UA + IP)"
cat $filename | grep -i bot|awk '{print "UA: " $12 "  IP: " $1}' | sort | uniq | sort -nr
echo "=========================================================="