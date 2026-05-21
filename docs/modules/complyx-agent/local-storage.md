---
title: Persistencia local (SQLite)
tags: [Agent, Database]
---

# Persistencia local (SQLite)

El agente mantiene una base de datos SQLite local para operar de forma autónoma ante desconexión del servidor.

## Esquema SQLite del agente

```sql
-- Estado actual de cada política asignada
CREATE TABLE policy_results (
    id          TEXT PRIMARY KEY,
    policy_id   TEXT NOT NULL,
    check_id    TEXT NOT NULL,
    status      TEXT NOT NULL,  -- 'ok' | 'failed' | 'remediated' | 'error'
    executed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    details     TEXT
);

-- Cola de eventos pendientes de enviar al servidor
CREATE TABLE pending_events (
    id          TEXT PRIMARY KEY,
    event_type  TEXT NOT NULL,
    payload     TEXT NOT NULL,  -- JSON serializado
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    attempts    INTEGER NOT NULL DEFAULT 0
);

-- Último resultado de cada política (caché)
CREATE TABLE last_policy_execution (
    policy_id       TEXT PRIMARY KEY,
    executed_at     DATETIME NOT NULL,
    overall_status  TEXT NOT NULL,
    compliance_pct  REAL
);
```

## Cola de eventos offline

Cuando el agente no puede conectarse al servidor, los eventos se encolan localmente y se envían en cuanto la conectividad se restaura. Los eventos se marcan con timestamp y número de intentos para garantizar la trazabilidad.
