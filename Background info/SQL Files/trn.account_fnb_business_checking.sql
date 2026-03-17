-- trn.account_fnb_business_checking definition

-- Drop table

-- DROP TABLE trn.account_fnb_business_checking;

CREATE TABLE trn.account_fnb_business_checking (
	date_transaction date NULL,
	transaction_amount numeric(18, 2) NULL,
	amount_drawn numeric(18, 4) NULL,
	amount_deposited numeric(18, 4) NULL,
	transaction_balance numeric(18, 4) NULL,
	transaction_description text NULL,
	row_no int8 NULL,
	date_inserted timestamp NULL
);