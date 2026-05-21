---
title: complyx-api
tags: [API]
---

# complyx-api

API REST construida con **Spring Boot (Java)** que expone todos los recursos de Complyx a la interfaz de usuario.

## Características

- Autenticación mediante **JWT** con expiración y alcance limitado.
- Control de acceso basado en roles: **Administrador**, **Técnico**, **Auditor**.
- Gestión completa de usuarios, agentes, políticas, normativas y riesgos.
- Generación de informes de cumplimiento en PDF/CSV.
- Documentación OpenAPI disponible en `/api/v1/docs`.

## Roles y permisos

| Rol | Capacidades |
|---|---|
| **Administrador** | Acceso total: CRUD de usuarios, agentes, políticas, normativas, riesgos |
| **Técnico** | Consulta de métricas, generación de informes, consulta de evidencias |
| **Auditor** | Solo lectura: informes, evidencias, exportación |

## Secciones

- [Autenticación y roles](auth.md)
- [Endpoints — Usuarios](endpoints-users.md)
- [Endpoints — Agentes](endpoints-agents.md)
- [Endpoints — Políticas](endpoints-policies.md)
- [Endpoints — Normativas](endpoints-regulations.md)
- [Endpoints — Riesgos](endpoints-risks.md)
- [Endpoints — Informes](endpoints-reports.md)
- [Manejo de errores](errors.md)
- [Configuración](configuration.md)
