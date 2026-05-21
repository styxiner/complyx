---
title: Endpoints — Informes
tags: [API]
---

# Endpoints — Informes

## Informe de cumplimiento resumido

```http
GET /api/v1/reports/compliance/summary
```

Devuelve métricas globales: porcentaje de cumplimiento, agentes activos, riesgos por nivel.

## Informe detallado por agente

```http
GET /api/v1/reports/compliance/agent/{agent_id}
Accept: application/pdf  // o application/json
```

## Informe por normativa

```http
GET /api/v1/reports/compliance/regulation/{regulation_id}
```

## Exportar evidencias de auditoría

```http
GET /api/v1/reports/audit/export
Accept: text/csv  // o application/pdf

?agent_id=uuid
&from=2025-01-01T00:00:00Z
&to=2025-12-31T23:59:59Z
```

El export incluye timestamps, identificadores de agentes y resultados de ejecución para auditorías externas.

!!! tip "Roles"
    El rol `AUDITOR` tiene acceso de solo lectura a todos los endpoints de informes y puede exportar evidencias.
