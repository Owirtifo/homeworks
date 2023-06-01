## Домашнее задание к занятию "12.4 Сетевое взаимодействие в K8S. Часть 1"

Манифесты располагаются в папке [configs](./configs/).

### Задание 1

1. Вывод успешного Deployment:

<img align="top" src="img/deploy.jpg">		<!--![deploy](img/deploy.jpg)-->

2. Проверка доступа до подов с помощью отдельного пода multitool:

 - Проверка доступности nginx:

<img align="top" src="img/curl_nginx.jpg">		<!--![curl_nginx](img/curl_nginx.jpg)-->

 - Проверка доступности multitool:

<img align="top" src="img/curl_multitool.jpg">		<!--![curl_multitool](img/curl_multitool.jpg)-->

### Задание 2

1. Вывод информации о сервисе с типом **NodePort**:

<img align="top" src="img/service.jpg">		<!--![service](img/service.jpg)-->

2. Проверка внешнего доступа к поду с nginx:

<img align="top" src="img/curl_nginx2.jpg">		<!--![curl_nginx2](img/curl_nginx2.jpg)-->
