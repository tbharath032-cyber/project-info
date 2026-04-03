select count(*) from debit_credit_banking_data;
select * from debit_credit_banking_data;
select distinct `Customer ID`,`Customer Name`,`Account Number`,`Transaction Date`,`Transaction Type` 
from debit_credit_banking_data;
select distinct`Customer ID` from debit_credit_banking_data;
#_________________________________________________________________________________________________________________________________________________________________
#_________________________________________________________________________________________________________________________________________________________________
#---------------------------------------------------------------- WELCOME TO EVERYONE----------------------------------------------------------------------------
#--------------------------------------------------------PROJECT-DEBIT AND CREDIT BANKING DATA-------------------------------------------------------------------
#------------------------------------------------------------------USING MYSQL QUERY------------------------------------------------------------------------------
#------------------------------------------------------------------------GROUP-5----------------------------------------------------------------------------------
#_________________________________________________________________________________________________________________________________________________________________
#__________________________________________________________________________________________________________________________________________________________________

#TO ACTIVATE DATABASE
USE BANKING;

#TO SEE ENTIRE TABLE DATA
select*FROM debit_credit_banking_data;





#-----------------------------------------------------------------------------------------------------------------------------------------------------------
#(1)     Top 10 Customers with Highest Balances
select`Customer Name`, round(sum(Amount),2) as Total_Transaction from debit_credit_banking_data
 group by`Customer Name` order by Total_Transaction desc limit 10;
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------
 #(2)     Total Transaction per Bank
 select `Bank Name`, count(*) as Total_Transactions, round( 
 sum(Amount),2) as Total_Amount
 from debit_credit_banking_data 
 group by `Bank Name` order by Total_Amount desc;
 
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------
 #(3)      Average Balance per Branch
 select Branch, round(avg(Balance),2) as Avg_Balance
 from debit_credit_banking_data group by Branch order by Avg_Balance desc;
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
 #(4)      Most used Transaction Methods
select `Transaction Method`, count(*) as Usage_Count 
from debit_credit_banking_data group by`Transaction Method` order by Usage_Count desc;

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#(5)       Top 7 Suspicious Transactions
select `Customer Name`,`Account Number`,Amount,date(`Transaction Date`),`Description` 
from debit_credit_banking_data where `Suspicious Transaction` = 'High Value' 
order by Amount desc limit 7;
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#(6)        Weekly Transaction Volume
select `Week of Year`, count(*) as Total_Transactions, round(sum(Amount),2) as Total_Amount from debit_credit_banking_data 
group by `Week of Year` order by`Week of Year`;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#(7)        Customer Balance Ranking
select `Customer Name`,`Account Number`,max(Balance) as Max_Balance from debit_credit_banking_data
 group by`Customer Name`,`Account Number` order by Max_Balance desc limit 20;
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #(8)       All Transactions above 2000
 select `Customer ID`,`Customer Name`,`Account Number`,`Amount`,`Transaction Date`,`Transaction Type` 
 from debit_credit_banking_data where `Amount` > 2000;
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
 #(9)       Find All Transactions from ICICI Bank
 select `Customer ID`,`Customer Name`,`Account Number`,Amount,date(`Transaction Date`)
 from debit_credit_banking_data where `Bank Name` = 'ICICI Bank';
 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #(10)       SUSPICIOUS TRANSACTIONS HIGH VALUES
 SELECT 
  `Customer Name`,`Account Number`,date(`Transaction Date`),  `Transaction Type`,  `Amount`,`Balance`,`Description`,  `Branch`,`Transaction Method`,`Currency`,`Bank Name`,
  `Week of Year`,`Risk Flag`,`Suspicious Transaction`FROM debit_credit_banking_data WHERE `Suspicious Transaction` = 'High Value';
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #(11)        HIGH RISK CUSTOMERS
 select row_number() over (order by `customer name`) as serial_no, `customer name`, `risk flag` from debit_credit_banking_data where `risk flag` = 'High Risk';

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         
 #(12)         CUSTOMER WITH LOW BALANCE OR  (<1000)      
 SELECT `Customer Name`, `Account Number`, Balance FROM debit_credit_banking_data WHERE Balance < 1000 ORDER BY Balance ASC;
 
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
 
#-------------------------------- USING SUBQUERY-------------------------------------------------------------------------------------------------

#(13)           BALANCE > AVG BALANCE
select `customer name`,`balance`from debit_credit_banking_data where `balance` > 
(select avg(`balance`) from debit_credit_banking_data);
#---------------------------------------------------------------------------------------------------------------------------------------------------------

#----------------------------- USING STORED PROCEDURES---------------------------------------------------------------------------------------------------


#(14)             GET THE HIGH RISK CUSTOMERS        
call get_high_risk_customers();
#----------------------------------------------------------------------------------------------------------------------------------------------------------

#------------------------------USING VIEWS-----------------------------------------------------------------------------------------------------------------

#(15)            BRANCH_TRANSACTIONS           

SELECT * FROM branch_transactions;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
#---------------------------------------------THANK------YOU-------------------------------------------------------------------------------------------------





 


 