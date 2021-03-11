#!/bin/bash


ip addr show | awk '/inet/{split($2,a,"/");print "IP address: "a[1];exit}' >> network_Info.txt
grep "nameserver" /etc/resolv.conf | awk '{print "DNS " $2}' >> network_Info.txt
netstat -lt | awk '/tcp/ {print $0}' >> network_Info.txt
date >> network_Info.txt
cat network_Info.txt
