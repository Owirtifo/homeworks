## Домашнее задание к занятию "13.3. Конфигурация приложений"

Манифесты располагаются в папке [configs](./configs/).

### Задание 1

1. Ошибка после создания 2-х контейнеров — nginx и multitool:

<img align="top" src="img/before_deploy.jpg">		<!--![before_deploy](img/before_deploy.jpg)-->

Ошибка происходит в связи с тем, что контейнер multitool пытается использовать уже занятый на адресе 0.0.0.0 порт 80. Для исправления ошибки создаем ConfigMap, в которой указываем переменную окружения HTTP_PORT со значение порта отличный от 80:

<img align="top" src="img/configmap1.jpg">		<!--![configmap1](img/configmap1.jpg)-->

2. Вывод запущенных подов после успешного выполнения Deployment:

<img align="top" src="img/after_deploy.jpg">		<!--![after_deploy](img/after_deploy.jpg)-->

3. Вывод успешного подключения к тестовой страницы в Nginx с помощью отдельного Пода с multitool:

<img align="top" src="img/test-page.jpg">		<!--![test-page](img/test-page.jpg)-->

### Задание 2

1. Вывод успешного создания Deployment, Secret, ConfigMap, Ingress:

<img align="top" src="img/deploy2.jpg">		<!--![deploy2](img/deploy2.jpg)-->

2. Вывод успешного подключения к сайту **https://https-example.foo.com** через Ingress:

<img align="top" src="img/check_tls.jpg">		<!--![check_tls](img/check_tls.jpg)-->
