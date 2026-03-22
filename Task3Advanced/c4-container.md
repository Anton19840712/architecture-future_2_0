# C4 Container Diagram

Ниже показана целевая контейнерная архитектура "Будущего 2.0" на горизонте трёх лет.

```mermaid
flowchart LR
    subgraph Users["Пользователи и внешние участники"]
        BO["Бизнес-пользователи"]
        CL["Клиники и операторы"]
        PART["Партнёры: банк, фарма, производители"]
    end

    subgraph Channels["Каналы и приложения"]
        SSP["Self-Service BI Portal"]
        OPUI["Операторский UI"]
        API["API Gateway / BFF"]
    end

    subgraph DomainApps["Доменные сервисы"]
        PAT["Patient Flow Domain"]
        FIN["Fintech Domain"]
        INV["Inventory Domain"]
        HR["HR Domain"]
        CRM["Customer Domain"]
        AI["AI Diagnostics Domain"]
    end

    subgraph EventPlatform["Событийная платформа"]
        BUS["Kafka / Event Bus"]
        SCHEMA["Schema Registry"]
        DLQ["DLQ / Retry Topics"]
    end

    subgraph DataPlatform["Платформа данных"]
        INGEST["Streaming / Batch Ingestion"]
        LAKE["Data Lakehouse"]
        CATALOG["Data Catalog / DataHub"]
        MESH["Domain Data Products"]
        POLICY["RBAC / ABAC / DLP / Audit"]
    end

    subgraph Legacy["Мосты совместимости"]
        CAMEL["Apache Camel ESB"]
        DWH["Legacy SQL Server DWH"]
        PB["PowerBuilder"]
        PBI["Power BI"]
    end

    BO --> SSP
    CL --> OPUI
    PART --> API

    OPUI --> API
    API --> PAT
    API --> FIN
    API --> CRM

    PAT --> BUS
    FIN --> BUS
    INV --> BUS
    HR --> BUS
    CRM --> BUS
    AI --> BUS

    BUS --> SCHEMA
    BUS --> DLQ
    BUS --> INGEST
    INGEST --> LAKE
    LAKE --> MESH
    MESH --> SSP
    MESH --> CATALOG
    CATALOG --> SSP
    POLICY --> SSP
    POLICY --> CATALOG
    POLICY --> LAKE

    CAMEL --> BUS
    DWH --> INGEST
    PB --> CAMEL
    PBI --> DWH
    DWH -. phased out .-> LAKE
```

## Архитектурная идея

- Операционные домены публикуют события и перестают зависеть от DWH как от точки интеграции.
- Data Lakehouse становится аналитическим слоем, а не местом для накопления бизнес-логики.
- Data Mesh задаёт доменное владение данными и self-service модель потребления.
- Camel и старый DWH остаются только как временные мосты совместимости.
