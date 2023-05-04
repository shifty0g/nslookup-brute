# nslookup brute
use nslookup to brute a dns list to determine IP 

this is not the fastest in the world but it does the job.

## Requirements

you just need nslookup. 

everything else should be fine 

i use this on kali ;) 

## Install 

```
# just clone the repo

git clone https://github.com/shifty0g/nslookupbrute
cd nslookupbrute

# set the wordlist to use by editing the file and setting the WORDLIST parameter.. maybe something in seclists? 

export WORDLIST="/usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt"

# chmod it
chmod +x nslookupbrute.sh

# boom now your ready to go 
```

## Useage

```
./nslookupbrute.sh [DOMAIN] [DNS IP]
./nslookupbrute.sh solar.local 192.168.0.205
```

## Example Output

```
nslookupbrute.sh solar.local 192.168.0.205
[+] nslookup brute (Domain: solar.local, DNS: 192.168.0.205) => /wordlists/my_wordlists/inf/dns-20k.txt
ftp.solar.local                172.16.23.29 
ns1.solar.local                172.16.22.26 
ns2.solar.local                10.192.22.33 
test.solar.local               192.168.0.251 
admin.solar.local              10.16.22.23 
www-admin.solar.local          172.16.22.30 
```
