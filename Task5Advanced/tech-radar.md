# Расширенный технический радар

## Adopt

| Элемент | Категория | Почему |
|---|---|---|
| GitHub Actions | Platform / Delivery | Достаточно для CI/CD проекта и хорошо интегрируется с репозиторием |
| Terraform | Infrastructure | Стандартный IaC-инструмент для воспроизводимого окружения |
| Object Storage S3-compatible | Data Platform | Базовый слой для Lakehouse и state backend |
| Apache Iceberg | Data Platform | Формат таблиц для Lakehouse с ACID и versioning |
| Data Catalog | Governance | Нужен для Data Mesh и self-service доступа к данным |
| Self-Service BI | Pattern | Прямая бизнес-цель проекта |
| Event-Driven Architecture | Pattern | Целевая долгосрочная архитектура компании |

## Trial

| Элемент | Категория | Почему |
|---|---|---|
| Data Mesh | Pattern | Подходит по структуре компании, но требует пилота и change management |
| Nessie | Data Platform | Удобен для versioned catalog, но требует пилотной проверки в контуре компании |
| Dremio | Query / Access | Хорош для self-service и Lakehouse, но требует проверки по нагрузке и лицензированию |
| Kafka + Schema Registry | Integration | Подходит для целевой событийной платформы, но нужен пилот на 1-2 доменах |
| OpenMetadata / DataHub | Governance | Требуют выбора по эксплуатационным и интеграционным критериям |

## Assess

| Элемент | Категория | Почему |
|---|---|---|
| Feature Store для AI | AI Platform | Может понадобиться по мере монетизации ИИ-сервисов |
| CDC-платформа (Debezium) | Integration | Полезна для мягкого вывода legacy и перехода к streaming |
| Policy as Code | Security / Governance | Перспективно для масштабирования доступа и compliance |
| Stream Processing (Flink / Spark Structured Streaming) | Data Platform | Нужно оценить под real-time витрины |

## Hold

| Элемент | Категория | Почему |
|---|---|---|
| SQL Server 2008 как центральный DWH | Legacy Platform | Устаревшая платформа, дорогая в сопровождении и тормозит развитие |
| PowerBuilder | Legacy App | Повышает риск vendor lock-in и дефицита специалистов |
| DWH как интеграционный центр | Anti-pattern | Усиливает связанность и замедляет time-to-market |
| Точечные синхронные интеграции на критическом пути | Integration Anti-pattern | Плохо масштабируются и хуже поддерживают рост компании |

## Ключевой вывод

Радар показывает сдвиг компании:

- от легаси DWH и ручной интеграции
- к событийной платформе, Lakehouse и управляемому self-service доступу к данным
