-- zrc.account_wf_business_checking definition

-- Drop table

-- DROP TABLE zrc.account_wf_business_checking;

CREATE TABLE zrc.account_wf_business_checking (
	transaction_date text NULL,
	transaction_amount text NULL,
	star_to_skip text NULL,
	check_number text NULL,
	transaction_description text NULL,
	row_no int4 NULL,
	date_inserted timestamp DEFAULT (now())::timestamp without time zone NULL
);
