---
title: complyx-agent
tags: [Agent]
---

# complyx-agent

Agente multiplataforma escrito en **Rust** que se despliega en cada endpoint gestionado.

## Responsabilidades

- Recibir y verificar la firma criptográfica de políticas JSON del servidor.
- Ejecutar comprobaciones de cumplimiento (`policy_checks`) de forma periódica.
- Aplicar remediaciones automáticas con rollback ante fallos.
- Mantener persistencia local en SQLite y cola de eventos offline.
- Comunicarse con el servidor mediante mTLS obligatorio.

## Estructura del repositorio

```
complyx-agent/
├── src/
│   ├── main.rs              # Punto de entrada
│   ├── agent/               # Lógica principal del agente
│   ├── policy/              # Motor de políticas JSON
│   ├── checks/              # Módulos de comprobación
│   ├── remediations/        # Módulos de remediación
│   ├── communication/       # Cliente mTLS
│   ├── storage/             # Persistencia SQLite
│   └── logging/             # Sistema de logging
├── Cargo.toml
└── config/
    └── agent.toml           # Configuración
```

## Secciones

- [Motor de políticas](policy-engine.md)
- [Comprobaciones y remediaciones](checks-remediations.md)
- [Persistencia local (SQLite)](local-storage.md)
- [Logging y auditoría](logging.md)
- [Configuración](configuration.md)
