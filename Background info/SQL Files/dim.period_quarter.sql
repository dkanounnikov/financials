-- dim.period_quarter definition

-- Drop table

-- DROP TABLE dim.period_quarter;

CREATE TABLE dim.period_quarter (
	date_inserted_period_quarter timestamp DEFAULT (now())::timestamp without time zone NULL,
	inserted_by_period_quarter text DEFAULT 'script'::text NULL,
	date_updated_period_quarter timestamp NULL,
	updated_by_period_quarter text NULL,
	quarter_dwid date NOT NULL,
	quarter_yyyyqq text NULL,
	quarter_qq_yyyy text NULL,
	quarter_qq text NULL,
	quarter_qqqq_yyyy text NULL,
	quarter_yyyy_number text NULL,
	quarter_number_yyyy text NULL,
	quarter_number int4 NULL,
	quarter_date_start date NULL,
	quarter_date_end date NULL,
	quarter_previous_dwid date NULL,
	quarter_previous_year_dwid date NULL,
	year_dwid date NOT NULL,
	year_yyyy text NULL,
	year_date_start date NULL,
	year_date_end date NULL
);
