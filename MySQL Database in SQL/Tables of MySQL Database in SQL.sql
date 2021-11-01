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
### MySQL Database:

#### 1. Create 3 tables for Firm, Sales, Staff: */

--##### 1.1 Firm: 
CREATE TABLE `firm` (
  `Firm_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Firm_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Firm_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci

--##### 1.2 Staff:
CREATE TABLE `staff` (
  `Emp_ID` int(20) NOT NULL,
  `Name_Prefix` varchar(100) CHARACTER SET utf8 NOT NULL,
  `First_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Middle_Initial` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Last_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `E_Mail` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Father_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Mother_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Mother_Maiden_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Date_of_Birth` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Time_of_Birth` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Age_in_Years` float NOT NULL,
  `Weight_in_Kgs` int(20) NOT NULL,
  `Date_of_Joining` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Quarter_of_Joining` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Half_of_Joining` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Year_of_Joining` int(10) NOT NULL,
  `Month_of_Joining` int(10) NOT NULL,
  `Month_Name_of_Joining` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Short_Month` varchar(20) CHARACTER SET utf8 NOT NULL,
  `DOW_of_Joining` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Short_DOW` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Day_of_Joining` int(10) NOT NULL,
  `Age_in_Company_Years` float NOT NULL,
  `Salary` float NOT NULL,
  `SSN` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Phone_No` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Place_Name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `County` varchar(30) CHARACTER SET utf8 NOT NULL,
  `City` varchar(30) CHARACTER SET utf8 NOT NULL,
  `State` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Zip` int(10) NOT NULL,
  `Region` varchar(30) CHARACTER SET utf8 NOT NULL,
  `User_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Firm_ID` int(4) NOT NULL,
  `ID` int(10) NOT NULL,
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci

--##### 1.3 Sales:
CREATE TABLE `sales` (
  `Order_Number` int(10) NOT NULL,
  `Quantity_Ordered` int(5) NOT NULL,
  `Price_of_Each` float NOT NULL,
  `Order_Line_Number` int(5) NOT NULL,
  `Sales` float NOT NULL,
  `Revenue` float NOT NULL,
  `Order_Date` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Status` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Quarter_ID` int(10) NOT NULL,
  `Month_ID` int(10) NOT NULL,
  `Year_ID` int(4) NOT NULL,
  `Product_Line` varchar(50) CHARACTER SET utf8 NOT NULL,
  `MSRP` int(10) NOT NULL,
  `Product_Code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Customer_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Address_Line_1` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Address_Line_2` varchar(100) CHARACTER SET utf8 NOT NULL,
  `City` varchar(30) CHARACTER SET utf8 NOT NULL,
  `State` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Postal_Code` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Territory` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Contact_Last_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Contact_First_Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Deal_Size` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Firm_ID` int(4) NOT NULL,
  `ID` int(10) NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci