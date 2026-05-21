---
title: Endpoints — Riesgos
tags: [API]
---

# Endpoints — Riesgos

## Consultar matriz de riesgos

```http
GET /api/v1/risks
```

Parámetros de consulta:

| Parámetro | Tipo | Descripción |
|---|---|---|
| `level` | string | `low` \| `medium` \| `high` \| `critical` |
| `status` | string | `open` \| `accepted` \| `transferred` \| `closed` |
| `agent_id` | UUID | Filtrar por agente |

## Consultar riesgo por ID

```http
GET /api/v1/risks/{id}
```

## Actualizar estado de un riesgo

```http
PATCH /api/v1/risks/{id}
Content-Type: application/json

{
  "status": "accepted",
  "review_date": "2025-12-31T00:00:00Z"
}
```

Estados posibles: `open` → `accepted` | `transferred` | `closed`

## Configurar umbrales de riesgo

```http
PUT /api/v1/risks/thresholds
Content-Type: application/json

{
  "impact_threshold": 7.0,
  "probability_threshold": 6.0
}
```
