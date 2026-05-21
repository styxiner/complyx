---
title: Autenticación mTLS
tags: [Security, Server, Agent]
---

# Autenticación mTLS

Ver la descripción completa en [Arquitectura — Comunicación y PKI](../architecture/pki-mtls.md).

## Resumen

- Toda comunicación agente ↔ servidor usa **TLS 1.3 mínimo**.
- Ambas partes presentan certificados firmados por la CA raíz interna.
- Los certificados revocados son rechazados inmediatamente.

## Configuración TLS en el agente

```toml
[tls]
ca_cert     = "/opt/complyx-agent/certs/ca.pem"
client_cert = "/opt/complyx-agent/certs/agent.pem"
client_key  = "/opt/complyx-agent/certs/agent.key"
min_version = "1.3"
```
