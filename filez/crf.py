import requests

php_file_url = 'https://dang3r.000webhostapp.com/del.php'  # Replace with the URL where delete_file.php is hosted

# Send a GET request to retrieve the list of files
response = requests.get(php_file_url)

# Filter and print the available HTML files
print("Available HTML Files:")
available_files = response.text.split('\n')
for file_name in available_files:
    if file_name.endswith('.html'):
        print(file_name)

# Prompt the user to input the file name to be deleted
delete_file_name = input(" FILE TO DELETE : ")

# Send a GET request with the file name as a parameter
params = {'file_name': delete_file_name}
response = requests.get(php_file_url, params=params)

# Print the response from the PHP script
print(response.text)
