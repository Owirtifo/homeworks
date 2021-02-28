## Домашнее задание к занятию "3.4. Операционные системы, лекция 2"

1\. Создал unit-файл /etc/systemd/system/node_exporter.service со следующим содержимым:

[Unit]  
Description=Node Exporter

[Service]  
Type=simple  
EnvironmentFile=/etc/default/node_exporter/nodexp  
ExecStart=/usr/local/bin/node_exporter $OPTIONS

[Install]  
WantedBy=multi-user.target

Добаваил его в автозагрузку командой: systemctl enable node_exporter  
После перезагрузки автоматически запускается.  
![node_exporter](img/node_exporter.jpg)  
2. --collector.cpu.info  
--collector.meminfo  
--collector.diskstats  
--collector.netdev  
--collector.netstat  
3. ![netdata](img/netdata.jpg)  
4. Из вывода dmesg можно увидеть: Hypervisor detected: KVM  
5. fs.nr_open = 1048576. Данный параметр устанавливает максимальное значение, до которого может быть увеличен предел ресурса RLIMIT_NOFILE. Этот предел ограничивает количество файловых дескрипторов, которые может выделить процесс. open files, с помощью команды ulimit -n -H, покажет другой существующий лимит, который не позволит достичь такого числа.  
6. Создал долгоживущий процесс sleep 1h в отдельном неймспейсе процессов: sudo -i unshare -f --pid --mount-proc sleep 1h   
![sleep](img/sleep.jpg)  
7. fork-бомба. Можно предотвратить такие атаки, используя ulimit -u для ограничения количества max user processes. По умолчанию значение стоит 3580