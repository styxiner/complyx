---
title: Instalación
tags: [Server, API, Agent, UI]
---

# Instalación

## 1. Clonar los repositorios

```bash
git clone https://github.com/styxiner/complyx-server
git clone https://github.com/styxiner/complyx-api
git clone https://github.com/styxiner/complyx-ui
git clone https://github.com/styxiner/complyx-agent  # en cada endpoint
```

## 2. Inicializar la base de datos

```bash
psql -U postgres -f complyx-api/sql/00_create_db.sql
psql -U postgres -d complyx -f complyx-api/sql/01_create_tables.sql
```

## 3. Compilar complyx-server

```bash
cd complyx-server
cargo build --release
```

## 4. Arrancar complyx-api

```bash
cd complyx-api
./mvnw spring-boot:run
```

## 5. Compilar el agente

=== "Linux"

    ```bash
    cd complyx-agent
    cargo build --release --target x86_64-unknown-linux-gnu
    sudo cp target/release/complyx-agent /opt/complyx-agent/
    sudo systemctl enable --now complyx-agent
    ```

=== "Windows"

    ```powershell
    cargo build --release --target x86_64-pc-windows-gnu
    Copy-Item .\target\release\complyx-agent.exe C:\complyx-agent\
    New-Service -Name "ComplyxAgent" -BinaryPathName "C:\complyx-agent\complyx-agent.exe"
    Start-Service ComplyxAgent
    ```

!!! info "Certificados mTLS"
    El agente necesita un certificado de cliente emitido por la PKI interna antes de conectarse. Ver [Autenticación mTLS](../security/mtls.md).
