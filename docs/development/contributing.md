---
title: Contribuir al proyecto
---

# Contribuir al proyecto

## Flujo de trabajo

1. Crea una rama desde `main`: `git checkout -b feat/nombre-de-la-feature`
2. Realiza tus cambios siguiendo la [guía de estilo](code-style.md).
3. Escribe o actualiza los tests correspondientes.
4. Abre un Pull Request hacia `main` con descripción clara del cambio.
5. Espera revisión de al menos un miembro del equipo.

## Convenciones de commits

Seguimos **Conventional Commits**:

```
feat: añadir endpoint de exportación CSV
fix: corregir validación de firma de política
docs: actualizar README del agente
chore: actualizar dependencias de cargo
```

## Estructura de un PR

- **Título**: breve descripción del cambio.
- **Descripción**: contexto, motivación y cómo probarlo.
- **Tests**: indicar qué tests se añaden o modifican.
- **Breaking changes**: indicar si hay cambios incompatibles.
