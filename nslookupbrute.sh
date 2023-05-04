#!/bin/bash
# NsLookup Brute
# version: 0.9
# date: 04/05/2023


export WORDLIST="/wordlists/my_wordlists/inf/dns-20k.txt"


if [ -z "$1" ] && [ -z "$2" ]; then
echo "$0 [DOMAIN] [DNS IP]"
else 

	rm nslookupbrute.txt 2>/dev/null && touch nslookupbrute.txt

	echo "[+] nslookup brute (Domain: $1, DNS: $2) => $WORDLIST"

	while read line; do

	nslookup $line.$1 $2  > temp 

	if [ -z "$(cat temp | grep "server can't")" ]
	then
	#    cat temp| grep -v 'Server:		\|Address:	' | tee -a nslookupbrute.txt 
	cat temp| grep -v 'Server:		\|Address:	' > temp2
	export NAME=$(cat temp2 | grep Name:|awk {'print $2'})
	export IP=$(cat temp2 | grep Address:|awk {'print $2'})
	#echo "$NAME		$IP" | tee -a nslookupbrute.txt
	#printf '%*s' "10" $NAME $IP

	printf "%-30s %10s \n" $NAME  $IP

	fi
	done < $WORDLIST

	rm temp 2>/dev/null 

fi