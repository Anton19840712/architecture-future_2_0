# architecture-future_2_0

Репозиторий с проектной работой 11 спринта по кейсу компании "Будущее 2.0".

## Структура

- `Task1Advanced` — переиспользуемый Terraform-модуль VM и окружения `dev/stage/prod`
- `Task2Advanced` — backend S3/MinIO и CI/CD для Terraform
- `Task3Advanced` — целевая архитектура, карта рисков и план управления рисками
- `Task4Advanced` — bounded contexts, Event Storming, агрегаты и каталог событий
- `Task5Advanced` — tech radar, TCO-анализ и стратегический roadmap

## Ключевые допущения

- Для инфраструктурной части в качестве провайдера выбран `Yandex Cloud`, так как он используется в учебных материалах спринта.
- Для CI/CD выбран `GitHub Actions`. При необходимости пайплайн можно адаптировать под GitLab CI без изменения Terraform-кода.
- Медицинские карты, истории болезней и результаты исследований не включаются в self-service BI-витрину. Для аналитики используются только обезличенные и разрешённые наборы данных.
- Целевая аналитическая архитектура строится вокруг `Data Lakehouse + Data Mesh + Event-Driven Architecture`.

## Что ещё нужно перед реальным запуском

- Заполнить реальные значения `cloud_id`, `folder_id`, `subnet_id`, `service account`/ключей и SSH-публичного ключа.
- Создать S3-совместимое хранилище для Terraform backend и заполнить `backend.hcl`.
- Добавить GitHub Secrets для CI/CD.
- При желании выполнить `terraform init/plan/apply` в выбранном окружении.
