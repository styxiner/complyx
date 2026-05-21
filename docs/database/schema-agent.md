---
title: Esquema del agente (SQLite)
tags: [Database, Agent]
---

# Esquema del agente — SQLite

El agente mantiene una base de datos SQLite local en `/opt/complyx-agent/data/agent.db`.

## Propósito

- Almacenar el último resultado de cada política ejecutada.
- Mantener una cola de eventos pendientes de enviar al servidor cuando no hay conectividad.
- Guardar el estado de remediaciones en curso para permitir rollback.

## Tablas

```sql
-- Estado por ejecución de cada check
CREATE TABLE policy_results (
    id          TEXT PRIMARY KEY,
    policy_id   TEXT NOT NULL,
    check_id    TEXT NOT NULL,
    status      TEXT NOT NULL,  -- 'ok' | 'failed' | 'remediated' | 'error'
    executed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    details     TEXT
);

-- Cola de eventos pendientes de sincronizar
CREATE TABLE pending_events (
    id          TEXT PRIMARY KEY,
    event_type  TEXT NOT NULL,
    payload     TEXT NOT NULL,
    created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    attempts    INTEGER NOT NULL DEFAULT 0
);

-- Resumen del último ciclo de ejecución
CREATE TABLE last_policy_execution (
    policy_id      TEXT PRIMARY KEY,
    executed_at    DATETIME NOT NULL,
    overall_status TEXT NOT NULL,
    compliance_pct REAL
);
```
