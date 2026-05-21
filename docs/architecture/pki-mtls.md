---
title: Comunicación y PKI
tags: [Security, Server, Agent]
---

# Comunicación y PKI interna

## Modelo de confianza

Complyx implementa **mTLS obligatorio** entre el agente y el servidor. Esto garantiza que:

1. El agente verifica la identidad del servidor (evita conexiones a servidores falsos).
2. El servidor verifica la identidad del agente (solo agentes registrados pueden conectarse).

```mermaid
sequenceDiagram
    participant A as complyx-agent
    participant S as complyx-server
    participant PKI as PKI Interna (CA)

    Note over PKI: CA raíz autofirmada<br/>gestionada por complyx-server

    PKI->>S: Emite cert. de servidor
    PKI->>A: Emite cert. de cliente (al registrar agente)

    A->>S: ClientHello + cert. cliente
    S->>A: ServerHello + cert. servidor
    A->>S: Verifica cert. servidor (CA raíz)
    S->>A: Verifica cert. cliente (CA raíz)
    Note over A,S: Canal mTLS establecido
    A->>S: Envío de eventos cifrados
    S->>A: Distribución de políticas
```

## Ciclo de vida de certificados

| Etapa | Descripción |
|---|---|
| Bootstrap del servidor | Se genera la CA raíz y el certificado de servidor |
| Registro de agente | El servidor emite un certificado de cliente firmado por la CA |
| Revocación | El servidor puede revocar certificados de agentes deshabilitados |
| Rotación | Los certificados se renuevan automáticamente antes de su expiración |
