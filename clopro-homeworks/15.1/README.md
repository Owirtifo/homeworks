## Домашнее задание к занятию "15.1. Организация сети"

### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

### Решение

Конфигурация Terraform располагается в папке [configs](./configs/).

1. Вывод успешного создания VPC:

<img align="top" src="img/vpc.jpg">		<!--![vpc](img/vpc.jpg)-->

2. Вывод успешного создания public сети и NAT-инстанса:

<img align="top" src="img/create_public.jpg">		<!--![create_public](img/create_public.jpg)-->

Проверка доступа в Интернет:

<img align="top" src="img/check_public.jpg">		<!--![check_public](img/check_public.jpg)-->

3. Вывод успешного создания private сети и ВМ в этой сети:

<img align="top" src="img/private_create.jpg">		<!--![private_create](img/private_create.jpg)-->

Проверка доступа в Интернет через NAT-инстанс из public сети:

<img align="top" src="img/list_vm.jpg">		<!--![list_vm](img/list_vm.jpg)-->

<img align="top" src="img/check_private.jpg">		<!--![check_private](img/check_private.jpg)-->



