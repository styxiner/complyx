---
title: Base de datos
---

# Base de datos

Complyx usa **dos bases de datos con finalidades distintas**:

| Base de datos | Tecnología | Componente | Función |
|---|---|---|---|
| `complyx-db` | PostgreSQL 15 | complyx-server + complyx-api | Persistencia central |
| `agent.db` | SQLite | complyx-agent | Operación local y offline |

La relación entre ambas se describe a nivel de sincronización de eventos, sin integridad referencial directa.

- [Modelo entidad-relación](erd.md)
- [Esquema del servidor (PostgreSQL)](schema-server.md)
- [Esquema del agente (SQLite)](schema-agent.md)
- [Migraciones](migrations.md)
