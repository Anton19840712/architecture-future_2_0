# Каталог доменных событий

| Событие | Контекст-источник | Семантика | Минимальный контракт |
|---|---|---|---|
| `CustomerRegistered` | Customer & Identity | Создан новый клиент | `event_id`, `occurred_at`, `customer_id`, `registration_channel` |
| `AppointmentBooked` | Patient Flow | Пациент записан на приём | `event_id`, `appointment_id`, `customer_id`, `clinic_id`, `scheduled_at` |
| `VisitStarted` | Patient Flow | Началось обслуживание по визиту | `event_id`, `visit_id`, `appointment_id`, `started_at` |
| `StudyOrdered` | Medical Records | Назначено исследование | `event_id`, `study_id`, `case_id`, `study_type` |
| `StudyCompleted` | Medical Records | Исследование выполнено | `event_id`, `study_id`, `completed_at`, `source_system` |
| `InferenceCompleted` | AI Diagnostics | ИИ выдал результат | `event_id`, `inference_id`, `study_id`, `model_version`, `result_ref` |
| `InvoiceIssued` | Billing & Invoicing | Счёт сформирован | `event_id`, `invoice_id`, `customer_id`, `amount`, `currency` |
| `PaymentCompleted` | Fintech / Billing | Платёж завершён | `event_id`, `payment_id`, `invoice_id`, `amount`, `status` |
| `LoanAgreementCreated` | Fintech | Создан кредитный договор | `event_id`, `loan_id`, `customer_id`, `principal`, `term_months` |
| `InventoryReserved` | Inventory & Equipment | Зарезервирован ресурс/оборудование | `event_id`, `inventory_item_id`, `reservation_id`, `quantity` |

## Правила

- Все события должны быть идемпотентными.
- Контракты версионируются через schema registry.
- Для критичных событий допускаются retries и DLQ.
- Чувствительные медицинские данные не публикуются в общем виде в междоменные события.
