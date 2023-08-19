# perl

import requests
import json

# Fetch data from PHP file
response = requests.get("http://dang3r.000webhostapp.com/users.php")
data = json.loads(response.text)

# Display fetched data
for item in data:
    username = item["Username"]
    email = item["Email"]
    print("Username:", username)
    print("Email:", email)
    print("═", * 35)
    print()
