## Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"

1. 
```
{ "info" : "Sample JSON output from our service\t",
    "elements" :[
        { "name" : "first",
        "type" : "server",
        "ip" : 7175
        },
        { "name" : "second",
        "type" : "proxy",
        "ip" : "71.78.22.43"
        }
    ]
}
```
2. 
```
#!/usr/bin/env python3

import socket, time, json, yaml

URL1 = 'google.com'
URL2 = 'mail.google.com'
URL3 = 'drive.google.com'

def check_ip():
  return {URL1: socket.gethostbyname(URL1), URL2: socket.gethostbyname(URL2), URL3: socket.gethostbyname(URL3)}
def for_file():
  return [{URL1: socket.gethostbyname(URL1)}, {URL2: socket.gethostbyname(URL2)}, {URL3: socket.gethostbyname(URL3)}]

addr = check_ip()

while True:
  for url in addr:
    print(f'{url} - {addr[url]}')
  new_addr = check_ip()
  for new_url in addr:
    if new_addr[new_url] != addr[new_url]:
      print(f'[ERROR] {new_url} IP mismatch: {addr[new_url]} {new_addr[new_url]}')
    file = for_file()
    with open("addr.json", "w") as file_json:
      json.dump(file, file_json, indent=2)
    with open("addr.yaml", "w") as file_yaml:
      yaml.dump(file, file_yaml)
  time.sleep(3)
 ```