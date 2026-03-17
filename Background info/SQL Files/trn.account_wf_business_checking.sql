-- trn.account_wf_business_checking definition

-- Drop table

-- DROP TABLE trn.account_wf_business_checking;

CREATE TABLE trn.account_wf_business_checking (
	date_transaction timestamp NULL,
	transaction_description text NULL,
	check_number int4 NULL,
	transaction_amount numeric(14, 2) NULL,
	amount_drawn numeric(14, 2) NULL,
	amount_deposited numeric(14, 2) NULL,
	row_no int4 NULL,
	date_inserted timestamp DEFAULT now()::timestamp without time zone NULL
);