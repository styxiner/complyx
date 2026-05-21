---
title: Primeros pasos
---

# Primeros pasos

Esta sección te guía desde los requisitos previos hasta tener Complyx completamente operativo en tu entorno.

<div class="grid cards" markdown>

-   :material-clipboard-list:{ .lg .middle } **[Requisitos del sistema](requirements.md)**

    Comprueba hardware, SO y dependencias antes de instalar.

-   :material-download:{ .lg .middle } **[Instalación](installation.md)**

    Instrucciones paso a paso para cada componente.

-   :material-rocket-launch:{ .lg .middle } **[Configuración rápida](quickstart.md)**

    Levanta un entorno funcional en pocos minutos.

-   :material-docker:{ .lg .middle } **[Despliegue con Docker](docker.md)**

    Despliegue completo usando Docker Compose.

</div>

## Orden de despliegue recomendado

```mermaid
flowchart LR
    A["1. complyx-server<br/>+ PKI interna"] --> B["2. complyx-api<br/>+ PostgreSQL"]
    B --> C["3. complyx-ui"]
    A --> D["4. complyx-agent<br/>(en cada endpoint)"]
```

!!! tip "Entorno de desarrollo"
    Para desarrollo local, consulta la [guía de entorno de desarrollo](../development/dev-environment.md) con Docker Compose completo.
