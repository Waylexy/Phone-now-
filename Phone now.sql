--Data Information
select 
  * 
from 
  churn
  
  --Number of customers
Select 
  count(
    distinct(customerID)
  ) 
from 
  churn 
  
  --Count of gender
Select 
  gender, 
  count(gender) as no_of_gender 
from 
  churn 
group by 
  gender 
  
  --Number of customers by contract
select 
  contract, 
  count(Contract) as total 
from 
  churn 
group by 
  contract 
  
  --Monthly and total charges by Contract
select 
  contract, 
  round(
    sum(MonthlyCharges), 
    2
  ) as Monthly_charges, 
  round(
    sum(TotalCharges), 
    2
  ) as Total_charges 
from 
  churn 
group by 
  contract 
order by 
  Monthly_charges 
  
  --Monthly and total charges by internet service
select 
  internetservice, 
  round(
    sum(MonthlyCharges), 
    2
  ) as Monthly_charges, 
  round(
    sum(TotalCharges), 
    2
  ) as Total_charges 
from 
  churn 
group by 
  internetservice 
order by 
  Monthly_charges 
  
  --Top 10 Existing customer for rewards
select 
  Top 10 customerID, 
  gender, 
  round(TotalCharges, 0) as TotalCharges 
from 
  churn 
where 
  churn <> 'Yes' 
order by 
  TotalCharges desc 
  
  --Customer level of loyalty
select 
  customerID, 
  gender, 
  Tenure, 
  contract, 
  internetservice, 
  case When(tenure <= 20) Then 'Regular' 
  when(tenure between 21 
    and 40) then 'Premium' 
  Else 'Platinum' 
  end as Customer_level 
from 
  churn 
where 
  churn = 'No' 
  
  --Number of churn
select 
  count(Churn) as churn 
from 
  churn 
where 
  churn = 'Yes'
  
  --Total charges and monthly charges by churn customers
select 
  sum(monthlycharges) as Monthly_charges, 
  sum(totalcharges) as Total_charges 
from 
  churn 
where 
  churn = 'Yes' 
  
  --Churn customers internet service
select 
  internetservice, 
  round(
    sum(MonthlyCharges), 
    2
  ) as Monthly_charges, 
  round(
    sum(TotalCharges), 
    2
  ) as Total_charges 
from 
  churn 
where 
  churn = 'Yes' 
group by 
  internetservice 
order by 
  Monthly_charges 
  
  --churn customers contract
select 
  contract, 
  count(Contract) 
from 
  churn 
where 
  churn = 'Yes' 
group by 
  contract
