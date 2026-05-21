---
title: CI/CD
---

# CI/CD

## Pipeline de GitHub Actions

Cada PR dispara el siguiente pipeline:

```yaml
name: CI

on: [push, pull_request]

jobs:
  test-agent:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dtolnay/rust-toolchain@stable
      - run: cargo test --manifest-path complyx-agent/Cargo.toml

  test-api:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with: { java-version: '21' }
      - run: ./mvnw verify
        working-directory: complyx-api

  test-ui:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci && ng test --watch=false
        working-directory: complyx-ui
```

## Despliegue continuo

El despliegue a producción se activa manualmente desde GitHub Actions tras la aprobación del PR en `main`.
