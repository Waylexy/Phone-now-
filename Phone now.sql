--1# Data Information
SELECT 
  * 
FROM 
  phone;
  
  --2#Number of customers
SELECT 
  COUNT(
    DISTINCT(customerID)
  ) 
FROM 
  phone; 
  
  --3#Count of gender
SELECT 
  gender, 
  COUNT(gender) AS no_of_gender 
FROM 
  phone 
GROUP BY 
  gender; 
  
  --4#Number of customers by contract
SELECT 
  contract, 
  COUNT(customerID) AS total 
FROM 
  phone 
GROUP BY 
  Contract;

  --5# Most prefered payment method
SELECT 
	paymentmethod, 
	COUNT(
		PaymentMethod) AS Most_preferred_method 
FROM 
	phone
  GROUP BY 
	PaymentMethod
  ORDER BY
	Most_preferred_method 
  DESC;
  
  --6#Monthly and total charges by Contract
SELECT 
  contract, 
  ROUND(
    SUM(MonthlyCharges), 
    2
  ) AS Monthly_charges, 
  ROUND(
    SUM(TotalCharges), 
    2
  ) AS Total_charges 
FROM 
  phone 
GROUP BY 
  contract 
ORDER BY 
  Monthly_charges; 
  
  --7#Monthly and total charges by internet service
SELECT 
  internetservice, 
  ROUND(
    SUM(MonthlyCharges), 
    2
  ) AS Monthly_charges, 
  ROUND(
    SUM(TotalCharges), 
    2
  ) AS Total_charges 
FROM 
  phone 
GROUP BY 
  internetservice 
ORDER BY 
  Monthly_charges; 
  
  --8#Top 10 Existing customer for rewards
SELECT 
  TOP 10 customerID, 
  gender, 
  ROUND(TotalCharges, 0) AS TotalCharges 
FROM 
  phone 
WHERE 
  churn <> 'Yes' 
ORDER BY 
  TotalCharges DESC; 
  
  --9#Customer level of loyalty
SELECT 
  customerID, 
  gender, 
  Tenure, 
  contract, 
  internetservice, 
  CASE 
  WHEN(tenure <= 20) THEN 'Regular' 
  WHEN(tenure between 21 and 40) then 'Premium' 
  ELSE 'Platinum' 
  END AS Customer_loyalty_level 
FROM 
  phone 
WHERE 
  churn = 'No'; 
  
  --Section two Churn analysis

  --1#Number of churn
SELECT 
  COUNT(Churn) AS churn_Customers 
FROM 
  phone 
WHERE 
  churn = 'Yes';
  
  --2#Total charges and monthly charges by churn customers
SELECT 
  ROUND(
	SUM(monthlycharges),2) 
  AS Monthly_charges, 
  ROUND(
	SUM(totalcharges),2) 
  AS Total_charges 
FROM 
  phone 
WHERE 
  churn = 'Yes'; 
  
  --3#Churn customers internet service
SELECT 
  internetservice, 
  ROUND(
    SUM(MonthlyCharges), 
    2
  ) AS Monthly_charges, 
  ROUND(
    SUM(TotalCharges), 
    2
  ) AS Total_charges 
FROM 
  phone 
WHERE 
  churn = 'Yes' 
GROUP BY 
  internetservice 
ORDER BY 
  Monthly_charges; 
  
  --4#churn customers contract
SELECT 
  contract, 
  COUNT(Contract) 
FROM 
  phone 
WHERE 
  churn = 'Yes' 
GROUP BY 
  contract;

  
