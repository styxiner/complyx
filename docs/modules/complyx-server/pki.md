---
title: PKI interna
tags: [Server, Security]
---

# PKI interna

El servidor gestiona una **infraestructura de clave pública (PKI) interna** para la autenticación mutua de agentes.

## Componentes de la PKI

```
PKI Interna
├── CA Raíz (autofirmada, almacenada de forma segura)
├── Certificado del servidor (firmado por CA raíz)
└── Certificados de clientes (uno por agente, firmado por CA raíz)
```

## Operaciones de la PKI

| Operación | Descripción |
|---|---|
| `generate_ca` | Genera la CA raíz en el primer arranque |
| `issue_server_cert` | Emite el certificado del servidor |
| `issue_agent_cert` | Emite un certificado de cliente al registrar un agente |
| `revoke_cert` | Revoca el certificado de un agente deshabilitado |

## Almacenamiento seguro

Los materiales criptográficos se almacenan en un directorio con permisos restrictivos (`700`) propiedad del usuario que ejecuta el servidor.
