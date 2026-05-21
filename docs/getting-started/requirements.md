---
title: Requisitos del sistema
tags: [Server, Agent]
---

# Requisitos del sistema

## Servidor (complyx-server + complyx-api)

| Componente | Mínimo | Recomendado |
|---|---|---|
| CPU | 2 vCPUs | 4 vCPUs |
| RAM | 2 GB | 4 GB |
| Disco | 20 GB | 50 GB |
| SO | Alpine Linux (Docker) | Alpine Linux (Docker) |

### Dependencias de software

- Docker Engine 24+ y Docker Compose v2
- PostgreSQL 15+
- Java 21+ (para `complyx-api`)
- Rust 1.78+ (para compilar desde fuente)

## Endpoints (complyx-agent)

| SO | Versiones soportadas |
|---|---|
| Debian/Ubuntu | Debian 11+, Ubuntu 20.04+ |
| Red Hat / RHEL | RHEL 8+, Rocky Linux 8+ |
| Windows | Windows 10 / Server 2019+ |

!!! warning "Principio de mínimo privilegio"
    El agente no ejecuta comandos arbitrarios. Todas las acciones están definidas en políticas JSON firmadas.

## Puertos de red

| Servicio | Puerto | Protocolo |
|---|---|---|
| complyx-api | 8080 | HTTPS |
| complyx-server (agentes) | 9443 | mTLS / TCP |
| PostgreSQL | 5432 | TCP (interno) |
| complyx-ui (dev) | 4200 | HTTP |
