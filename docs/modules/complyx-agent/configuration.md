---
title: Configuración del agente
tags: [Agent]
---

# Configuración del agente

El agente se configura mediante un fichero TOML en `/opt/complyx-agent/config/agent.toml`.

```toml
[server]
host = "complyx-server.example.com"
port = 9443

[tls]
ca_cert     = "/opt/complyx-agent/certs/ca.pem"
client_cert = "/opt/complyx-agent/certs/agent.pem"
client_key  = "/opt/complyx-agent/certs/agent.key"

[agent]
id              = ""          # Se asigna automáticamente en el primer registro
check_interval  = 3600        # Segundos entre ejecuciones de políticas
retry_interval  = 60          # Segundos entre reintentos de conexión
max_retries     = 5

[storage]
db_path = "/opt/complyx-agent/data/agent.db"

[logging]
level    = "info"
file     = "/opt/complyx-agent/logs/agent.log"
rotation = "daily"
max_files = 7
```

## Variables de entorno

Las variables de entorno tienen precedencia sobre el fichero de configuración:

| Variable | Descripción |
|---|---|
| `COMPLYX_SERVER_HOST` | Host del servidor |
| `COMPLYX_SERVER_PORT` | Puerto del servidor |
| `COMPLYX_LOG_LEVEL` | Nivel de log |
| `COMPLYX_AGENT_ID` | ID del agente (para contenedores) |
