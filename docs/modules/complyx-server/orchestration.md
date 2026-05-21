---
title: Orquestación de agentes
tags: [Server]
---

# Orquestación de agentes

El servidor mantiene una conexión persistente mTLS con cada agente registrado.

## Registro de un nuevo agente

```mermaid
sequenceDiagram
    participant A as complyx-agent
    participant S as complyx-server
    participant PKI as PKI Interna

    A->>S: Solicitud de registro (hostname, OS, IP)
    S->>PKI: Generar cert. de cliente para el agente
    PKI->>S: Certificado firmado
    S->>A: Certificado de cliente + CA raíz
    A->>A: Guardar certificados en disco
    A->>S: Conexión mTLS con nuevo certificado
    Note over S: Agente marcado como activo en DB
```

## Estados de un agente

| Estado | Descripción |
|---|---|
| `active` | Agente conectado y operativo |
| `inactive` | Agente sin conexión reciente (> `timeout` configurado) |
| `disabled` | Deshabilitado manualmente por un administrador |

## Gestión de la conexión

El servidor detecta agentes desconectados mediante heartbeats periódicos. Si un agente no responde en el tiempo configurado, se marca como `inactive` y se genera un evento de alerta.
