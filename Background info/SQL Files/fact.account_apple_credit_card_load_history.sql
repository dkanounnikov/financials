-- fact.account_apple_credit_card_load_history definition

-- Drop table

-- DROP TABLE fact.account_apple_credit_card_load_history;

CREATE TABLE fact.account_apple_credit_card_load_history (
	date_inserted timestamp DEFAULT now() NULL,
	inserted_by text DEFAULT 'Script'::text NULL,
	account_apple_credit_card_load_history_id int4 DEFAULT nextval('fact.account_apple_credit_card_loa_account_apple_credit_card_loa_seq'::regclass) NOT NULL,
	date_transaction date NULL,
	date_cleared date NULL,
	transaction_description text NULL,
	merchant text DEFAULT 'Unknown'::text NULL,
	transaction_category text DEFAULT 'Unknown'::text NULL,
	transaction_type text DEFAULT 'Unknown'::text NULL,
	purchaser text DEFAULT 'Unknown'::text NULL,
	transaction_amount numeric NULL,
	amount_drawn numeric NULL,
	amount_deposited numeric NULL,
	CONSTRAINT account_apple_credit_card_load_history_pkey PRIMARY KEY (account_apple_credit_card_load_history_id)
);