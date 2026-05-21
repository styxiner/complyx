---
title: Comprobaciones y remediaciones
tags: [Agent]
---

# Comprobaciones y remediaciones

## Comprobaciones (`policy_checks`)

Cada comprobación es una acción que el agente ejecuta para verificar si un control de seguridad está aplicado correctamente.

!!! info "Diseño de seguridad"
    Las comprobaciones **no son comandos de shell arbitrarios**. Son instrucciones estructuradas que el agente interpreta de forma controlada, garantizando aislamiento y mínimo privilegio.

### Tipos de comprobación

| Tipo | Descripción | Ejemplo |
|---|---|---|
| `file_content` | Verifica el contenido de un fichero de configuración | `PermitRootLogin no` en sshd_config |
| `file_permission` | Comprueba permisos y propietario de un fichero | `/etc/passwd` debe ser 644 root:root |
| `package_installed` | Verifica si un paquete está instalado | `auditd` presente en el sistema |
| `service_enabled` | Comprueba si un servicio está habilitado y activo | `firewalld` activo |
| `registry_value` | (Windows) Verifica valores del registro | `HKLM\...\NtlmMinClientSec` |

## Remediaciones (`policy_remediations`)

Si una comprobación falla, el agente puede aplicar una remediación automática.

### Garantías de las remediaciones

1. **Verificación de integridad previa**: Se comprueba el estado actual antes de modificar.
2. **Copia de seguridad obligatoria**: Se realiza backup de ficheros antes de sobreescribir.
3. **Validación post-remediación**: Se vuelve a ejecutar el check para confirmar el éxito.
4. **Rollback automático**: Si la remediación falla, se restaura el estado anterior.

### Escalada de privilegios

El agente solicita privilegios elevados únicamente para las operaciones que lo requieren, liberándolos inmediatamente después. El principio de mínimo privilegio se aplica en todo momento.
