---
title: Política de mínimo privilegio
tags: [Security, Agent]
---

# Política de mínimo privilegio

## En el agente

- El agente se ejecuta con el usuario `complyx-agent` (sin privilegios de root).
- Solo solicita privilegios elevados para operaciones específicas de remediación.
- No puede ejecutar comandos de shell arbitrarios.
- Todas las acciones están definidas en la política JSON firmada.
- Funciona de forma aislada, sin acceso a procesos ajenos a las políticas.

## En el servidor

- Separación de responsabilidades entre servicio y CA raíz.
- El usuario de base de datos tiene solo los permisos mínimos necesarios.

## En la API

- Tokens JWT con alcance y expiración limitados.
- Validación de todas las entradas contra inyección y enumeración de recursos.
- Los endpoints solo exponen lo necesario según el rol del token.
