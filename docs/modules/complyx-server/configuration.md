---
title: Configuración del servidor
tags: [Server]
---

# Configuración del servidor

```toml
[server]
host = "0.0.0.0"
port = 9443

[database]
url      = "postgresql://complyx:password@localhost:5432/complyx"
max_pool = 10

[pki]
ca_path   = "/opt/complyx/pki/ca"
cert_path = "/opt/complyx/pki/certs"
key_size  = 4096
cert_validity_days = 365

[logging]
level  = "info"
format = "json"
```

| Variable de entorno | Descripción |
|---|---|
| `COMPLYX_DB_URL` | URL de conexión a PostgreSQL |
| `COMPLYX_SERVER_PORT` | Puerto de escucha |
| `COMPLYX_PKI_PATH` | Ruta al directorio PKI |
| `COMPLYX_LOG_LEVEL` | Nivel de log |
