---
title: Entorno de desarrollo
---

# Entorno de desarrollo

## Prerrequisitos

- Docker Desktop o Docker Engine + Docker Compose v2
- Rust 1.78+ (`rustup`)
- Java 21+ + Maven 3.9+
- Node.js 20+ + npm
- VSCode o IntelliJ IDEA (recomendados)

## Levantar el stack de desarrollo

```bash
git clone https://github.com/styxiner/complyx
cd complyx
docker compose -f docker-compose.dev.yml up -d
```

Esto levanta: PostgreSQL + complyx-server + complyx-api en modo desarrollo con hot-reload.

## Ejecutar tests

=== "Rust"

    ```bash
    cargo test
    ```

=== "Java"

    ```bash
    ./mvnw test
    ```

=== "Angular"

    ```bash
    ng test --watch=false
    ```
