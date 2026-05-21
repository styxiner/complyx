---
title: Testing
---

# Testing

## Estrategia de tests

| Tipo | Herramienta | Cobertura objetivo |
|---|---|---|
| Unitarios (Rust) | `cargo test` | Lógica del motor de políticas |
| Unitarios (Java) | JUnit 5 + Mockito | Servicios y controladores API |
| Integración (Java) | Spring Boot Test + Testcontainers | Endpoints con BD real |
| E2E (Angular) | Cypress | Flujos críticos de usuario |

## Ejecutar todos los tests

```bash
# Rust
cargo test --workspace

# Java
./mvnw verify

# Angular
ng test --watch=false --code-coverage
```

## Tests de integración

Los tests de integración de la API usan **Testcontainers** para levantar una instancia real de PostgreSQL en Docker, garantizando que las migraciones y consultas funcionen correctamente.
