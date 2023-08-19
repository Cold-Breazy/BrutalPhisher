#!/bin/bash

# colors
green="\033[1;32m"
red="\033[1;31m"
yelo="\033[1;33m"

# serverless tricker
adty() {
  text=$1
  delay=$2

  for ((i = 0; i < ${#text}; i++)); do
    echo -n "${text:i:1}"
    sleep "$delay"
  done

  echo
}


adhome(){
adlogo
adlist
}

adlogo(){
clear
echo -e "${red}"
adty "         A D M I N   P A N" 0.01
echo
sleep 0.5
}


adlist(){
echo
echo -e "${red}[${green}1${red}] ${yelo}SEE AVAILABLE DATA & DELETE"
echo -e "${red}[${green}2${red}] ${yelo}SEE ALL HACKED ACCOUNTS"
echo -e "${red}[${green}3${red}] ${yelo}SEE TOOL USERS LIST"
echo -e "${red}[${green}4${red}] ${yelo}SEE ${green}HACK-HIVE${yelo} MEMBERSHIP REQUESTS"
echo -e "${green}"
read -p "[+] OPTION |=> " lopt
if [[ "$lopt" == "1" ]];
then
adlogo
adfiles
elif [[ "$lopt" == "2" ]];
then
adlogo
adhacked
adhome
elif [[ "$lopt" == "4" ]];
then
adlogo
requesti
home
elif [[ "$lopt" == "3" ]];
then
adlogo
adusr
home
else
echo "    [×] OPTION NOT RECOGNISED"
sleep 1.5
adhome
fi
}
# files
adfiles(){
python filez/crf.py
}

# see list
adhacked(){
python filez/cnf.py
}

requesti(){
echo "    OPTION NOT YET AVAILABLE"
echo
sleep 3
adhome
}

adusr(){
python filez/users.pl
}
adhome
