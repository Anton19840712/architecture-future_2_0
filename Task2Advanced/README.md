# Task2Advanced

Автоматизация Terraform через CI/CD и удалённое хранение состояния.

## Что сделано

- Terraform вынесен в отдельную директорию `terraform/`
- backend настроен через partial configuration для S3-совместимого хранилища
- pipeline на `GitHub Actions` выполняет:
  - `terraform fmt -check`
  - `terraform init`
  - `terraform validate`
  - `terraform plan`
  - `terraform apply` через manual approval на `main`

## Почему partial backend

Значения backend нельзя безопасно хранить прямо в коде. Поэтому в `main.tf` задан только тип backend, а реальные параметры передаются через `backend.hcl`.

## Какие secrets нужны в GitHub

- `YC_TOKEN`
- `YC_CLOUD_ID`
- `YC_FOLDER_ID`
- `TF_VAR_SUBNET_ID`
- `TF_VAR_SSH_PUBLIC_KEY`
- `TF_BACKEND_BUCKET`
- `TF_BACKEND_REGION`
- `TF_BACKEND_KEY`
- `TF_BACKEND_ENDPOINT`
- `TF_BACKEND_ACCESS_KEY`
- `TF_BACKEND_SECRET_KEY`

## Как запускать локально

```bash
cd Task2Advanced/terraform
cp backend.hcl.example backend.hcl
cp terraform.tfvars.example terraform.tfvars
terraform init -backend-config=backend.hcl
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

## Замечания по безопасности

- state не хранится локально в репозитории
- секреты не коммитятся
- `apply` должен запускаться только после ревью и только на защищённой ветке
- для production рекомендуется разделить backend key по окружениям
