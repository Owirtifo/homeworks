## Домашнее задание к занятию "5.1. Основы виртуализации"

1. В виртуализации уровня операционной системы в отличие от Паравиртуализации отсутствует гипервизор, в этом варианте виртуализируются серверы, запускаемые в операционной системе.
2. 
- Высоконагруженная база данных, чувствительная к отказу: физические сервера, т.к. создается единая точка отказа, что в нашем случае является одним из основных условий, нежели мы бы использовали виртуализация уровня ОС или паравиртуализация. Плюс высокая производительность за счет прямого использования аппаратных ресурсов самого сервера.
- Различные Java-приложения: виртуализация уровня ОС, т.к. будет прирост в производительности, за счет прямого обращения к ядру системы. Но лучше будет использовать паравиртуализацию.
- Windows системы для использования Бухгалтерским отделом: паравиртуализация, т.к. больших ресурсов не требуется плюс низкая стоимость. Правильный ответ - виртуализация уровня ОС.
- Системы, выполняющие высокопроизводительные расчеты на GPU: паравиртуализация, т.к. будет обеспечивается большая производительность, за счет проброса GPU в ВМ, по сравнению с виртуализацией уровня ОС, где будет оверхед на использования контейнера. На отдельный сервер будет обеспечена самая лучшая производительность, за счет прямого использования аппаратных ресурсов, но стоит вопрос цены. Правильно будет использовать физические сервера или виртуализация уровня ОС.
3. На VMware vSphere или Hyper-V разворачиваем Linux, а уже на ней используем виртуализацию уровня ОС.