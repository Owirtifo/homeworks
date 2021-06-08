## Домашнее задание к занятию "6.3. MySQL"

1. docker run --rm --name mysql -dti -e MYSQL_ROOT_PASSWORD=root  mysql:8  

<img align="top" src="img/status.jpg">		<!--![status](img/status.jpg)-->  

Количество записей с price > 300:

<img align="top" src="img/price.jpg">		<!--![price](img/price.jpg)-->

2. 
Создание пользователя:

    CREATE USER 'test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'test-pass' 
	WITH MAX_CONNECTIONS_PER_HOUR 100 PASSWORD EXPIRE INTERVAL 180 DAY FAILED_LOGIN_ATTEMPTS 3 
	ATTRIBUTE '{"fname": "Pretty", "lname": "James"}';
	
    GRANT SELECT ON test_db.* TO 'test'@'localhost';
	
Данные по пользователю test:

<img align="top" src="img/attributes.jpg">		<!--![attributes](img/attributes.jpg)-->

3.

Engine таблицы orders:

<img align="top" src="img/engine.jpg">		<!--![engine](img/engine.jpg)-->

MyISAM:

<img align="top" src="img/myisam.jpg">		<!--![engine](img/myisam.jpg)-->

InnoDB:

<img align="top" src="img/innodb.jpg">		<!--![innodb](img/innodb.jpg)-->

4.

Файл my.cnf:

<img align="top" src="img/config.jpg">		<!--![config](img/config.jpg)-->
