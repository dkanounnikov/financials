-- dim.period_year definition

-- Drop table

-- DROP TABLE dim.period_year;

CREATE TABLE dim.period_year (
	date_inserted_period_year timestamp DEFAULT (now())::timestamp without time zone NULL,
	inserted_by_period_year text DEFAULT 'script'::text NULL,
	date_updated_period_year timestamp NULL,
	updated_by_period_year text NULL,
	year_dwid date NOT NULL,
	year_yyyy text NULL,
	year_date_start date NULL,
	year_date_end date NULL,
	year_previous_dwid date NULL
);
