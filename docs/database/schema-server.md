---
title: Esquema del servidor (PostgreSQL)
tags: [Database]
---

# Esquema del servidor — PostgreSQL

El fichero SQL completo se encuentra en `complyx-api/sql/01_create_tables.sql`.

## Tablas principales

### `users` y `roles`

Gestión de usuarios y sus roles en el sistema. La tabla `users_roles` implementa la relación N:M.

### `agents` y `agent_groups`

Registro de endpoints supervisados y su agrupación lógica. La tabla `agent_group_membership` gestiona la relación N:M agente-grupo.

### `policies`

Documentos de política de seguridad con sus metadatos (nombre, versión, severidad).

```sql
CREATE TABLE policies (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(250) NOT NULL UNIQUE,
    version     VARCHAR(10) NOT NULL,
    description TEXT,
    severity    VARCHAR(20) CHECK (severity IN ('critical','high','medium','low')),
    created_date   TIMESTAMP NOT NULL DEFAULT now(),
    last_modified  TIMESTAMP NOT NULL DEFAULT now()
);
```

### `policy_elements`, `policy_checks`, `policy_remediations`

Estructura jerárquica de una política: elemento → checks → remediaciones.

### `regulations` y `regulation_sections`

Normativas (ISO 27001, ENS, NIS2) con sus secciones. Los checks se mapean a secciones normativas mediante `check_regulation_sections`.

### `threats` y `risks`

Amenazas y su materialización sobre agentes concretos, con impacto, probabilidad y nivel de riesgo calculado.
