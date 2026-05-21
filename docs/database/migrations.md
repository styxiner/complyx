---
title: Migraciones
tags: [Database]
---

# Migraciones de base de datos

## Herramienta

Las migraciones del servidor se gestionan con **Flyway**, integrado en `complyx-api` (Spring Boot).

## Nomenclatura

```
sql/
├── V1__create_tables.sql
├── V2__add_agent_enabled_column.sql
└── V3__add_risk_policies_table.sql
```

Formato: `V{versión}__{descripción}.sql`

## Aplicar migraciones

Las migraciones se aplican automáticamente al arrancar la API con `ddl-auto: validate`. En producción se recomienda ejecutarlas explícitamente:

```bash
./mvnw flyway:migrate -Dflyway.url=jdbc:postgresql://... -Dflyway.user=complyx
```

!!! warning
    Nunca modifiques un fichero de migración ya aplicado. Crea siempre una nueva versión.
