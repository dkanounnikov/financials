-- zrc.account_apple_credit_card definition

-- Drop table

-- DROP TABLE zrc.account_apple_credit_card;

CREATE TABLE zrc.account_apple_credit_card (
	date_transaction text NULL,
	date_cleared text NULL,
	description text NULL,
	merchant text NULL,
	category text NULL,
	transaction_type text NULL,
	amount text NULL,
	purchaser text NULL,
	row_no int8 NULL,
	date_inserted timestamp DEFAULT now() NULL
);
