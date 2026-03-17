-- fact.account_wf_business_checking_load_history definition

-- Drop table

-- DROP TABLE fact.account_wf_business_checking_load_history;

CREATE TABLE fact.account_wf_business_checking_load_history (
	date_inserted_account_wf_business_checking_load_history timestamp DEFAULT now()::timestamp without time zone NULL,
	inserted_by_account_wf_business_checking_load_history text DEFAULT 'Script'::text NULL,
	account_wf_business_checking_history_id int4 DEFAULT nextval('fact.account_wf_business_checking__account_wf_business_checking__seq'::regclass) NOT NULL,
	date_transaction timestamp NULL,
	transaction_description text NULL,
	check_number int4 NULL,
	transaction_amount numeric(14, 2) NULL,
	amount_drawn numeric(14, 2) NULL,
	amount_deposited numeric(14, 2) NULL,
	CONSTRAINT account_wf_business_checking_load_history_pkey PRIMARY KEY (account_wf_business_checking_history_id)
);