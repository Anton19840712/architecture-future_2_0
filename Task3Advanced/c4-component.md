# C4 Component Diagram

Компонентный уровень для будущего портала самообслуживания и платформы данных.

```mermaid
flowchart TB
    subgraph Portal["Self-Service BI Portal"]
        UI["BI UI / Report Builder"]
        AUTH["Access Control Adapter"]
        SEM["Semantic Layer"]
        QRY["Query Service"]
        CACHE["Result Cache"]
    end

    subgraph Governance["Governance"]
        CAT["Data Catalog"]
        GLOSS["Business Glossary"]
        LINEAGE["Lineage Service"]
        QUALITY["Data Quality Rules"]
        AUDIT["Audit Log"]
    end

    subgraph DataProducts["Domain Data Products"]
        DPFIN["Finance Data Product"]
        DPPAT["Patient Flow Data Product"]
        DPCRM["Customer Data Product"]
        DPHR["HR Data Product"]
    end

    subgraph Platform["Data Platform"]
        DREMIO["SQL / Query Engine"]
        NESSIE["Catalog / Versioning"]
        ICE["Apache Iceberg"]
        MINIO["Object Storage"]
        STREAM["Streaming Ingestion"]
    end

    UI --> AUTH
    UI --> SEM
    UI --> QRY
    QRY --> CACHE
    QRY --> DREMIO
    SEM --> CAT
    AUTH --> CAT
    CAT --> GLOSS
    CAT --> LINEAGE
    CAT --> QUALITY
    CAT --> AUDIT

    DREMIO --> NESSIE
    NESSIE --> ICE
    ICE --> MINIO
    STREAM --> ICE

    DPFIN --> DREMIO
    DPPAT --> DREMIO
    DPCRM --> DREMIO
    DPHR --> DREMIO
```

## Роль компонентов

- `BI UI / Report Builder` — интерфейс аналитика и бизнес-пользователя.
- `Semantic Layer` — бизнесовые определения, метрики и безопасные срезы.
- `Access Control Adapter` — применение RBAC/ABAC-политик.
- `Data Catalog` — поиск, описание, lineage и ownership.
- `Query Engine + Iceberg + Object Storage` — вычисления и хранение аналитических наборов.
