-- dim.period_month definition

-- Drop table

-- DROP TABLE dim.period_month;

CREATE TABLE dim.period_month (
	date_inserted_period_month timestamp DEFAULT (now())::timestamp without time zone NULL,
	inserted_by_period_month text DEFAULT 'Script'::text NULL,
	date_updated_period_month timestamp NULL,
	updated_by_period_month text NULL,
	month_dwid date NOT NULL,
	month_mmmm_yyyy text NULL,
	month_mmmm text NULL,
	month_number int4 NULL,
	month_mmm_yyyy text NULL,
	month_mmm text NULL,
	month_yyyy_mmmm text NULL,
	month_yyyy_mmm text NULL,
	month_date_start date NULL,
	month_date_end date NULL,
	month_previous_dwid date NULL,
	month_previous_quarter_dwid date NULL,
	month_previous_year_dwid date NULL,
	quarter_dwid date NOT NULL,
	quarter_yyyyqq text NULL,
	quarter_qq_yyyy text NULL,
	quarter_qq text NULL,
	quarter_qqqq_yyyy text NULL,
	quarter_number_yyyy text NULL,
	quarter_number int4 NULL,
	quarter_date_start date NULL,
	quarter_date_end date NULL,
	year_dwid date NOT NULL,
	year_yyyy text NULL,
	year_date_start date NULL,
	year_date_end date NULL
);
