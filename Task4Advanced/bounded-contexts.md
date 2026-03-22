# Bounded Contexts

```mermaid
flowchart LR
    subgraph Core["Core business domains"]
        CRM["Customer & Identity"]
        PAT["Patient Flow"]
        MED["Medical Records"]
        AI["AI Diagnostics"]
        FIN["Fintech"]
        BILL["Billing & Invoicing"]
        INV["Inventory & Equipment"]
        HR["HR & Workforce"]
        REP["Analytics & Reporting"]
    end

    CRM --> PAT
    CRM --> FIN
    PAT --> MED
    MED --> AI
    PAT --> BILL
    FIN --> BILL
    INV --> PAT
    HR --> PAT
    CRM --> REP
    PAT --> REP
    FIN --> REP
    BILL --> REP
    INV --> REP
```

## Контексты

- `Customer & Identity` — единая идентификация клиента и его базовый профиль
- `Patient Flow` — запись, посещение, маршрутизация пациента, статусы обслуживания
- `Medical Records` — медицинские карты, истории болезней, результаты исследований
- `AI Diagnostics` — inference, результаты ИИ и объяснимость модели
- `Fintech` — кредиты, финансовые продукты, банковские операции
- `Billing & Invoicing` — счета, начисления, взаиморасчёты
- `Inventory & Equipment` — оборудование, запасы, инвентаризация
- `HR & Workforce` — персонал, расписание, компетенции
- `Analytics & Reporting` — доменные data products и self-service BI

## Границы

- `Medical Records` изолирован от BI-витрины: напрямую в self-service не попадает.
- `Analytics & Reporting` не владеет мастер-данными, а потребляет их по контрактам из доменов.
- `Fintech` и `Medical Records` имеют усиленные требования к безопасности и комплаенсу.
