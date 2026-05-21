---
title: Endpoints — Políticas
tags: [API]
---

# Endpoints — Políticas

## Listar políticas

```http
GET /api/v1/policies
```

## Crear política

```http
POST /api/v1/policies
Content-Type: application/json

{
  "name": "SSH Hardening",
  "version": "1.0",
  "description": "Política de endurecimiento SSH",
  "severity": "high"
}
```

## Subir fichero JSON de política

```http
PUT /api/v1/policies/{id}/json
Content-Type: application/json

<contenido del fichero de política>
```

La API valida el JSON y el servidor lo firma antes de distribuirlo.

## Consultar política

```http
GET /api/v1/policies/{id}
```

Devuelve: metadatos, controles, normativas asociadas y riesgos mitigados.

## Eliminar política

```http
DELETE /api/v1/policies/{id}
```

!!! warning
    Eliminar una política no la desasigna automáticamente de los agentes. Desasigna primero antes de eliminar.

## Asignar política a agente/grupo

```http
POST /api/v1/policies/{id}/assign
Content-Type: application/json

{
  "target_type": "group",  // "agent" | "group"
  "target_id": "uuid-del-grupo"
}
```
