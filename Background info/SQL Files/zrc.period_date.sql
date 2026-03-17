-- zrc.period_date definition

-- Drop table

-- DROP TABLE zrc.period_date;

CREATE TABLE zrc.period_date (
	date_inserted_period_date timestamp DEFAULT (now())::timestamp without time zone NULL,
	inserted_by_period_date text DEFAULT 'script'::text NULL,
	day_dwid date NULL,
	day_of_week_number text NULL,
	day_of_month_number text NULL,
	day_of_month_dd text NULL,
	day_of_week_name text NULL,
	day_dd_mmm text NULL,
	day_dd_mmm_yyyy text NULL,
	month_mmmm text NULL,
	month_mmm text NULL,
	day_of_year_number text NULL,
	week_of_year_number text NULL,
	week_of_year_number_iso text NULL,
	quarter_number text NULL,
	year_dwid date NULL,
	month_number text NULL,
	year_number text NULL,
	year_yyyy text NULL,
	year_date_start date NULL
);
