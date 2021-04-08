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

def check_ip(URL):
  return socket.gethostbyname(URL)

addr = {URL1: check_ip(URL1), URL2: check_ip(URL2), URL3: check_ip(URL3)}

while True:
  for i in addr:
    print(f'{i} - {addr[i]}')
  new_addr = {URL1: check_ip(URL1), URL2: check_ip(URL2), URL3: check_ip(URL3)}
  for j in addr:
    if new_addr[j] != addr[j]:
      print(f'[ERROR] {j} IP mismatch: {addr[j]} {new_addr[j]}')
    file = [{URL1: check_ip(URL1)}, {URL2: check_ip(URL2)}, {URL3: check_ip(URL3)}]
    with open("addr.json", "w") as file_json:
      json.dump(file, file_json, indent=2)
    with open("addr.yaml", "w") as file_yaml:
      yaml.dump(file, file_yaml)
  time.sleep(3)
 ```