---
title: Distribución de políticas
tags: [Server, Agent]
---

# Distribución de políticas

## Flujo de distribución

```mermaid
flowchart TD
    A[Política cargada en la API] --> B[Servidor firma la política]
    B --> C{¿Asignación?}
    C -->|Grupo| D[Enviar a todos los agentes del grupo]
    C -->|Agente directo| E[Enviar al agente específico]
    C -->|Filtro SO| F[Enviar a agentes con OS coincidente]
    D & E & F --> G[Agente verifica firma]
    G --> H[Agente ejecuta política]
```

## Firma de políticas

Las políticas se firman con la clave privada del servidor antes de distribuirse. El agente verifica la firma usando la clave pública del servidor (incluida en su certificado). Esto garantiza la integridad y autenticidad de toda política ejecutada.
