-- Consulta del resumen de los agentes
select 
	a.id, 
	a.hostname, 
	a.ip, 
	a.os_name, 
	a.os_version, 
	a.install_date, 
	a.latest_connection, 
	a.enabled
from agents a
;


-- Consulta detallada de las políticas asociadas a un agente por su id y por grupos
select distinct
	a.id, 
	a.hostname, 
	a.ip, 
	a.os_name, 
	a.os_version, 
	a.install_date, 
	a.latest_connection, 
	a.enabled,
	ag.name as "agent_group.name",
	p.id as "policy.id",
	p.name as "policy.name"
from agents a
join agent_policies ap on a.id = ap.agent_id
join agent_group_membership agm on agm.agent_id = a.id
join agent_groups ag on ag.id = agm.group_id
join group_policies gp on gp.group_id = ag.id
join policies p on p.id = gp.policy_id
where a.id = 'de4c4dfc-27ab-4940-a061-f37877ad133b'
;

-- select what normatives has to comply a determined agent
select * from regulations;

select * from policies;
