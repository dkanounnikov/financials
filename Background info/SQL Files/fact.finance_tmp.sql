-- fact.finance_tmp definition

-- Drop table

-- DROP TABLE fact.finance_tmp;

CREATE TABLE fact.finance_tmp (
	month_transaction date NULL,
	date_transaction date NULL,
	transaction_type text NULL,
	category text NULL,
	payee text NULL,
	transaction_description text NULL,
	amount_deposited numeric(18, 2) NULL,
	amount_drawn numeric(18, 2) NULL,
	amount_balance numeric(18, 2) NULL,
	account_fnb_business_checking_history_id int4 NULL
);
