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
bash_command = ["cd ", path, " && " "git status"]
result_os = os.popen(''.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(path+prepare_result)
```
4. 
```
#!/usr/bin/env python3

import socket, time

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
  time.sleep(3)
 ```



