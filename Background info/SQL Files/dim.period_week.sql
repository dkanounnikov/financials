-- dim.period_week definition

-- Drop table

-- DROP TABLE dim.period_week;

CREATE TABLE dim.period_week (
	date_inserted_period_week timestamp DEFAULT (now())::timestamp without time zone NULL,
	inserted_by_period_week text DEFAULT 'script'::text NULL,
	date_updated_period_week timestamp NULL,
	updated_by_period_week text NULL,
	week_dwid date NOT NULL,
	week_date_start date NULL,
	week_date_end date NULL,
	week_previous_dwid date NULL
);
