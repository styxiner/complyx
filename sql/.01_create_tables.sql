CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS cytext;
CREATE DOMAIN email as citext
CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );

CREATE TABLE users(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	username varchar(50) NOT NULL UNIQUE,
	email email NOT NULL UNIQUE,
	salted_password_hash varchar NOT NULL,
	created_date DATETIME NOT NULL DEFAULT now(),
	last_modified DATETIME NOT NULL DEFAULT now(),

	CONSTRAINT id PRIMARY KEY (id)
);
CREATE TABLE roles(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	rolename VARCHAR(50) NOT NULL UNIQUE
	created_date DATETIME NOT NULL DEFAULT now(),
	last_modified DATETIME NOT NULL DEFAULT now(),
	
	CONSTRAINT id PRIMARY KEY (id)
);
-- Intermediate table for N:M users <-> roles
CREATE TABLE users_roles(
	user_id UUID,
	role_id UUID
	added_date DATETIME NOT NULL DEFAULT now(),

	CONSTRAINT id PRIMARY KEY (user_id, role_id)
);

CREATE TABLE agents(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	ip INET NOT NULL,
	hostname VARCHAR,
	os_name VARCHAR(50),
	os_version VARCHAR(10),
	install_date DATETIME NOT NULL DEFAULT now(),
	latest_connection DATETIME NOT NULL,

	CONSTRAINT id PRIMARY KEY (id)
);

CREATE TABLE regulations(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	name VARCHAR(250) NOT NULL,
	pdf_path VARCHAR(250) NOT NULL,
	added_date DATETIME NOT NULL DEFAULT now(),
	last_modification DATETIME NOT NULL DEFAULT NOW(),
	
	CONSTRAINT id PRIMARY KEY (id)	
);

CREATE TABLE regulation_sections(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	regulation_id UUID,
	title VARCHAR(),

	CONSTRAINT regulation_fk FOREIGN KEY regulation_id REFERENCES regulations(id) ON DELETE CASCADE,
	CONSTRAINT id PRIMARY KEY (id, regulation_id)
);
COMMENT ON TABLE regulation_sections IS 'It makes reference to the actual sections of the regulation/normative. An example could be the meassure 8.28 of the ISO 27001:2022 or the corresponding on NIS2';

CREATE TABLE policies(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	name VARCHAR(250) NOT NULL UNIQUE,
	version VARCHAR(10) NOT NULL,
	description TEXT,

	CONSTRAINT id PRIMARY KEY (id)
);

CREATE TABLE policy_elements(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	policy_id UUID,

	CONSTRAINT policy_fk FOREIGN KEY policy_id REFERENCES policies(id) ON DELETE CASCADE,
	CONSTRAINT id PRIMARY KEY (id, policy_id)
);

CREATE TABLE policy_checks(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	policy_element_id UUID NOT NULL,
	name VARCHAR(50) NOT NULL,
	rationale VARCHAR,
	check VARCHAR NOT NULL,
	
	CONSTRAINT policy_element_fk FOREIGN KEY policy_element_id REFERENCES policy_elements(id) ON DELETE CASCADE,
	CONSTRAINT id PRIMARY KEY (id, policy_element_id)
);
COMMENT ON TABLE policy_checks IS 'This is what the agent on the machine will recive to perform the check (for security reasons, it should not be a command to execute on the machine)';

CREATE TABLE policy_remediations(
	id UUID NOT NULL DEFAULT uuid_generate_v4(),
	policy_element_id UUID NOT NULL,
	name VARCHAR(50) NOT NULL,
	description VARCHAR,
	remediation VARCHAR NOT NULL,

	CONSTRAINT policy_remediation_fk FOREIGN KEY policy_element_id REFERENCES policy_elements
	CONSTRAINT id PRIMARY KEY (id, policy_element_id)
);
COMMENT ON COLUMN policy_remediations.description IS 'Description of what does the remediation';
COMMENT ON TABLE policy_remediations IS 'This will remediate what the policy_check detected';

CREATE TABLE risks();

CREATE TABLE threats();
COMMENT ON TABLE threats is 'It should be related to maybe regulation section that talks about penalties and fines';
