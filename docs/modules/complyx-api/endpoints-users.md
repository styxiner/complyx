---
title: Endpoints — Usuarios
tags: [API]
---

# Endpoints — Usuarios

## Listar usuarios

```http
GET /api/v1/users
Authorization: Bearer <token>
```

**Roles permitidos:** `ADMIN`

## Crear usuario

```http
POST /api/v1/users
Authorization: Bearer <token>
Content-Type: application/json

{
  "username": "jdoe",
  "email": "jdoe@example.com",
  "password": "SecurePass123!",
  "role": "TECHNICIAN"
}
```

## Consultar usuario propio

```http
GET /api/v1/users/me
Authorization: Bearer <token>
```

**Roles permitidos:** `ADMIN`, `TECHNICIAN`, `AUDITOR`

## Actualizar usuario

```http
PUT /api/v1/users/{id}
Authorization: Bearer <token>
```

## Eliminar usuario

```http
DELETE /api/v1/users/{id}
Authorization: Bearer <token>
```

**Roles permitidos:** `ADMIN`
