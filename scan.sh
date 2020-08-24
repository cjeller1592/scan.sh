#!/bin/bash

range=`ip route | grep tap0 | awk '{print $1}'`

nmap $range -oN nmap.txt

ip=`echo $range | cut -f1,2 -d'.'`

cat nmap.txt | grep "$ip" | awk '{if(NR>1)print}' | awk '{print $5}' > iplist.txt

nmap -sV -iL iplist.txt -oN version.txt
