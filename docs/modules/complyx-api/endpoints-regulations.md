---
title: Endpoints — Normativas
tags: [API]
---

# Endpoints — Normativas

## Listar normativas

```http
GET /api/v1/regulations
```

## Subir normativa (PDF)

```http
POST /api/v1/regulations
Content-Type: multipart/form-data

name=ISO 27001:2022
file=@iso27001.pdf
```

## Descargar PDF de normativa

```http
GET /api/v1/regulations/{id}/pdf
```

## Consultar secciones de una normativa

```http
GET /api/v1/regulations/{id}/sections
```

## Asociar sección a un control de política

```http
POST /api/v1/regulations/{regulation_id}/sections/{section_id}/checks
Content-Type: application/json

{ "check_id": "uuid-del-check" }
```
