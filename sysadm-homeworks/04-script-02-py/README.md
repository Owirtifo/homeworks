## Домашнее задание к занятию "4.1. Командная оболочка Bash: Практические навыки"

1. При выполнении c = a + b будет ошибка, нельзя складывать строку и число  
Чтобы получить 12 - c = str(a) + b  
Чтобы получить 3 - c = a + int(b)
2. 
```
#!/usr/bin/env python3

import os

path = "~/GIT/devops-netology/"
bash_command = ["cd ", path, " && " "git status"]
result_os = os.popen(''.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(path+prepare_result)
```
3. 
```
#!/usr/bin/env python3

import os, sys

path = sys.argv[1]
bash_command = ["cd ", path, " && ", "git status"]
path_test = path+".git"
if os.path.exists(path_test) == 1:
  result_os = os.popen(''.join(bash_command)).read()
  for result in result_os.split('\n'):
    if result.find('modified') != -1:
      prepare_result = result.replace('\tmodified:   ', '')
      print(path+prepare_result)
else:
  print(f"Path: {path} is not a git directory")
```
4. 
```
#!/usr/bin/env python3

import socket, time

URL1 = 'google.com'
URL2 = 'mail.google.com'
URL3 = 'drive.google.com'

def check_ip():
  return {URL1: socket.gethostbyname(URL1), URL2: socket.gethostbyname(URL2), URL3: socket.gethostbyname(URL3)}

addr = check_ip()

while True:
  for url in addr:
    print(f'{url} - {addr[url]}')
  new_addr = check_ip()
  for new_url in addr:
    if new_addr[new_url] != addr[new_url]:
      print(f'[ERROR] {new_url} IP mismatch: {addr[new_url]} {new_addr[new_url]}')
  time.sleep(3)
 ```



