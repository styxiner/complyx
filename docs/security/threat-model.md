---
title: Modelo de amenazas
tags: [Security]
---

# Modelo de amenazas

## Actores de amenaza considerados

| Actor | Descripción |
|---|---|
| Atacante externo | Sin acceso a la red interna |
| Atacante con acceso a red | Puede interceptar tráfico |
| Administrador comprometido | Credenciales filtradas |
| Agente comprometido | Un endpoint ha sido vulnerado |

## Vectores de ataque y mitigaciones

| Vector | Mitigación |
|---|---|
| Suplantación del servidor | mTLS: el agente verifica el cert. del servidor |
| Suplantación del agente | mTLS: el servidor verifica el cert. del cliente |
| Inyección de políticas maliciosas | Verificación de firma criptográfica en el agente |
| Acceso no autorizado a la API | JWT + RBAC + tokens con expiración |
| Exposición de datos sensibles | Sin almacenamiento de datos sensibles en texto plano |
| Escalada de privilegios en el agente | Mínimo privilegio: el agente no ejecuta comandos arbitrarios |
