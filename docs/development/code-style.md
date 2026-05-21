---
title: Guía de estilo
---

# Guía de estilo

## Rust (complyx-agent, complyx-server)

- Seguir las convenciones de `rustfmt` (ejecutar antes de hacer commit).
- Usar `clippy` para detectar problemas comunes: `cargo clippy -- -D warnings`.
- Documentar funciones públicas con doc-comments `///`.

## Java (complyx-api)

- Seguir Google Java Style Guide.
- Usar `checkstyle` integrado en Maven.
- Documentar con Javadoc los métodos públicos de controladores y servicios.

## TypeScript / Angular (complyx-ui)

- Seguir Angular Style Guide oficial.
- Usar ESLint + Prettier (configurados en el repo).
- Componentes con responsabilidad única; sin lógica de negocio en la UI.

## SQL

- Nombres de tablas y columnas en `snake_case`.
- Claves primarias de tipo UUID.
- Comentarios en tablas no evidentes (`COMMENT ON TABLE`).
