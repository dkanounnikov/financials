-- fact.account_apple_categorized definition

-- Drop view

-- DROP VIEW fact.account_apple_categorized;

CREATE VIEW fact.account_apple_categorized AS
 SELECT (date_trunc('month'::text, (th.date_cleared)::timestamp with time zone))::date AS month_year,
    th.transaction_category,
    th.merchant,
        CASE
            WHEN (lower(th.merchant) ~~ lower('%Vivino%'::text)) THEN 'Gifts'::text
            WHEN (lower(th.merchant) ~~ lower('%Daily Cash%'::text)) THEN 'Fees'::text
            WHEN ((lower(th.merchant) ~~ lower('%extreme ice%'::text)) OR (lower(th.transaction_category) ~~ lower('%Grocery%'::text)) OR (lower(th.merchant) ~~ lower('%us national white%'::text)) OR (lower(th.merchant) ~~ lower('%Mecklenburg ABC%'::text))) THEN 'Entertainment'::text
            WHEN ((lower(th.merchant) ~~ lower('%youtube%'::text)) OR (lower(th.merchant) ~~ lower('%Wikimed%'::text)) OR (lower(th.merchant) ~~ lower('%Adobe%'::text)) OR (lower(th.merchant) ~~ lower('%Apple%'::text)) OR (lower(th.merchant) ~~ lower('%Apollo%'::text)) OR (lower(th.merchant) ~~ lower('%Hubspot Inc%'::text)) OR (lower(th.merchant) ~~ lower('%Vercel%'::text)) OR (lower(th.merchant) ~~ lower('%Jazz%'::text)) OR (lower(th.merchant) ~~ lower('%Openai%'::text)) OR (lower(th.merchant) ~~ lower('%sq *k%'::text)) OR (lower(th.merchant) ~~ lower('%Vivino Wine App%'::text))) THEN 'Software and Subscriptions'::text
            WHEN ((lower(th.merchant) ~~ lower('%Daddario%'::text)) OR (lower(th.merchant) ~~ lower('%Monthly Installments (%'::text)) OR (lower(th.merchant) ~~ lower('%Crate%'::text)) OR (lower(th.merchant) ~~ lower('%lowe%'::text)) OR (lower(th.merchant) ~~ lower('%omnilux%'::text)) OR (lower(th.merchant) ~~ lower('%home depot%'::text))) THEN 'Hardware and Equipment'::text
            WHEN ((lower(th.merchant) ~~ lower('%Jesson%'::text)) OR (lower(th.merchant) ~~ lower('%Pllc%'::text))) THEN 'Legal Fees'::text
            WHEN (lower(th.merchant) ~~ lower('%Shell Oil%'::text)) THEN 'Vehicle Expense'::text
            WHEN (lower(th.transaction_category) ~~ lower('%Grocery%'::text)) THEN 'Entertainment'::text
            WHEN (lower(th.transaction_category) ~~ lower('%Restaurants%'::text)) THEN 'Entertainment'::text
            WHEN (lower(th.merchant) ~~ lower('%2 10 Home Warranty%'::text)) THEN 'Insurance'::text
            WHEN ((lower(th.merchant) ~~ lower('%Blue Cross/blue Shield%'::text)) OR (lower(th.merchant) ~~ lower('%Ceenta Mychart%'::text)) OR (lower(th.merchant) ~~ lower('%Novant Health%'::text))) THEN 'Healthcare'::text
            WHEN ((lower(th.merchant) ~~ lower('%Massey%'::text)) OR (lower(th.merchant) ~~ lower('%Union%'::text))) THEN 'Services'::text
            WHEN ((lower(th.merchant) ~~ lower('%UPS%'::text)) OR (lower(th.merchant) ~~ lower('%Union%'::text))) THEN 'Shipping'::text
            WHEN (lower(th.merchant) ~~ lower('%Airbnb%'::text)) THEN 'Travel'::text
            ELSE 'TBD'::text
        END AS category,
    sum(th.amount_drawn) AS amount_drawn
   FROM fact.account_apple_credit_card_load_history th
  WHERE (((th.date_cleared >= '2024-01-01'::date) AND (th.date_cleared <= '2025-01-01'::date)) AND (th.transaction_amount < (0)::numeric))
  GROUP BY ((date_trunc('month'::text, (th.date_cleared)::timestamp with time zone))::date), th.transaction_category, th.merchant
  ORDER BY th.transaction_category;
