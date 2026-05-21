---
title: complyx-server
tags: [Server]
---

# complyx-server

Servidor de orquestación escrito en **Rust**. Gestiona la comunicación con los agentes, la PKI interna y la distribución de políticas.

## Responsabilidades

- Gestión de la PKI interna (CA raíz, emisión de certificados).
- Aceptar conexiones mTLS de los agentes en el puerto 9443.
- Distribuir políticas a agentes según grupo, SO o asignación directa.
- Consolidar resultados y persistirlos en PostgreSQL.
- Gestionar el ciclo de vida de los agentes (activación, desactivación).

## Secciones

- [Orquestación de agentes](orchestration.md)
- [PKI interna](pki.md)
- [Gestión de grupos](groups.md)
- [Distribución de políticas](policy-distribution.md)
- [Configuración](configuration.md)
