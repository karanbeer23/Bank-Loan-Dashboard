select * from bank_loan_data;

-- TOTAL APPLICATIONS
SELECT COUNT(id) [Total Loan Applications] from bank_loan_data

SELECT COUNT(id) [MTD Total Applications] FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) [ PMTD Total Loan Applications] from bank_loan_data
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) = 2021

--TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount)  [Total Funded Amount] FROM bank_loan_data

SELECT SUM(loan_amount)  [MTD Total Funded Amount] FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount)  [PMTD Total Funded Amount] FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--TOTAL AMOUND RECEVIED
SELECT SUM(total_payment)  [Total Amount RECIEVED] FROM bank_loan_data

SELECT SUM(total_payment)  [MTD Total Amount RECIEVED] FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment)  [PMTD Total Amount RECIEVED] FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--AVG INTEREST RATE
SELECT ROUND(AVG(int_rate)*100,2) [AVG INTERESST RATE] FROM bank_loan_data

SELECT ROUND(AVG(int_rate)*100 ,2) [MTD AVG INTERESST RATE] FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate)*100 ,2) [PMTD AVG INTERESST RATE] FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--AVG DTI
SELECT ROUND(AVG(dti)*100,2) [AVG DTI] FROM bank_loan_data

SELECT ROUND(AVG(dti)*100,2) [MTD AVG DTI] FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti)*100,2) [PMTD AVG DTI] FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--GOOD LOAN PERCENTAGE
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id)[GOOD LOAN PERCENTAGE]
FROM bank_loan_data

--GOOD LOAN AAPLICATIONS
SELECT COUNT(id) [GOOD LOAN APPLICATIONS] FROM bank_loan_data
WHERE loan_status = 'FULLY PAID'  OR LOAN_STATUS= 'CURRENT'

--GOOD LOAN FUNDED AMOUNT
SELECT SUM(loan_amount) [GOOD LOAN FUNDED AMOUNT] FROM bank_loan_data
WHERE loan_status = 'FULLY PAID'  OR LOAN_STATUS= 'CURRENT'

--GOOD LOAN RECIEVED AMOUNT
SELECT SUM(total_payment) [GOOD LOAN RECIEVED AMOUNT] FROM bank_loan_data
WHERE loan_status = 'FULLY PAID'  OR LOAN_STATUS= 'CURRENT'


--Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) [BAD LOAN PERCENTAGE]
FROM bank_loan_data

--Bad Loan Applications
SELECT COUNT(id) [BAD LOAN APPLICATION] FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount
SELECT SUM(loan_amount) [BAD LOAN FUNDED AMOUNT] FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Amount Received
SELECT SUM(total_payment) [BAD LOAN RECIEVED AMOUNT] FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--LOAN STATUS
SELECT
        loan_status,
        COUNT(id) [TOTAL APPLICATION],
        SUM(total_payment) [Total Amount Received],
        SUM(loan_amount) [Total Funded Amount],
        AVG(int_rate * 100) [Interest Rate],
        AVG(dti * 100) [DTI]
    FROM
        bank_loan_data
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS [MTD Total Amount Received], 
	SUM(loan_amount) AS [MTD Total Funded Amount] 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

--MONTH
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

--TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

--EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

-- PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

--HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership
