-- dim.client definition

-- Drop table

-- DROP TABLE dim.client;

CREATE TABLE dim.client (
	date_inserted_client timestamp DEFAULT (now())::timestamp without time zone NULL,
	date_updated_client timestamp NULL,
	client_version int4 DEFAULT 1 NULL,
	client_valid_from timestamp DEFAULT '1900-01-01 00:00:00'::timestamp without time zone NULL,
	client_valid_to timestamp DEFAULT '2199-01-01 00:00:00'::timestamp without time zone NULL,
	client_id int4 DEFAULT 0 NULL,
	client_code text DEFAULT 'Unknown'::text NULL,
	client_name text DEFAULT 'Unknown'::text NULL,
	client_abbreviation text DEFAULT 'Unknown'::text NULL
);
