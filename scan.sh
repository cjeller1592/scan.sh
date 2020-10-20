#!/bin/bash

# Get the range of the VPN network 

range=`ip route | grep tap0 | awk '{print $1}'`

# Feed that range into a ping scan on Nmap

nmap -sn $range -oN nmap.txt

# Edit the output

grep 'report' uplist | awk '{print $5}' | head -n -1 > iplist.txt

# Feed the edited output into an Nmap version scan

nmap -sV -iL iplist.txt -oN version.txt
