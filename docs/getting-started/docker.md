---
title: Despliegue con Docker
tags: [Server, API]
---

# Despliegue con Docker

## docker-compose.yml

```yaml
version: '3.9'

services:
  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: complyx
      POSTGRES_USER: complyx
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "complyx"]
      interval: 10s

  complyx-server:
    build: ./complyx-server
    ports:
      - "9443:9443"
    volumes:
      - pki_data:/opt/complyx/pki
    depends_on:
      postgres:
        condition: service_healthy

  complyx-api:
    build: ./complyx-api
    ports:
      - "8080:8080"
    depends_on:
      postgres:
        condition: service_healthy
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/complyx
      JWT_SECRET: ${JWT_SECRET}

  complyx-ui:
    build: ./complyx-ui
    ports:
      - "80:80"
    depends_on:
      - complyx-api

volumes:
  postgres_data:
  pki_data:
```

## Arrancar

```bash
cp .env.example .env  # editar con tus valores
docker compose up -d
docker compose logs -f
```

!!! warning "Producción"
    Configura certificados TLS para la API y revisa la sección de [Seguridad](../security/index.md) antes de exponer el sistema.
