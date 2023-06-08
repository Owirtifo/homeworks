## Домашнее задание к занятию "12.5 Сетевое взаимодействие в K8S. Часть 2"

Манифесты располагаются в папке [configs](./configs/).

### Задание 1

1. Вывод успешных Deployments и Services:

<img align="top" src="img/all.jpg">		<!--![all](img/all.jpg)-->

2. Проверка наличия связи между приложениями:

 - Проверка доступности nginx:

<img align="top" src="img/check_nginx.jpg">		<!--![check_nginx](img/check_nginx.jpg)-->

 - Проверка доступности multitool:

<img align="top" src="img/check_multitool.jpg">		<!--![check_multitool](img/check_multitool.jpg)-->

### Задание 2

1. Включаем контроллер Ingress командой:

**microk8s enable ingress**

2. Вывод информации после создания объекта Ingress:

<img align="top" src="img/ingress.jpg">		<!--![ingress](img/ingress.jpg)-->

3. Проверка доступности приложений:

- frontend:

<img align="top" src="img/front.jpg">		<!--![front](img/front.jpg)-->

- backend:

<img align="top" src="img/backend.jpg">		<!--![backend](img/backend.jpg)-->
