---
title: Visión general de la arquitectura
---

# Visión general

## Diagrama de arquitectura

```mermaid
graph TB
    subgraph "Capa de presentación"
        UI["complyx-ui\n(Angular + Electron / PWA)"]
    end

    subgraph "Capa de servicio"
        API["complyx-api\n(Spring Boot / Java)"]
        SERVER["complyx-server\n(Rust)"]
        PKI["PKI Interna\n(CA raíz + emisión de certs)"]
    end

    subgraph "Capa de persistencia"
        DB[("PostgreSQL\ncomplyx-db")]
    end

    subgraph "Endpoints (n instancias)"
        AGENT["complyx-agent\n(Rust)"]
        SQLITE[("SQLite local")]
    end

    UI -->|"HTTPS + JWT"| API
    API -->|"JDBC"| DB
    SERVER -->|"JDBC"| DB
    SERVER <-->|"gestión PKI"| PKI
    AGENT -->|"mTLS (9443)"| SERVER
    AGENT --- SQLITE
```

## Principios de diseño

**Separación de responsabilidades**
: Cada componente tiene una única función bien definida. La UI no contiene lógica de negocio, el agente no ejecuta comandos arbitrarios y la API es la única fuente de verdad.

**Seguridad por defecto**
: Toda comunicación entre agente y servidor usa mTLS obligatorio. Los tokens JWT tienen expiración y alcance limitado.

**Resiliencia**
: El agente opera de forma autónoma ante desconexión del servidor, con persistencia local en SQLite y cola de eventos pendientes.

**Observabilidad**
: Logging estructurado con rotación automática en todos los componentes. Correlación de eventos entre agente y servidor.
