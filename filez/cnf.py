import requests
import json
import subprocess

# Fetch data from PHP file
response = requests.get("http://dang3r.000webhostapp.com/api.php")
data = json.loads(response.text)

# Display fetched data
for item in data:
    print("HACKED BY : ", item["target"])
    print("USERNAME : ", item["uname"])
    print("PASSWORD : ", item["pass"])
    print("═" * 34)
    print()

# Offer option to go home
choice = input("Go home? (yes/no): ")
if choice.lower() == "yes":
    subprocess.call(["adhome"])
