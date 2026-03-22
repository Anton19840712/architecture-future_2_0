# Event Storming

```mermaid
flowchart LR
    A["Клиент зарегистрирован"] --> B["Пациент записан на приём"]
    B --> C["Визит начат"]
    C --> D["Исследование назначено"]
    D --> E["Исследование выполнено"]
    E --> F["Результат ИИ рассчитан"]
    F --> G["Диагноз подтверждён врачом"]
    G --> H["Счёт выставлен"]
    H --> I["Платёж проведён"]
    I --> J["Кредитный договор создан"]
    J --> K["Платёж по кредиту проведён"]
    E --> L["Событие отправлено в аналитический контур"]
    I --> L
    J --> L
    K --> L
```

## Источники и подписчики

| Событие | Источник | Подписчики |
|---|---|---|
| Клиент зарегистрирован | Customer & Identity | Patient Flow, Fintech, Analytics |
| Пациент записан на приём | Patient Flow | Billing, Inventory, Analytics |
| Исследование выполнено | Medical Records | AI Diagnostics, Analytics |
| Результат ИИ рассчитан | AI Diagnostics | Medical Records, Analytics |
| Счёт выставлен | Billing & Invoicing | Fintech, Analytics |
| Платёж проведён | Fintech / Billing | Analytics, CRM |
| Кредитный договор создан | Fintech | Analytics, CRM |
