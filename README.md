# Acquisition-Merger-Analysis-Hadoop-HDFS-Hive-Zeppelin-Spark-SQL-Scala-Tableau

## Overview:

Investigating and identifying various organizations for the most profitable merger and acquisition by examining accumulated data sets.

## Platforms, Languages and Tools:

- Big Data's Cloud Environment: Hadoop, HDFS, Zeppelin, Spark, Scala, SQL

or

- MySQL Database's Virtual Environment: MySQL, SQL, Python, SQL Alchemy

and

- Tableau

## Dataset:

Firm.csv

| Firm ID | Firm Name |
|-|-|

Staff.csv

| Emp ID	| Name | Prefix | First Name | Middle Initial | Last Name | Gender | E Mail | Father's Name | Mother's Name | Mother's Maiden | Name | Date of Birth | Time of Birth | Age in Yrs. | Weight in Kgs. | Date of Joining | Quarter of Joining | Half of Joining | Year of Joining | Month of Joining | Month Name of Joining | Short Month | Day of Joining | DOW of Joining | Short DOW | Age in Company (Years) | Salary | Last % Hike | SSN | Phone No. | Place Name | County | City | State | Zip | Region | User Name | Password | Firm ID | 
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| 

Sales.csv

| Order Number | Quantity Ordered | Price of Each	Order | Line Number	Sales | Revenue | Order Date | Status | Quarter ID | Month ID | Year ID | Product Line | MSRP | Product Code | Customer Name | Phone | Address Line 1 | Address Line 2 | City | State | Postal Code | Country | Territory | Contact Last Name | Contact First Name | Deal Size | Firm ID | 
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|

## Input data:

### Big Data's Cloud Platform - Hadoop:

#### 1. Load data into HDFS

- Upload 3 CSV files to a folder named 'tmp'

#### 2. Create an external tables in Hive for 'Firm' CSV file:
```
CREATE EXTERNAL TABLE IF NOT EXISTS Company (
		CompanyID INT, Name STRING)
		COMMENT 'Date of company names'
		ROW FORMAT DELIMITED
		FIELDS TERMINATED BY ','
		STORED AS TEXTFILE
```

#### 3. Load data of 2 CSV files into Zeppelin:

Create a sub-folder in the main folder 'tmp' to store the remaining 2 CSV files

##### 3.a. Sales:

```
%spark2
val Sales = (spark.read
		.option("header", "true") // Use first line as header
		.option("inferSchema", "true") // Infer Schema
		.csv("/tmp/Sales and Staff/Sales.csv")
```

##### 3.b. Sales:
```
%spark2
val Staff = (spark.read
		.option("header", "true") // Use first line as header
		.option("inferSchema", "true") // Infer Schema
		.csv("/tmp/Sales and Staff/Staff.csv")
```

#### 4. Print Scheme:
```
%spark2
sales.printSchema()
```

```
%spark2
employee.printSchema()
```

#### 5. Print out the data:
```
%spark2.sql
SELECT *
FROM EmpView
```

```
 %spark2.sql
SELECT *
FROM SalesView
```

#### 5. Analysis on Zeppelin:

##### 5.1. Revenue by Product Line:
```
SELECT ProductLine, Sum(Revenue) as Cumulated_Revenue 
FROM SalesView
GROUP BY ProductLine
```

##### 5.2. Sum Sales by Product Line & Firm Name
```
%spark2.sql
SELECT SUM(SalesView.Sales), SalesView.ProductLine, Firm.Name
FROM SalesView
JOIN Firm 
ON Firm.ID = SalesView.FirmID
WHERE Firm.FirmID < 11
GROUP BY SalesView.ProductLine
```

#### 5.3 Sum Revenue by Firm Name categorized by Car
```
%spark2.sql
SELECT SUM(SalesView.Revenue), Firm.Name 
FROM SalesView, Firm 
WHERE SalesView.FirmID = Firm.FirmID 
AND SalesView.ProductLine LIKE "%Cars%" 
GROUP BY Firm.Name  
ORDER BY SUM(SalesView.Sales) DESC
```

#### 5.4 Percentage of Salary to Revenue for each Firm by name
```
%spark2.sql
SELECT  SUM(SV.Revenue), SUM(EV.salary), SUM(EV.salary) / SUM(SV.Revenue)  * 100 AS Percent, F.Name 
FROM Salesview SV, Firm F, EmpView EV
WHERE SV.FirmID = EC.FirmID 
AND F.FirmID = EV.FirmID  
GROUP BY F.Name
ORDER BY Percent DESC

```

#### 5.5 
```
%spark2.sql
SELECT EV.Salary, EV.`First Name`, EV.`Last Name`, F.name  
FROM Firm F, EmpView EV
WHERE F.CompanyID = EV.CompanyID 
AND F.Name = "British Leyland"  
ORDER BY EV.Salary DESC

```

## Visualization

### Total Sales by Product Line

![Total Sales by Product Line](https://user-images.githubusercontent.com/70437668/139526107-6ee7c0f3-44e9-4165-95c0-6c6813a0b0c4.jpg)

### Total Sales by Firm Name colored by Product Line

![Total Sales by Firm Name colored by Product Line](https://user-images.githubusercontent.com/70437668/139526104-89c67f37-d8ff-4d2b-9d65-fa53e9f6c154.jpg)

### Total Sales by Firm Name and Product Line

![Total Sales by Firm Name and Product Line](https://user-images.githubusercontent.com/70437668/139526100-b9141193-da74-43d8-bdea-d8e2984db625.jpg)

### Total Revenue by Firm Name

![Total Revenue by Firm Name](https://user-images.githubusercontent.com/70437668/139526095-8d6f0f1d-5138-41b1-81f2-de4b19094cd1.jpg)

### Revenue Distribution by Product Line

![Revenue Distribution by Product Line](https://user-images.githubusercontent.com/70437668/139526093-714841ef-c2f8-4b46-b599-9c079901796c.jpg)

### Radar Chart Sum Sales by Product Line & Firm Name

![Radar Chart Sum Sales by Product Line   Firm Name](https://user-images.githubusercontent.com/70437668/139621278-a30cfe87-8b26-40a2-b738-1a8bfa89004a.jpg)

### Dashboard - Sales, Revenue by Firm, Product Line

![Dashboard - Sales, Revenue by Firm, Product Line](https://user-images.githubusercontent.com/70437668/139526090-327daecd-fd93-4ad3-a2e7-e79ff10487a2.jpg)

### Dashboard - Sum Sales by Firm, Product Line

![Dashboard - Sum Sales by Firm, Product Line](https://user-images.githubusercontent.com/70437668/139621296-820ee1d0-0314-48a9-87ec-d87ff038d324.jpg)

### Dashboard - Distribution by Sales & Revenue

![Dashboard - Distribution by Sales   Revenue](https://user-images.githubusercontent.com/70437668/139621303-d7bd0065-1456-448b-83bd-0bf9bfe7aeeb.jpg)

