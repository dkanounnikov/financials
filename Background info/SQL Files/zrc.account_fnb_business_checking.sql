-- zrc.account_fnb_business_checking definition

-- Drop table

-- DROP TABLE zrc.account_fnb_business_checking;

CREATE TABLE zrc.account_fnb_business_checking (
	transaction_date text NULL,
	transaction_amount text NULL,
	transaction_balance text NULL,
	transaction_description text NULL,
	row_no int8 NULL,
	file_name text NULL,
	file_path text NULL,
	file_size text NULL,
	date_file_modified timestamp NULL,
	date_inserted timestamp DEFAULT (now())::timestamp without time zone NULL
);
