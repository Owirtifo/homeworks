## Домашнее задание к занятию "4.1. Командная оболочка Bash: Практические навыки"

1. В первом случае мы получаем строку a+b, т.к. a и b - не переменные  
Во втором случае мы получаем строку 1+2, т.к. выполнелась конкатенация строк в переменных a и b  
В первом случае мы получаем 3, т.к. выполнелась арифметическая операция внутри (( ... ))
2. Необходимо добавить скобку к while ((1==1)) и в конструкцию if добавить:
```
else  
break  
```
Чтобы в случае успешного выполнения команды curl, выходить из скрипта.

3. 
```
#!/bin/bash
for ((i = 0; i <= 5; i++))
do
nmap -v -n -p T:80 192.168.0.1 173.194.222.113 87.250.250.242 >> log
done
```
4. 
```
#!/bin/bash
while true
do
nmap -v -n -p T:80 192.168.0.1 173.194.222.113 87.250.250.242 >> log
x=(`cat log | grep 'host down'`)
if [[ -n $x ]]
then
echo ${x[4]} >> error
break
fi
done
```
### Дополнительное задание.
```
#!/bin/sh
COMMIT_MSG_FILE=$1
START_LINE=`head -n1 $COMMIT_MSG_FILE`
PATTERN="[.+]*"
if ! [[ "$START_LINE" =~ $PATTERN && $(echo $START_LINE | wc -m) -ge 31 ]]
then
  echo "The number of characters must be no more than 30"
  exit 1
fi
```
