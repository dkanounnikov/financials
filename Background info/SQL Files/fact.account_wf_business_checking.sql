-- fact.account_wf_business_checking definition

-- Drop view

-- DROP VIEW fact.account_wf_business_checking;

CREATE VIEW fact.account_wf_business_checking AS
 SELECT ((to_char(account_wf_business_checking_load_history.date_transaction, 'Month'::text) || ' '::text) || to_char(account_wf_business_checking_load_history.date_transaction, 'YYYY'::text)) AS month_transaction,
    account_wf_business_checking_load_history.date_transaction,
        CASE
            WHEN (account_wf_business_checking_load_history.transaction_amount < (0)::numeric) THEN 'Expenses'::text
            ELSE 'Income'::text
        END AS transaction_type,
        CASE
            WHEN (((account_wf_business_checking_load_history.transaction_description ~~ '%INTEREST PAYMENT%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%WIRE TRANS SVC CHARGE%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%DIRECT PAY%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%RECURRING TRANSFER TO BICYCLE LLC BUSINESS MARKET RATE SAVINGS%'::text)) AND (account_wf_business_checking_load_history.transaction_amount > (0)::numeric)) THEN 'Bank Interest'::text
            WHEN (((account_wf_business_checking_load_history.transaction_description ~~ '%INTEREST PAYMENT%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%WIRE TRANS SVC CHARGE%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%DIRECT PAY%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%RECURRING TRANSFER TO BICYCLE LLC BUSINESS MARKET RATE SAVINGS%'::text)) AND (account_wf_business_checking_load_history.transaction_amount < (0)::numeric)) THEN 'Bank Charges'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%ATM WITHDRAWAL%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%ATM WITHDRAWAL%'::text)) THEN 'Cash - Uncategorized'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%MONTHLY OFFICE CLEANING%'::text) THEN 'Office Expenses'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = ('-310'::integer)::numeric)) THEN 'Office Expenses'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = '-1937.5'::numeric)) THEN 'Accounting Services'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = ('-1937.5'::numeric - (2310)::numeric))) THEN 'Services'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND ((account_wf_business_checking_load_history.transaction_amount = ('-240'::integer)::numeric) OR (account_wf_business_checking_load_history.transaction_amount = ('-200'::integer)::numeric) OR (account_wf_business_checking_load_history.transaction_amount = ('-160'::integer)::numeric))) THEN 'Subcontracor'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = ('-2310'::integer)::numeric)) THEN 'Sales Services'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AM COMMUNICATION%'::text) THEN 'Revenue'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%TEAMWORK%'::text) THEN 'Software and Subscriptions'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%TD AUTO FINANCE%'::text) THEN 'Vehicle Expenses'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%4096%'::text) THEN 'TBD'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '% IRS %'::text) THEN 'Tax Expense'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AMZ STORE%'::text) THEN 'TBD'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%APPLE.COM%'::text) THEN 'Software and Subscriptions'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%IRONWOOD%'::text) THEN 'Revenue'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Pronovos%'::text) THEN 'Revenue'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WAGE PAY%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%ADP Tax%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%ADP PAY%'::text)) THEN 'Payroll'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%VENMO PAYMENT 230225 1025485494505%'::text) THEN 'Charity'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Office in Ballantyne%'::text) THEN 'Office Expenses'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%CITI CARD%'::text) THEN 'TBD'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AMAZON%'::text) THEN 'TBD'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Bicycle BI PTY LTD%'::text) THEN 'Bicycle RSA'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%IONOS%'::text) THEN 'Infrastructure'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%APPLECARD%'::text) THEN 'TBD'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%HISCOX%'::text) THEN 'Insurance'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%Wells Fargo Bank EDI PYMNTS%'::text) AND (account_wf_business_checking_load_history.transaction_amount > (0)::numeric)) THEN 'Revenue'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Spectrum%'::text) THEN 'Communications'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%ATT Payment%'::text) THEN 'Communications'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%Tidal%'::text) OR ((account_wf_business_checking_load_history.transaction_description ~~ '%INTERNATIONAL PURCHASE TRANSACTION FEE%'::text) AND (account_wf_business_checking_load_history.transaction_amount = '-0.19'::numeric))) THEN 'Software and Subscriptions'::text
            WHEN ((lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%SYNCHRONY BANK%'::text)) AND ((account_wf_business_checking_load_history.transaction_description ~~ '%MOROZOVA%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%KANOUNN%'::text))) THEN 'Health Care'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Microsoft%'::text) THEN 'Software and Subscriptions'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AMEDION%'::text) THEN 'Travel'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%TESLA%'::text) THEN 'Vehicle Expenses'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%ZELLE TO VALLE BRENDA%'::text) THEN 'Subcontractor'::text
            ELSE 'TBD'::text
        END AS category,
        CASE
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%INTEREST PAYMENT%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%WIRE TRANS SVC CHARGE%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%DIRECT PAY%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%RECURRING TRANSFER TO BICYCLE LLC BUSINESS MARKET RATE SAVINGS%'::text)) THEN 'Wells Fargo'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%ATM WITHDRAWAL%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%ATM WITHDRAWAL%'::text)) THEN 'Cash Withdrawal'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%MONTHLY OFFICE CLEANING%'::text) THEN 'Office Cleaning'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = ('-310'::integer)::numeric)) THEN 'Office Cleaning'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = '-1937.5'::numeric)) THEN 'Bonka Consulting'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = ('-1937.5'::numeric - (2310)::numeric))) THEN 'Bonka Consulting and Halo AI'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND ((account_wf_business_checking_load_history.transaction_amount = ('-240'::integer)::numeric) OR (account_wf_business_checking_load_history.transaction_amount = ('-200'::integer)::numeric) OR (account_wf_business_checking_load_history.transaction_amount = ('-160'::integer)::numeric))) THEN 'Natalia Ryzhikova'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WF Direct Pay%'::text) AND (account_wf_business_checking_load_history.transaction_amount = ('-2310'::integer)::numeric)) THEN 'Halo AI'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AM COMMUNICATION%'::text) THEN 'Genesys'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%TEAMWORK%'::text) THEN 'Teamwork'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%TD AUTO FINANCE%'::text) THEN 'Tesla - TD'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%4096%'::text) THEN 'usbank'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '% IRS %'::text) THEN 'IRS'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AMZ STORE%'::text) THEN 'Amazon'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%APPLE.COM%'::text) THEN 'Apple'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%IRONWOOD%'::text) THEN 'Ironwood'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Pronovos%'::text) THEN 'Pronovos'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%WAGE PAY%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%ADP Tax%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%ADP PAY%'::text)) THEN 'ADP - Payroll'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%VENMO PAYMENT 230225 1025485494505%'::text) THEN 'Charity'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Office in Ballantyne%'::text) THEN 'Office in Ballantyne'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%CITI CARD%'::text) THEN 'Citi'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AMAZON%'::text) THEN 'Amazon'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Bicycle BI PTY LTD%'::text) THEN 'Bicycle RSA'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%IONOS%'::text) THEN 'Ionos'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%APPLECARD%'::text) THEN 'Apple Card'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%HISCOX%'::text) THEN 'Hiscox Insurance'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%Wells Fargo Bank EDI PYMNTS%'::text) AND (account_wf_business_checking_load_history.transaction_amount > (0)::numeric)) THEN 'Octapharma'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Spectrum%'::text) THEN 'Spectrum'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%ATT Payment%'::text) THEN 'AT&T'::text
            WHEN ((account_wf_business_checking_load_history.transaction_description ~~ '%Tidal%'::text) OR ((account_wf_business_checking_load_history.transaction_description ~~ '%INTERNATIONAL PURCHASE TRANSACTION FEE%'::text) AND (account_wf_business_checking_load_history.transaction_amount = '-0.19'::numeric))) THEN 'Tidal'::text
            WHEN ((lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%SYNCHRONY BANK%'::text)) AND ((account_wf_business_checking_load_history.transaction_description ~~ '%MOROZOVA%'::text) OR (account_wf_business_checking_load_history.transaction_description ~~ '%KANOUNN%'::text))) THEN 'CareCredit'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%Microsoft%'::text) THEN 'Microsoft'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%AMEDION%'::text) THEN 'Amedion Group - Travel'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%TESLA%'::text) THEN 'Tesla'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%ZELLE TO VALLE BRENDA%'::text) THEN 'Brenda Valle'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%MODIS%'::text) THEN 'Modis - Eric'::text
            WHEN (account_wf_business_checking_load_history.transaction_description ~~ '%IRONWOD%'::text) THEN 'Ironwood'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%PRONOV%'::text)) THEN 'ProNovos'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%North Shore%'::text)) THEN 'North Shore - Eric'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%Genesys%'::text)) THEN 'Genesys'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%LUDWIG%'::text)) THEN 'LSW'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%lsw%'::text)) THEN 'LSW'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%EXIST%'::text)) THEN 'Exist BI'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%DK Loan%'::text)) THEN 'DK Loan'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%ONLINE TRANSFER FROM KANOUNNIKOV%'::text)) THEN 'DK Loan'::text
            WHEN (lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%Octapharma%'::text)) THEN 'Octapharma'::text
            WHEN ((lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%edeposit in%'::text)) AND (account_wf_business_checking_load_history.amount_deposited > (5000)::numeric)) THEN 'Octapharma'::text
            WHEN ((lower(account_wf_business_checking_load_history.transaction_description) ~~ lower('%mobile deposit%'::text)) AND (account_wf_business_checking_load_history.amount_deposited > (8000)::numeric)) THEN 'Octapharma'::text
            ELSE 'TBD'::text
        END AS payee,
    account_wf_business_checking_load_history.transaction_description,
    account_wf_business_checking_load_history.amount_deposited,
    account_wf_business_checking_load_history.amount_drawn
   FROM fact.account_wf_business_checking_load_history;
