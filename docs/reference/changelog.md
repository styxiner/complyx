---
title: Changelog
---

# Changelog

Todos los cambios notables de Complyx se documentan en este fichero, siguiendo [Keep a Changelog](https://keepachangelog.com/es/).

## [Unreleased]

### En desarrollo
- Motor de políticas v2 con soporte para checks de registro de Windows.
- Integración opcional con webhooks externos (Jira, Teams/Slack).
- Análisis de políticas con IA para mapeo automático a secciones normativas.

## [0.2.0] — 2025-05

### Añadido
- Módulo de riesgos: amenazas, cálculo de nivel y ciclo de vida.
- Exportación de evidencias de auditoría en PDF y CSV.
- Matriz de riesgos interactiva en la UI.
- Soporte para distribución de políticas por SO y versión.

## [0.1.0] — 2025-03

### Añadido
- Arquitectura base: agente Rust, servidor Rust, API Spring Boot, UI Angular.
- PKI interna con mTLS obligatorio agente–servidor.
- Motor de políticas JSON con verificación de firma.
- Sistema de comprobaciones y remediaciones con rollback.
- Dashboard básico de cumplimiento.
- Soporte para ISO 27001, ENS y NIS2.
