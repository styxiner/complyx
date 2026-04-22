-- ======================================================
-- Script de inserción de datos de prueba para Complyx
-- Basado en el esquema mejorado y centrado en NIS2
-- ======================================================

-- 1. Usuarios
INSERT INTO users (id, username, email, salted_password_hash) VALUES
    (gen_random_uuid(), 'admin', 'admin@complyx.local', 'hash_admin_salt123'),
    (gen_random_uuid(), 'auditor1', 'auditor@complyx.local', 'hash_auditor_salt456'),
    (gen_random_uuid(), 'tecnico1', 'tecnico@complyx.local', 'hash_tecnico_salt789');

-- 2. Roles
INSERT INTO roles (id, rolename) VALUES
    (gen_random_uuid(), 'admin'),
    (gen_random_uuid(), 'auditor'),
    (gen_random_uuid(), 'tecnico');

-- Asignar roles a usuarios
-- Suponemos que los UUID generados se obtienen con subconsultas, pero para claridad usamos UUIDs literales si se conocen.
-- Para simplificar, usaremos una sintaxis con subconsultas que es válida.
INSERT INTO users_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE (u.username = 'admin' AND r.rolename = 'admin')
   OR (u.username = 'auditor1' AND r.rolename = 'auditor')
   OR (u.username = 'tecnico1' AND r.rolename = 'tecnico');

-- 3. Grupos de agentes
INSERT INTO agent_groups (id, name, description) VALUES
    (gen_random_uuid(), 'Servidores Web', 'Grupo de servidores web críticos'),
    (gen_random_uuid(), 'Estaciones de trabajo', 'Equipos de usuario final'),
    (gen_random_uuid(), 'Bases de datos', 'Servidores de bases de datos internos');

-- 4. Agentes
INSERT INTO agents (id, ip, hostname, os_name, os_version, install_date, latest_connection, enabled) VALUES
    (gen_random_uuid(), '192.168.1.10', 'web01', 'Ubuntu', '22.04', now() - interval '30 days', now() - interval '1 hour', true),
    (gen_random_uuid(), '192.168.1.11', 'web02', 'Debian', '12', now() - interval '30 days', now() - interval '2 hours', true),
    (gen_random_uuid(), '192.168.1.20', 'db01', 'Windows Server', '2022', now() - interval '60 days', now() - interval '30 minutes', true),
    (gen_random_uuid(), '192.168.1.30', 'workstation01', 'Windows 11', '23H2', now() - interval '90 days', now() - interval '1 day', false),
    (gen_random_uuid(), '192.168.1.31', 'workstation02', 'Ubuntu', '24.04', now() - interval '45 days', now() - interval '3 hours', true);

-- 5. Asignar agentes a grupos
INSERT INTO agent_group_membership (agent_id, group_id)
SELECT a.id, g.id
FROM agents a, agent_groups g
WHERE (a.hostname IN ('web01','web02') AND g.name = 'Servidores Web')
   OR (a.hostname = 'db01' AND g.name = 'Bases de datos')
   OR (a.hostname IN ('workstation01','workstation02') AND g.name = 'Estaciones de trabajo');

-- 6. Normativa NIS2
INSERT INTO regulations (id, name, pdf_path, added_date, last_modification) VALUES
    (gen_random_uuid(), 'Directiva NIS2 (UE) 2022/2555', '/pdfs/nis2_2022_2555.pdf', now(), now()),
    (gen_random_uuid(), 'ISO/IEC 27001:2022', '/pdfs/iso_iec-27001:2022.pdf', now(), now());

-- Obtener el ID de NIS2 para usarlo después
WITH nis2 AS (SELECT id FROM regulations WHERE name LIKE 'Directiva NIS2%')
-- 7. Secciones de NIS2 (ejemplos)
INSERT INTO regulation_sections (id, regulation_id, title)
SELECT gen_random_uuid(), nis2.id, 'Artículo 21: Medidas de gestión de riesgos'
FROM nis2
UNION ALL
SELECT gen_random_uuid(), nis2.id, 'Artículo 23: Notificación de incidentes'
FROM nis2
UNION ALL
SELECT gen_random_uuid(), nis2.id, 'Artículo 20: Gobernanza y responsabilidad'
FROM nis2
UNION ALL
SELECT gen_random_uuid(), nis2.id, 'Artículo 24: Seguridad de la cadena de suministro'
FROM nis2;

-- 8. Políticas de la empresa
INSERT INTO policies (id, name, version, description, severity) VALUES
    (gen_random_uuid(), 'Política de Gestión de Riesgos', '1.0', 'Define el proceso de identificación, evaluación y tratamiento de riesgos de seguridad de la información.', 'high'),
    (gen_random_uuid(), 'Política de Respuesta a Incidentes', '2.1', 'Procedimientos para la detección, respuesta y recuperación ante incidentes de seguridad.', 'critical'),
    (gen_random_uuid(), 'Política de Continuidad de Negocio', '1.2', 'Asegura la disponibilidad de servicios críticos ante disrupciones.', 'high'),
    (gen_random_uuid(), 'Política de Seguridad en la Cadena de Suministro', '1.0', 'Requisitos de seguridad para proveedores y servicios externos.', 'medium');

-- 9. Elementos de políticas (subdivisiones dentro de cada política)
-- Política de Gestión de Riesgos -> Elementos: Identificación, Evaluación
-- Política de Respuesta a Incidentes -> Elementos: Detección, Contención, Recuperación
-- Política de Continuidad de Negocio -> Elementos: Plan de Continuidad, Pruebas
-- Política de Cadena de Suministro -> Elementos: Evaluación de proveedores

-- Usaremos subconsultas para obtener los IDs de las políticas
INSERT INTO policy_elements (id, policy_id, name)
SELECT gen_random_uuid(), p.id, 'Identificación de riesgos'
FROM policies p WHERE p.name = 'Política de Gestión de Riesgos'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Evaluación y tratamiento de riesgos'
FROM policies p WHERE p.name = 'Política de Gestión de Riesgos'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Detección de incidentes'
FROM policies p WHERE p.name = 'Política de Respuesta a Incidentes'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Contención y erradicación'
FROM policies p WHERE p.name = 'Política de Respuesta a Incidentes'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Recuperación y lecciones aprendidas'
FROM policies p WHERE p.name = 'Política de Respuesta a Incidentes'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Plan de continuidad operativa'
FROM policies p WHERE p.name = 'Política de Continuidad de Negocio'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Pruebas de continuidad'
FROM policies p WHERE p.name = 'Política de Continuidad de Negocio'
UNION ALL
SELECT gen_random_uuid(), p.id, 'Evaluación de seguridad de proveedores'
FROM policies p WHERE p.name = 'Política de Seguridad en la Cadena de Suministro';

-- 10. Chequeos (acciones que el agente ejecuta)
-- Asociamos cada chequeo a un elemento de política (policy_element_id)
-- Guardamos los IDs de los elementos en variables (usaremos WITH para simplicidad)
WITH elementos AS (
    SELECT id, name, policy_id FROM policy_elements
)
INSERT INTO policy_checks (id, policy_element_id, name, rationale, check_command)
SELECT gen_random_uuid(), e.id, 'Comprobar inventario de activos', 'Verificar que todos los activos críticos están inventariados', 'inventory_check --type=all'
FROM elementos e WHERE e.name = 'Identificación de riesgos'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Evaluar probabilidad de impacto', 'Determinar la probabilidad de materialización de amenazas', 'risk_assessment --method=qualitative'
FROM elementos e WHERE e.name = 'Evaluación y tratamiento de riesgos'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Monitorizar logs de seguridad', 'Detección temprana de eventos anómalos', 'log_monitor --sources=syslog,auditd'
FROM elementos e WHERE e.name = 'Detección de incidentes'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Aislar host comprometido', 'Contener la amenaza en equipos infectados', 'isolate_host --method=network'
FROM elementos e WHERE e.name = 'Contención y erradicación'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Restaurar desde backup', 'Recuperar sistemas tras incidente', 'restore_backup --latest'
FROM elementos e WHERE e.name = 'Recuperación y lecciones aprendidas'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Verificar disponibilidad de servicios críticos', 'Comprobar que los servicios esenciales están operativos', 'service_check --critical=true'
FROM elementos e WHERE e.name = 'Plan de continuidad operativa'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Ejecutar prueba de conmutación', 'Simular fallo y comprobar recuperación', 'failover_test --scenario=datacenter'
FROM elementos e WHERE e.name = 'Pruebas de continuidad'
UNION ALL
SELECT gen_random_uuid(), e.id, 'Revisar SLA de proveedores', 'Asegurar que los proveedores cumplen con los requisitos de seguridad', 'sla_check --provider=all'
FROM elementos e WHERE e.name = 'Evaluación de seguridad de proveedores';

-- 11. Asociar chequeos con secciones de NIS2 (relación N:M)
-- Ejemplo: los chequeos relacionados con gestión de riesgos se asocian al Artículo 21
-- Obtener IDs de secciones y de chequeos
WITH nis2_sections AS (
    SELECT rs.id, rs.title FROM regulation_sections rs
    JOIN regulations r ON rs.regulation_id = r.id
    WHERE r.name LIKE 'Directiva NIS2%'
),
checks AS (
    SELECT id, name FROM policy_checks
)
INSERT INTO check_regulation_sections (check_id, regulation_section_id)
SELECT c.id, s.id
FROM checks c, nis2_sections s
WHERE (c.name LIKE 'Comprobar inventario%' AND s.title LIKE '%gestión de riesgos%')
   OR (c.name LIKE 'Evaluar probabilidad%' AND s.title LIKE '%gestión de riesgos%')
   OR (c.name LIKE 'Monitorizar logs%' AND s.title LIKE '%notificación de incidentes%')
   OR (c.name LIKE 'Aislar host%' AND s.title LIKE '%notificación de incidentes%')
   OR (c.name LIKE 'Restaurar desde%' AND s.title LIKE '%continuidad%')
   OR (c.name LIKE 'Verificar disponibilidad%' AND s.title LIKE '%continuidad%')
   OR (c.name LIKE 'Ejecutar prueba%' AND s.title LIKE '%continuidad%')
   OR (c.name LIKE 'Revisar SLA%' AND s.title LIKE '%cadena de suministro%');

-- 12. Remediciones asociadas a los chequeos
WITH checks AS (
    SELECT id, name FROM policy_checks
)
INSERT INTO policy_remediations (id, policy_check_id, name, description, remediation_command)
SELECT gen_random_uuid(), c.id, 'Ejecutar inventario automático', 'Actualizar el inventario de activos mediante escaneo de red', 'network_scan --update-inventory'
FROM checks c WHERE c.name = 'Comprobar inventario de activos'
UNION ALL
SELECT gen_random_uuid(), c.id, 'Aplicar parche de seguridad', 'Remediar vulnerabilidad detectada en el riesgo', 'patch_apply --id=KB123456'
FROM checks c WHERE c.name = 'Evaluar probabilidad de impacto'
UNION ALL
SELECT gen_random_uuid(), c.id, 'Bloquear IP maliciosa', 'Añadir regla de firewall para bloquear origen de ataque', 'firewall block --ip=10.0.0.5'
FROM checks c WHERE c.name = 'Aislar host comprometido'
UNION ALL
SELECT gen_random_uuid(), c.id, 'Reconfigurar servicios', 'Ajustar configuraciones para garantizar disponibilidad', 'service reconfigure --service=httpd'
FROM checks c WHERE c.name = 'Verificar disponibilidad de servicios críticos'
UNION ALL
SELECT gen_random_uuid(), c.id, 'Notificar a proveedor incumplimiento', 'Contactar al proveedor para subsanar desviaciones de SLA', 'send_alert --channel=email --template=sla_breach'
FROM checks c WHERE c.name = 'Revisar acuerdos de nivel de servicio (SLA) con proveedores';

-- 13. Asignar políticas a agentes (directa)
INSERT INTO agent_policies (agent_id, policy_id)
SELECT a.id, p.id
FROM agents a, policies p
WHERE a.hostname = 'web01' AND p.name IN ('Política de Gestión de Riesgos', 'Política de Respuesta a Incidentes')
UNION ALL
SELECT a.id, p.id
FROM agents a, policies p
WHERE a.hostname = 'db01' AND p.name IN ('Política de Continuidad de Negocio', 'Política de Gestión de Riesgos')
UNION ALL
SELECT a.id, p.id
FROM agents a, policies p
WHERE a.hostname = 'workstation02' AND p.name = 'Política de Respuesta a Incidentes';

-- 14. Asignar políticas a grupos (para distribución por grupo)
INSERT INTO group_policies (group_id, policy_id)
SELECT g.id, p.id
FROM agent_groups g, policies p
WHERE g.name = 'Servidores Web' AND p.name = 'Política de Gestión de Riesgos'
UNION ALL
SELECT g.id, p.id
FROM agent_groups g, policies p
WHERE g.name = 'Servidores Web' AND p.name = 'Política de Respuesta a Incidentes'
UNION ALL
SELECT g.id, p.id
FROM agent_groups g, policies p
WHERE g.name = 'Bases de datos' AND p.name = 'Política de Continuidad de Negocio'
UNION ALL
SELECT g.id, p.id
FROM agent_groups g, policies p
WHERE g.name = 'Estaciones de trabajo' AND p.name = 'Política de Respuesta a Incidentes';

-- 15. Amenazas
INSERT INTO threats (id, name, description, category, severity_score) VALUES
    (gen_random_uuid(), 'Ransomware', 'Malware que cifra datos y exige rescate', 'Malware', 9.5),
    (gen_random_uuid(), 'Fuga de datos', 'Exposición no autorizada de información sensible', 'Privacidad', 8.0),
    (gen_random_uuid(), 'Denegación de servicio (DDoS)', 'Saturación de recursos que impide el servicio', 'Disponibilidad', 7.5),
    (gen_random_uuid(), 'Compromiso de proveedor', 'Incidente de seguridad en la cadena de suministro', 'Terceros', 7.0);

-- 16. Riesgos (asociados a agentes y amenazas)
-- Calcular impacto y probabilidad según contexto
INSERT INTO risks (id, threat_id, agent_id, impact, probability, risk_level, status, created_date, review_date, acceptance_date)
SELECT gen_random_uuid(), t.id, a.id,
       7.5, 6.0, 'high', 'open', now(), now() + interval '3 months', NULL
FROM threats t, agents a
WHERE t.name = 'Ransomware' AND a.hostname = 'db01'
UNION ALL
SELECT gen_random_uuid(), t.id, a.id,
       8.0, 4.5, 'high', 'accepted', now(), now() + interval '6 months', now()
FROM threats t, agents a
WHERE t.name = 'Fuga de datos' AND a.hostname = 'web01'
UNION ALL
SELECT gen_random_uuid(), t.id, a.id,
       6.0, 7.0, 'medium', 'open', now(), now() + interval '2 months', NULL
FROM threats t, agents a
WHERE t.name = 'Denegación de servicio (DDoS)' AND a.hostname = 'web02'
UNION ALL
SELECT gen_random_uuid(), t.id, a.id,
       7.0, 5.0, 'medium', 'open', now(), now() + interval '1 month', NULL
FROM threats t, agents a
WHERE t.name = 'Compromiso de proveedor' AND a.hostname = 'workstation02';

-- 17. Relacionar riesgos con políticas mitigadoras
WITH riesgo AS (
    SELECT r.id, t.name as threat_name, a.hostname
    FROM risks r
    JOIN threats t ON r.threat_id = t.id
    JOIN agents a ON r.agent_id = a.id
)
INSERT INTO risk_policies (risk_id, policy_id)
SELECT r.id, p.id
FROM riesgo r, policies p
WHERE (r.threat_name = 'Ransomware' AND p.name = 'Política de Continuidad de Negocio')
   OR (r.threat_name = 'Fuga de datos' AND p.name = 'Política de Gestión de Riesgos')
   OR (r.threat_name = 'Denegación de servicio (DDoS)' AND p.name = 'Política de Respuesta a Incidentes')
   OR (r.threat_name = 'Compromiso de proveedor' AND p.name = 'Política de Seguridad en la Cadena de Suministro');

-- 18. (Opcional) Insertar logs de ejecución para pruebas, aunque no se ha definido tabla. Si se añade, aquí se podrían insertar eventos.
