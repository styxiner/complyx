---
title: Control de acceso por roles (RBAC)
tags: [Security, API]
---

# Control de acceso por roles (RBAC)

## Roles del sistema

| Rol | Código | Descripción |
|---|---|---|
| Administrador | `ADMIN` | Acceso total al sistema |
| Técnico | `TECHNICIAN` | Operaciones técnicas, sin gestión de usuarios |
| Auditor | `AUDITOR` | Solo lectura: informes y evidencias |

## Matriz de permisos

| Recurso | ADMIN | TECHNICIAN | AUDITOR |
|---|---|---|---|
| Gestión de usuarios | ✅ CRUD | ❌ | ❌ |
| Gestión de agentes | ✅ CRUD | 👁 Lectura | 👁 Lectura |
| Gestión de políticas | ✅ CRUD | 👁 Lectura | 👁 Lectura |
| Asignación de políticas | ✅ | ❌ | ❌ |
| Gestión de normativas | ✅ CRUD | 👁 Lectura | 👁 Lectura |
| Matriz de riesgos | ✅ CRUD | 👁 Lectura | 👁 Lectura |
| Informes | ✅ | ✅ Generar | ✅ Ver/Exportar |
| Evidencias de auditoría | ✅ | ✅ Ver | ✅ Exportar |
