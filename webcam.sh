#!/bin/bash
echo ""
echo ""
echo "==================================================="
echo "This is script for scaning ips working with ip-cam"
echo "==================================================="
echo ""
echo "1) To run the script, install nmap. If not, maybe sudo apt install nmap ?
2) Run as root or disable password for root."
echo ""
echo "Recomended config:"
echo ""
echo "      554 - RTSP
      8000 - service port
      8091 - data port
      8899 - ONVIF1"

function dow {
	echo -ne '#####                                              (10%)\r'
	sleep 0.5
	echo -ne '##########                                         (20%)\r'
	sleep 0.5
	echo -ne '###############                                    (30%)\r'
	sleep 0.5
	echo -ne '####################                               (40%)\r'
	sleep 0.5
	echo -ne '#########################                          (50%)\r'
	sleep 0.5
			}
echo ""
read -p "Save the result to: " result
echo ""
read -p "Input 1 or 4 ports, if you want to enter more than four ports, click 'more': " a
echo ""

if [ "$a" == 1 ]; then 
	read -p "Specify port number (without spaces): " q
		echo ""
		echo "Scan port $q started"
		echo ""
		echo "Ip-addresses are stored in a file: $result"
		time=$(date +%s)
		echo ""
		dow
		nmap -iL ips.txt -p $q --open > done.txt

elif [ "$a" == 2 ]; then
	read -p "Specify the first port number: " w
	read -p "Specify the number of the second port: " e
		echo ""
		echo "Scan ports $w and $e started"
		echo ""
		echo "Ip-addresses are stored in a file: $result"
		time=$(date +%s)
		echo ""
		dow
		nmap -iL ips.txt -p $w $e --open > done.txt
	
elif [ "$a" == 3 ]; then
	read -p "Specify the first port number: " a
	read -p "Specify the number of the second port: " s
	read -p "Specify the number of the third port: " d
		echo ""
		echo "Scan ports $a , $s and $d started"
		echo ""
		echo "Ip-addresses are stored in a file: $result"
		time=$(date +%s)
		echo ""
		dow
		nmap -iL ips.txt -p $a $s $d --open > done.txt
		

elif [ "$a" == 4 ]; then
	read -p "Specify the first port number: " z
	read -p "Specify the number of the second port: " x
	read -p "Specify the number of the third port: " c
	read -p "Specify the fourth port number: " v
		echo ""
		echo "Scan ports $z, $x, $c and $v started"
		echo ""
		echo "Ip-addresses are stored in a file: $result"	
		time=$(date +%s)
		echo ""
		dow
		nmap -iL ips.txt -p $z $x $c $v --open > done.txt	

elif [ "$a" == more ]; then 
	read -p "Enter the number of ports: " select
	echo ""
		ports=()
			for (( i = 0; i < $select; i++ )); do
				read -p "Enter port number: " input
		ports[$i]=$input
			done
	echo ""
	echo "Scan ports ${ports[*]} started"
	time=$(date +%s)
	echo ""
	echo "Ip-addresses are stored in a file: $result"
	echo ""
	dow
	nmap -iL ips.txt -p ${ports[*]} --open > done.txt
	
fi

echo -ne '##############################                     (60%)\r'
sleep 1
echo -ne '###################################                (70%)\r'
sleep 0.5
echo -ne '########################################           (80%)\r'
sleep 0.2

grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' done.txt > $result

echo -ne '#############################################      (90%)\r'
sleep 0.2

sudo rm done.txt

echo -ne '##################################################(100%)\r'
echo -ne '\n'
echo ""
echo "Result:"
echo ""
cat $result | awk '{split($0,a,":"); print a[1]}' | sort -u
echo ""
echo "Scan was running $(($(date +%s)-$time)) second."
echo ""