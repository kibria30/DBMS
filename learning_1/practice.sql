-- Find customer name, loan number and loan amount of all customers 
-- having a loan at the Perryridge branch.
SELECT customer_name, borrower.loan_number loan_id, amount
FROM borrower, loan
WHERE branch_name = 'Perryridge' AND borrower.loan_number = loan.loan_number;