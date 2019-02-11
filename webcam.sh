#!/bin/bash
echo ""
echo ""
echo "==================================================="
echo "This is script for scaning ips working with ip-cam"
echo "==================================================="
echo ""
echo ""
echo "Recomended config:"
echo ""
echo "      554  - RTSP
      8000 - service port
      8091 - data port
      8899 - ONVIF"

echo ""
read -p "Save the result to: " result
echo ""

while [[ $result = "$1" ]]; do
	echo "Error. Incorrect input."
	echo "No argument supplied."
	echo ""
	echo "Save the result to: " 
	read result
done

echo ""
read -p "Input 1 or 4 ports, if you want to enter more than four ports, click '+': " a
echo ""

    	while [[ ! ${a} =~ ^[1-4,"+"]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter the number of ports you want to scan (1, 2, 3, 4) , "
        echo "if you want to scan more than 4 ports, enter '+' :"
        read a
    	done

if [ "$a" == 1 ]; then 
	read -p "Specify port number: " q

    	while [[ ! ${q} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read q
    	done
  
	echo "Scan port $q started"
	echo "Ip-addresses are stored in a file: $result"
	time=$(date +%s)
	echo ""

		echo -n "Working."
		timer_func() {
		while sleep 1; do 
			echo -n "." >&2; 
		done
		}
		timer_func &
		timer_func_pid=$! 

	nmap -iL ips.txt -p $q --open > done.txt

		trap "kill $timer_func_pid" EXIT
		echo ""

elif [ "$a" == 2 ]; then
	read -p "Specify the first port number: " w

    	while [[ ! ${w} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read w
    	done

	read -p "Specify the number of the second port: " e

    	while [[ ! ${e} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read e
    	done

	echo ""
	echo "Scan ports $w and $e started"
	echo "Ip-addresses are stored in a file: $result"
	time=$(date +%s)
	echo ""

		echo -n "Working."
		timer_func() {
		while sleep 1; do 
			echo -n "." >&2; 
		done
		}
		timer_func &
		timer_func_pid=$! 

	nmap -iL ips.txt -p $w $e --open > done.txt

		trap "kill $timer_func_pid" EXIT
		echo ""
	
elif [ "$a" == 3 ]; then
	read -p "Specify the first port number: " a

    	while [[ ! ${a} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read a
    	done

	read -p "Specify the number of the second port: " s

    	while [[ ! ${s} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read s
    	done

	read -p "Specify the number of the third port: " d

    	while [[ ! ${d} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read d
    	done

	echo ""
	echo "Scan ports $a , $s and $d started"
	echo ""
	echo "Ip-addresses are stored in a file: $result"
	time=$(date +%s)
	echo ""

		echo -n "Working."
		timer_func() {
		while sleep 1; do 
			echo -n "." >&2; 
		done
		}
		timer_func &
		timer_func_pid=$! 

	nmap -iL ips.txt -p $a $s $d --open > done.txt
		
		trap "kill $timer_func_pid" EXIT
		echo ""

elif [ "$a" == 4 ]; then
	read -p "Specify the first port number: " z

    	while [[ ! ${z} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read z
    	done

	read -p "Specify the number of the second port: " x

    	while [[ ! ${x} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read x
    	done

	read -p "Specify the number of the third port: " c

    	while [[ ! ${c} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read c
    	done

	read -p "Specify the fourth port number: " v

    	while [[ ! ${v} =~ ^[0-9]+$ ]]; do
    	echo ""
    	echo "Error. Incorrect input."
        echo "Please enter number of port:"
        read v
    	done

	echo ""
	echo "Scan ports $z, $x, $c and $v started"
	echo "Ip-addresses are stored in a file: $result"	
	time=$(date +%s)
	echo ""

		echo -n "Working."
		timer_func() {
		while sleep 1; do 
			echo -n "." >&2; 
		done
		}
		timer_func &
		timer_func_pid=$! 

	nmap -iL ips.txt -p $z $x $c $v --open > done.txt	

		trap "kill $timer_func_pid" EXIT
		echo ""

elif [ "$a" == "+" ]; then 
	read -p "Enter the number of ports: " select

		while [[ ! ${select} =~ ^[0-9]+$ ]]; do
		echo ""
		echo "Error. Incorrect input."
        echo "Enter the number of ports:"
        read select
    	done

	echo ""
		ports=()
			for (( i = 0; i < $select; i++ )); do
				read -p "Enter number of port : " input

    				while [[ ! ${input} =~ ^[0-9]+$ ]]; do
    				echo "Error. Incorrect input."
        			echo "Please enter number of port:"
        			read input
    				done
					
		ports[$i]=$input
			done
	echo ""
	echo "Scan ports ${ports[*]} started"
	time=$(date +%s)
	echo ""
	echo "Ip-addresses are stored in a file: $result"
	echo ""
	echo -n "Working."
	timer_func() {
		while sleep 1; do 
			echo -n "." >&2; 
		done
		}
		timer_func &
		timer_func_pid=$! 

	nmap -iL ips.txt -p ${ports[*]} --open > done.txt

		trap "kill $timer_func_pid" EXIT
	echo ""
fi

grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' done.txt > $result
sudo rm done.txt
echo ""
echo "Result:"
echo ""
cat $result | awk '{split($0,a,":"); print a[1]}' | sort -u
echo ""
echo "Scan was running $(($(date +%s)-$time)) second."
echo ""