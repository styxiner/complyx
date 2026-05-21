---
title: Manejo de errores
tags: [API]
---

# Manejo de errores

Todos los errores devuelven un objeto JSON con la siguiente estructura:

```json
{
  "timestamp": "2025-05-21T10:30:00Z",
  "status": 404,
  "error": "Not Found",
  "message": "Agent with id 'abc123' not found",
  "path": "/api/v1/agents/abc123"
}
```

## Códigos de estado habituales

| Código | Descripción |
|---|---|
| `200 OK` | Operación exitosa |
| `201 Created` | Recurso creado |
| `400 Bad Request` | Datos de entrada inválidos |
| `401 Unauthorized` | Token ausente o inválido |
| `403 Forbidden` | Sin permisos para la operación |
| `404 Not Found` | Recurso no encontrado |
| `409 Conflict` | Conflicto (ej. username duplicado) |
| `422 Unprocessable Entity` | Validación fallida |
| `500 Internal Server Error` | Error interno del servidor |

!!! info "Trazabilidad"
    Cada petición genera un `request-id` en el header de respuesta (`X-Request-ID`) para correlación de logs.
