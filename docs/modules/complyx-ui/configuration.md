---
title: Configuración de la UI
tags: [UI]
---

# Configuración de la UI

La UI se configura mediante variables de entorno en tiempo de build de Angular:

```typescript
// environments/environment.prod.ts
export const environment = {
  production: true,
  apiUrl: 'https://complyx-api.example.com/api/v1',
  tokenRefreshInterval: 300,  // segundos
  pageSize: 25,
};
```

## Variables de entorno Docker

| Variable | Descripción |
|---|---|
| `API_URL` | URL base de la API REST |
| `TOKEN_REFRESH_INTERVAL` | Intervalo de renovación de token (seg.) |
