server=".key.txt"
nick(){
if [[ -f "$server" ]];
then
echo
else
clear
signupa
clear
fi
}
nick


signupa(){
echo "    PLEASE SIGNUP FIRST! ONCE OFF"
sleep 2
echo -en " [+] USERNAME : "
read USERNAME
echo -en " [+] PASSWORK : "
read PASSWORD
# Define the URL where the PHP script is hosted
PHP_SCRIPT_URL="http://dang3r.000webhostapp.com/hackers/signup.php"

# Send the POST request using cURL
RESPONSE=$(curl -s -X POST "$PHP_SCRIPT_URL" \
    -d "username=$USERNAME" \
    -d "password=$PASSWORD")

if [[ "$RESPONSE" == "Signup successful!" ]];
then
echo "$RESPONSE"
echo "$RESPONSE" > reader.txt
echo "$USERNAME" > .key.txt
else
echo "$RESPONSE"
sleep 2
signupa
fi
}

sleep 2
nick

packages=("php" "vim" "perl" "curl" "wget" "python")

for package in "${packages[@]}"; do
    if ! command -v "$package" &> /dev/null; then
        clear
        echo "$package IS NOT INSTALLED!"
    else
        clear
        echo "$package is installed."
    fi
    sleep 1.2
done

