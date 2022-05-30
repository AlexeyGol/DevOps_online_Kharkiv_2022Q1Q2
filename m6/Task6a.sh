#!/bin/bash
function empty_param {
	echo "Please provide arguments to the script!"
	echo "Here is the list of parameters: "
	echo "--all key displays the IP addresses and symbolic names of all hosts in the current subnet"
	echo "--target key displays a list of open system TCP ports"
	exit
}

function key_all() {
    subnet=192.168.0.0/24
    echo "Use default subnet 192.168.0.0/24? (y/n)"
    read usr_input
    #Used function instead of variable to contain such command
    #Using grep to show only lines with IPs; awk to show only hostname and IP
    function nmap_command {
      nmap -sn ${subnet} | grep report | awk '{print $5 " " $6}'
    }
    #place to enter subnet, if it differs from default
    if [ $usr_input == 'y' ];
    then
      echo "Scanning 192.168.0.0/24"
      echo "IP addresses and sybm names of host in current subnet: "
      nmap_command
    else
      echo "Please enter the current subnet with CIDR notation: "
      read subnet
      echo "Scanning $subnet"
      echo "IP addresses and sybm names of host in current subnet: "
      nmap_command
    fi
}

function key_target() {
    echo "Here is the list of open system TCP ports:"
    netstat -tulpn | grep tcp
}

#param check
if [ $# -eq 0 ]; then
	empty_param
else 
	case $1 in 
		--all) key_all;;
		--target) key_target;;
	esac
fi

