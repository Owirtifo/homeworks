## Домашнее задание к занятию "3.8. Компьютерные сети, лекция 3"

1. Такие службы, как http или ftp-data , закрывают соединения, как только получено обращение / данные. Поэтому мы будим видеть запись в столбце InActConn до тех пор, пока не истечет время ожидания соединения 120 сек.  
```
ipvsadm -Ln --timeout  
Timeout (tcp tcpfin udp): 900 120 300
```
2. Файлы конфигураций в папке configs. На WEB серверах назначил VIP адрес на lo и указал параметры:
```
sysctl -w net.ipv4.conf.lo.arp_ignore = 1
sysctl -w net.ipv4.conf.lo.arp_announce = 2
```
3. 3 адреса. Получается, что на каждой ноде будет по 3 экземпляра VRRP, и в каждом экземляре будет по одному VIP адреса. И получается, что в одном экземляре одна нода будет выступать одновременно MASTER, а в остальных экземлярах BACKUP.
	```
	vrrp_instance proxy_ip1 {
	state MASTER
	interface eth0
	virtual_router_id 1
	priority 255
	virtual_ipaddress {
	192.168.2.101/24 dev eth0 label eth0:1
		}
	}
	vrrp_instance proxy_ip2 {
	state BACKUP
	interface eth0
	virtual_router_id 2
	priority 200
	virtual_ipaddress {
	192.168.2.102/24 dev eth0 label eth0:2
		}
	}
	vrrp_instance proxy_ip2 {
	state BACKUP
	interface eth0
	virtual_router_id 3
	priority 100
	virtual_ipaddress {
	192.168.2.103/24 dev eth0 label eth0:3
		}
	}
	```
