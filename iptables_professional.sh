#!/bin/bash
echo -e  "\e[1m\e[32m##############################################################"
echo "#################                            #################"
echo "#####              Professional IP Tables                #####" 
echo "#################                            #################"
echo "##############################################################"
echo''
echo -e "\e[1m\e[32mThis ip iptables script"
read -p "what is your option numbers: 
1)show all iptables that done
2)DROP OUTPUT
3)ACCEPT OUTPUT
4)DROP iNPUT
5)ACCEPT INPUT
6)open specific port
7)close specific port
8)show iptables items as numbers
9)cut ping between any device in network
10)reconnect ping between any device in network 
11)remove all changes
12)replace item in itables
13)remove item from iptables
14)PREROUTING to one port
15)echo 1 start
16)echo 1 stop
:" num

if [ $num -eq 1 ]
then
iptables -L 
fi

if [ $num -eq 2 ]
then
iptables -P OUPUT DROP
echo ''
echo "OUPUT DROP is done"
fi

if [ $num -eq 3 ]
then
iptables -P OUPUT ACCEPT
echo ''
echo "OUPUT ACCEPT is done"
fi

if [ $num -eq 4 ]
then
iptables -P INPUT DROP
echo ''
echo "INPUT DROP is done"
fi

if [ $num -eq 5 ]
then
iptables -P INPUT ACCEPT
echo ''
echo "INPUT ACCEPT is done"
fi

if [ $num -eq 6 ]
then
read -p "what is your port number: " portn
iptables -A INPUT -p tcp --dport ${portn:=445} -j ACCEPT
echo ''
echo "open port is done"
fi

if [ $num -eq 7 ]
then
read -p "what is your port number: " portn
iptables -A INPUT -p tcp --dport $portn -j DROP
echo ''
echo "close port is done"
fi

if [ $num -eq 8 ]
then
iptables -L -n --line-numbers
fi

if [ $num -eq 9 ]
then
read -p "Please enter vicim ip: " ip
iptables -I INPUT -s $ip -j DROP 
echo ''
echo "Cut connection between you and vicim is done"
fi

if [ $num -eq 10 ]
then
read -p "Please enter vicim ip: " ip
iptables -I INPUT -s $ip -j ACCEPT 
echo ''
echo "Accept connection between you and vicim is done"
fi

if [ $num -eq 11 ]
then
iptables -F
echo ''
echo "remove all item is done"
fi

if [ $num -eq 12 ]
then
iptables -L -n --line-numbers
read -p "Enter your item numbers to reblace :" item
read -p "what is your port number: " portn
read -p "ACCEPT or DROP : " state
var1=$(tr '[:lower:]' '[:upper:]' <<< "$state" ) 
iptables -R INPUT $item -p tcp --dport $portn -j $var1
if [ $# -eq 0 ]
then 
echo ''
echo "replace state to $state is done and $state port number is "$portn" " 
fi
fi

if [ $num -eq 13 ]
then
iptables -L -n --line-numbers
read -p "Enter your item numbers to remove :" item
iptables -D INPUT $item
echo ''
echo "Delete item number $item is done"

fi

if [ $num -eq 14 ]
then
read -p "what is your dport number: " dportn
read -p "what is your to-port number: " to
iptables -t nat -A PREROUTING -p tcp --dport ${dportn:=80} -j REDIRECT --to-port ${to:=8080}
echo ''
echo "PREROUTING to port $to is done"

fi

if [ $num -eq 15 ]
then
echo 1 > /proc/sys/net/ipv4/ip_forward
echo ''
echo "echo 1 start is done"
 
fi

if [ $num -eq 16 ]
then
echo 0 > /proc/sys/net/ipv4/ip_forward
echo ''
echo "echo 1 stop is done"
fi

echo''
echo "##############################################################"
echo "#####################                #########################"
echo "#####################  END OF SCRIPT #########################" 
echo "#####################                #########################"
echo "##############################################################"
echo "This Script done by Ahmad Jawabreh"
echo "Have a nice day :)"
echo "GoodBye"

sleep 3

exit 1
