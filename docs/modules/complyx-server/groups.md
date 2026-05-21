---
title: Gestión de grupos
tags: [Server]
---

# Gestión de grupos

Los grupos permiten organizar agentes y distribuir políticas de forma colectiva.

## Modelo de datos

Un agente puede pertenecer a **múltiples grupos**. Las políticas se pueden asignar a:

1. Un **grupo** (todos los agentes del grupo la reciben).
2. Un **agente específico** (asignación directa).
3. Filtrado por **sistema operativo** (familia + versión).

## Herencia de políticas

Cuando un agente pertenece a varios grupos con políticas solapadas, se aplica la política de mayor severidad para cada control.

!!! note
    La asignación directa a un agente tiene precedencia sobre la asignación por grupo.
