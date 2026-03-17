-- fact.account_fnb_business_checking_load_history definition

-- Drop table

-- DROP TABLE fact.account_fnb_business_checking_load_history;

CREATE TABLE fact.account_fnb_business_checking_load_history (
	date_inserted_account_fnb_business_checking_load_history timestamp DEFAULT (now())::timestamp without time zone NULL,
	inserted_by_account_fnb_business_checking_load_history text DEFAULT 'Script'::text NULL,
	account_fnb_business_checking_history_id int4 DEFAULT nextval('fact.account_fnb_business_checking__account_fnb_business_checking__s'::regclass) NOT NULL,
	date_transaction date NULL,
	transaction_description text NULL,
	transaction_amount numeric(18, 2) NULL,
	amount_drawn numeric(18, 2) NULL,
	amount_deposited numeric(18, 2) NULL,
	amount_balance numeric(18, 2) NULL,
	CONSTRAINT account_fnb_business_checking_load_history_pkey PRIMARY KEY (account_fnb_business_checking_history_id)
);
