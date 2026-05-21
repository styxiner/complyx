---
title: Endpoints — Agentes
tags: [API]
---

# Endpoints — Agentes

## Listar agentes

```http
GET /api/v1/agents
Authorization: Bearer <token>
```

Parámetros de consulta:

| Parámetro | Tipo | Descripción |
|---|---|---|
| `group` | UUID | Filtrar por grupo |
| `status` | string | `active` \| `inactive` \| `disabled` |
| `os` | string | Filtrar por nombre de SO |
| `page` | int | Página (paginación obligatoria) |
| `size` | int | Tamaño de página (máx. 100) |

## Consultar agente

```http
GET /api/v1/agents/{id}
```

Devuelve: detalles técnicos, políticas asignadas, riesgos asociados, historial de ejecuciones.

## Activar / desactivar agente

```http
PATCH /api/v1/agents/{id}
Content-Type: application/json

{ "enabled": false }
```

## Desinstalar agente

```http
DELETE /api/v1/agents/{id}
```

**Roles permitidos:** `ADMIN`

## Modificar grupos de un agente

```http
PUT /api/v1/agents/{id}/groups
Content-Type: application/json

{ "group_ids": ["uuid1", "uuid2"] }
```
