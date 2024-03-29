## Домашнее задание к занятию "11.1 Введение в микросервисы"

**Преимущество микросирвисной архитектуры:**  

- легкое внедрение новых стеков и технологий (Базы данных) и языков программирования;
- легко наращивать мощности за счет легкой масштабируемости;
- повышение отказоустойчивости;
- быстрое тестирование отдельных сервисов;
- быстрое исправление багов;
- отсутствие простоя сервиса при обновлении;
- возможность производить частые обновления;
- балансировка нагрузки высоконагруженных сервисов;
- скорость восстановления после сбоя;
- разделение на команды по компетенциям и зонам ответственности.

**Какие проблемы необходимо решить:** 

- Необходимо проработать вопрос разделения текущего сервиса на микросервисы, потребуется переписывать код;
- Выбрать технологии, которые лучше всего подойдут для решения бизнес-задач;
- Создать команды по зонам ответственности;
- Возможно потребуется расширить штат;
- Повышение квалификации сотрудников или найм компетентных специалистов;
- Повышение сложности мониторинга и сбора логов;
- Определение инструментов резервного копирования и восстановления;
- Проработать вопрос стандартизации API;
- Сложность ведения документации при частых релизах;
- Реализация автоматизации сборки и тестирования.