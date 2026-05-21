---
title: Logging y auditoría
tags: [Agent]
---

# Logging y auditoría

## Configuración de logs

El agente usa logging estructurado con los siguientes niveles estándar:

| Nivel | Uso |
|---|---|
| `ERROR` | Fallos críticos que impiden la operación |
| `WARN` | Situaciones anómalas que no bloquean |
| `INFO` | Eventos operacionales normales |
| `DEBUG` | Información detallada para diagnóstico |

## Rotación de logs

Los logs rotan diariamente y se mantienen durante **7 días** antes de ser eliminados automáticamente.

```toml
[logging]
level = "info"
file = "/opt/complyx-agent/logs/agent.log"
rotation = "daily"
max_files = 7
format = "json"  # json | text
```

## Eventos auditables

Los siguientes eventos siempre se registran en nivel `INFO` o superior:

- Inicio y parada del agente.
- Recepción y verificación de políticas.
- Resultado de cada comprobación (OK / FAILED).
- Ejecución de remediaciones y su resultado.
- Fallos de verificación de firma (nivel `WARN`).
- Errores de conectividad con el servidor.
