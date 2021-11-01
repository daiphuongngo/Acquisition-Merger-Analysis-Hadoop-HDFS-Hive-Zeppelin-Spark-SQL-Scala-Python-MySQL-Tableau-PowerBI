/*
Firm.csv
| Firm_ID | Firm_Name |

Staff.csv
| Emp_ID | Name | Prefix | First_Name | Middle_Initial | Last_Name | Gender | E_Mail | Father_Name | Mother_Name | Mother_Maiden_Name | Date_of_Birth | Time_of_Birth | Age_in_Yrs | 
Weight_in_Kgs | Date_of_Joining | Quarter_of_Joining | Half_of_Joining | Year_of_Joining | Month_of_Joining | Month_Name_of_Joining | Short_Month | Day_of_Joining | DOW_of_Joining | 
Short_DOW | Age_in_Company_Years | Salary | SSN | Phone_No | Place_Name | County | City | State | Zip | Region | User_Name | Password | Firm_ID | 

Sales.csv
| Order_Number | Quantity_Ordered | Price_of_Each_Order | Line_Number | Sales | Revenue | Order_Date | Status | Quarter_ID | Month_ID | Year_ID | Product_Line | MSRP | Product_Code | 
Customer_Name | Phone | Address_Line 1 | Address_Line 2 | City | State | Postal_Code | Country | Territory | Contact_Last_Name | Contact_First_Name | Deal_Size | Firm_ID | 

## Input data:
### Big Data's Cloud Platform - Hadoop:
#### 1. Load data into HDFS
- Upload 3 CSV files to a folder named 'tmp'

#### 2. Create an external tables in Hive for 'Firm' CSV file: */
CREATE EXTERNAL TABLE IF NOT EXISTS Company (
		CompanyID INT, Name STRING)
		COMMENT 'Date of company names'
		ROW FORMAT DELIMITED
		FIELDS TERMINATED BY ','
		STORED AS TEXTFILE

--#### 3. Load data of 2 CSV files into Zeppelin:
--Create a sub-folder in the main folder 'tmp' to store the remaining 2 CSV files

--##### 3.a. Sales:
%spark2
val Sales = (spark.read
		.option("header", "true") // Use first line as header
		.option("inferSchema", "true") // Infer Schema
		.csv("/tmp/Sales and Staff/Sales.csv")

--##### 3.b. Sales:
%spark2
val Staff = (spark.read
		.option("header", "true") // Use first line as header
		.option("inferSchema", "true") // Infer Schema
		.csv("/tmp/Sales and Staff/Staff.csv")

--#### 4. Print Scheme:
%spark2
sales.printSchema()

%spark2
employee.printSchema()

--#### 5. Print out the data:
%spark2.sql
SELECT *
FROM EmpView

 %spark2.sql
SELECT *
FROM SalesView

--#### 5. Analysis on Zeppelin:

--##### 5.1. Revenue by Product Line:
SELECT Product_Line, Sum(Revenue) as Cumulated_Revenue 
FROM SalesView
GROUP BY Product_Line

--##### 5.2. Sum Sales by Product Line & Firm Name
%spark2.sql
SELECT SUM(SalesView.Sales), SalesView.Product_Line, Firm.Firm_Name
FROM SalesView
JOIN Firm 
ON Firm.Firm_ID = SalesView.Firm_ID
WHERE Firm.Firm_ID < 11
GROUP BY SalesView.Product_Line

--#### 5.3 Sum Revenue by Firm Name categorized by Car
%spark2.sql
SELECT SUM(SalesView.Revenue), Firm.Firm_Name 
FROM SalesView, Firm 
WHERE SalesView.Firm_ID = Firm.Firm_ID 
AND SalesView.Product_Line LIKE "%Cars%" 
GROUP BY Firm.Firm_Name  
ORDER BY SUM(SalesView.Sales) DESC

--#### 5.4 Percentage of Salary to Revenue for each Firm by name
%spark2.sql
SELECT  SUM(SV.Revenue), SUM(EV.Salary), SUM(EV.Salary) / SUM(SV.Revenue)  * 100 AS Percent, F.Firm_Name 
FROM Salesview SV, Firm F, EmpView EV
WHERE SV.Firm_ID = EC.Firm_ID 
AND F.Firm_ID = EV.Firm_ID  
GROUP BY F.Firm_Name
ORDER BY Percent DESC

--#### 5.5 Show the lowest Percentage of Salary to Revenue, Salary of all employees of Firm in Descending order. 
--The name of the Firm is in the output of the previous query. This Firm is the one earning the most among all Firms.
%spark2.sql
SELECT EV.Salary, EV.First_Name, EV.Last_Name, F.Firm_name  
FROM Firm F, EmpView EV
WHERE F.Firm_ID = EV.Firm_ID 
AND F.Firm_Name = "British Leyland"  
ORDER BY EV.Salary DESC