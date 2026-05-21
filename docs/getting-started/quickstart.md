---
title: Configuración rápida
---

# Configuración rápida

## 1. Iniciar servicios

```bash
cd complyx-server && cargo run -- --config config/dev.toml &
cd complyx-api && ./mvnw spring-boot:run -Dspring.profiles.active=dev &
```

## 2. Crear el primer administrador

```bash
curl -X POST http://localhost:8080/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","email":"admin@example.com","password":"ChangeMe123!","role":"ADMIN"}'
```

## 3. Obtener token JWT

```bash
TOKEN=$(curl -s -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"ChangeMe123!"}' | jq -r '.token')
```

## 4. Cargar la primera política

```bash
curl -X POST http://localhost:8080/api/v1/policies \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d @examples/policy-ssh-hardening.json
```

!!! success "¡Listo!"
    Accede a `http://localhost:4200` para ver el dashboard con el agente y la política aplicada.
