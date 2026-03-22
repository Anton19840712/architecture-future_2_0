# Task1Advanced

Переиспользуемый Terraform-модуль `vm` для развёртывания виртуальной машины в разных окружениях.

## Структура

- `modules/vm` — сам модуль
- `envs/dev` — окружение разработки
- `envs/stage` — стенд для проверки
- `envs/prod` — production-конфигурация

## Что делает модуль

Модуль создаёт:

- загрузочный диск из образа Ubuntu 22.04 LTS
- виртуальную машину Yandex Cloud
- сетевой интерфейс в указанной подсети
- NAT для внешнего доступа
- метаданные с SSH-ключом

## Входные параметры модуля

- `vm_name` — имя виртуальной машины
- `zone` — зона размещения
- `platform_id` — платформа ВМ
- `cores` — количество vCPU
- `memory` — объём RAM в ГБ
- `core_fraction` — гарантированная доля CPU
- `disk_name` — имя загрузочного диска
- `disk_type` — тип диска
- `disk_size` — размер диска в ГБ
- `subnet_id` — идентификатор подсети
- `nat` — нужен ли внешний IP
- `ssh_user` — имя пользователя для SSH
- `ssh_public_key` — публичный SSH-ключ
- `labels` — набор label-меток

## Выходы

- `instance_id`
- `instance_name`
- `internal_ip_address`
- `external_ip_address`
- `boot_disk_id`

## Как запускать

Пример для `dev`:

```bash
cd Task1Advanced/envs/dev
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

Для `stage` и `prod` команды такие же, только меняется директория окружения и имя файла:

- `stage.tfvars`
- `prod.tfvars`

## Замечания

- Значения окружений не захардкожены в модуле: все параметры передаются через переменные.
- В `prod` по умолчанию используется больший объём ресурсов.
- Перед реальным запуском нужно подставить актуальные значения `cloud_id`, `folder_id`, `subnet_id` и SSH-ключа.
