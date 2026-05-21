---
title: Componentes del sistema
---

# Componentes del sistema

## complyx-agent

Proceso ligero escrito en **Rust** que se ejecuta en cada endpoint. Responsable de:

- Descargar y verificar la firma criptográfica de las políticas JSON asignadas.
- Ejecutar comprobaciones de cumplimiento (`policy_checks`) de forma periódica.
- Aplicar remediaciones (`policy_remediations`) cuando se detectan incumplimientos.
- Enviar resultados al servidor mediante mTLS.
- Mantener una cola local de eventos en SQLite para operación offline.

## complyx-server

Servicio **Rust** responsable de la orquestación de agentes:

- Gestiona la PKI interna: CA raíz, emisión y revocación de certificados de cliente y servidor.
- Acepta conexiones mTLS de los agentes en el puerto 9443.
- Distribuye políticas a agentes según su grupo, SO o asignación directa.
- Consolida los resultados recibidos y los persiste en PostgreSQL.

## complyx-api

API REST construida con **Spring Boot / Java**:

- Expone todos los recursos del sistema (usuarios, agentes, políticas, normativas, riesgos).
- Gestiona autenticación JWT y control de acceso basado en roles (RBAC).
- Es consumida exclusivamente por la UI; desacoplada de la lógica del agente.

## complyx-ui

Aplicación web **Angular** empaquetada con **Electron**:

- Funciona como PWA o aplicación de escritorio multiplataforma.
- Renderizado dinámico de vistas según el rol autenticado (Administrador, Técnico, Auditor).
- No contiene lógica de negocio; toda operación va a través de la API REST.

## complyx-db

Base de datos **PostgreSQL** compartida por la API y el servidor:

- Almacena usuarios, roles, agentes, grupos, políticas, normativas, riesgos y eventos.
- Esquema definido en `01_create_tables.sql`.
