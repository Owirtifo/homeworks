## Домашнее задание к занятию "12.3 Запуск приложений в K8S"

Манифесты располагаются в папке [configs](./configs/).

### Задание 1

1. Ошибка после создания 2-х контейнеров — nginx и multitool:

<img align="top" src="img/before_deploy.jpg">		<!--![before_deploy](img/before_deploy.jpg)-->

Ошибка происходит в связи с тем, что контейнер multitool пытается использовать уже занятый на адресе 0.0.0.0 порт 80. Для исправления ошибки указываем контейнеру multitool пременную окружения HTTP_PORT со значение порта отличный от 80.

2. Вывод запущенных подов после успешного выполнения Deployment:

<img align="top" src="img/after_deploy.jpg">		<!--![after_deploy](img/after_deploy.jpg)-->

3. Вывод запущенных подов после увеличения реплик до 2-х:

<img align="top" src="img/after_scale.jpg">		<!--![after_scale](img/after_scale.jpg)-->

4. Вывод созданных сервисов:

<img align="top" src="img/services.jpg">		<!--![services](img/services.jpg)-->

5. Проверка доступа до подов с помощью отдельного пода multitool:

<img align="top" src="img/check_pods.jpg">		<!--![check_pods](img/check_pods.jpg)-->

 - Проверка доступности nginx:

<img align="top" src="img/check_nginx.jpg">		<!--![check_nginx](img/check_nginx.jpg)-->

 - Проверка доступности multitool:

<img align="top" src="img/check_multitool.jpg">		<!--![check_multitool](img/check_multitool.jpg)-->

### Задание 2

Состояние пода до и после запуска сервиса:

<img align="top" src="img/fail_pod.jpg">		<!--![fail_pod](img/fail_pod.jpg)-->
