---
title: Configuración de la API
tags: [API]
---

# Configuración de la API

La API se configura mediante `application.yml` de Spring Boot o variables de entorno.

```yaml
server:
  port: 8080

spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/complyx
    username: complyx
    password: ${DB_PASSWORD}
  jpa:
    hibernate:
      ddl-auto: validate

jwt:
  secret: ${JWT_SECRET}
  expiration: 3600  # segundos

logging:
  level:
    com.complyx: INFO
```

## Variables de entorno

| Variable | Descripción |
|---|---|
| `DB_PASSWORD` | Contraseña de PostgreSQL |
| `JWT_SECRET` | Clave secreta para firmar tokens JWT |
| `SERVER_PORT` | Puerto de la API (por defecto 8080) |
| `LOG_LEVEL` | Nivel de log |
