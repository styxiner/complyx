---
title: Autenticación y roles
tags: [API, Security]
---

# Autenticación y roles

## Obtener un token JWT

```http
POST /api/v1/auth/login
Content-Type: application/json

{
  "username": "admin",
  "password": "ChangeMe123!"
}
```

**Respuesta:**

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expires_in": 3600,
  "role": "ADMIN"
}
```

## Usar el token

Todas las peticiones autenticadas deben incluir el header:

```http
Authorization: Bearer <token>
```

## Renovar el token

```http
POST /api/v1/auth/refresh
Authorization: Bearer <token-actual>
```

## Cerrar sesión

```http
POST /api/v1/auth/logout
Authorization: Bearer <token>
```

El token queda invalidado inmediatamente en el servidor.

!!! warning "Tokens expirados"
    La UI redirige automáticamente al login cuando detecta un token inválido o expirado. No se almacena información sensible en el navegador.
