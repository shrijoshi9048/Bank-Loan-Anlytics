create database bank;
use bank;
select * from bank2 limit 10;

select CONCAT(FORMAT(SUM(loan_amnt) / 1000000, 2), 'M') as TotalLoanAmount, CONCAT(FORMAT(SUM(funded_amnt) / 1000000, 2), 'M')as fundedamount, 
CONCAT(FORMAT(SUM(revol_bal) / 1000000, 2), 'M') as TotalRevolvingBalance, CONCAT(FORMAT(SUM(total_rec_prncp) / 1000000, 2), 'M') as TotalReceivedPrinciple,
CONCAT(FORMAT(SUM(total_rec_int) / 1000000, 2), 'M') as TotalReceivedIntrest, CONCAT(FORMAT(SUM(out_prncp) / 1000000, 2), 'M') as Outstandingprinciple,
 CONCAT(format(avg(int_rate)*100, 0), '%') as avgintrest from bank2;


-- kpi 1 Year wise loan amount Stats

select distinct year(issue_d), sum(loan_amnt) from bank2 group by 1 order by 1,2 ;

SELECT DISTINCT  YEAR(issue_d) AS year, 
    CONCAT(FORMAT(SUM(loan_amnt) / 1000000, 2), 'M') AS loan_amount_in_million FROM  bank2
GROUP BY 1 ORDER BY year;


-- KPI 2 Grade and sub grade wise revol_bal
select grade, sub_grade , CONCAT(FORMAT(SUM(revol_bal) / 1000000, 2), 'M') as Revolbalance from bank2 group by 1,2 order by SUM(revol_bal) DESC;


-- KPI3 Total Payment for Verified Status Vs Total Payment for Non Verified Status
 select verification, CONCAT(FORMAT(SUM(loan_amnt) / 1000000, 2), 'M') as LoanAmount from bank2 group by 1;
 
 -- KPI 4 State wise and month wise loan status
 
 select addr_state AS STATE,  count(issue_d) AS lOANSTATUS from bank2 group by 1 order by count(issue_d) desc ;
 -- top 5 states
  select addr_state AS STATE,  count(issue_d) AS lOANSTATUS from bank2 group by 1 order by count(issue_d) desc limit 5;
 
 select addr_state AS STATE, MONTH, count(issue_d) AS lOANSTATUS from bank2 group by 1,2 order by count(issue_d) desc ;
 
 -- KPI 5 Home ownership Vs last payment date stats
 SELECT home_ownership, YEAR, loan_status, COUNT(last_pymnt_d) as lastpaymets FROM BANK2 group by 1,2,3 ORDER BY  COUNT(last_pymnt_d) DESC;



