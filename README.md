# DATA-CLEANING/WRANGLING-FROM-DATABASES-USING-SQL
This project shows how I clean data using SQL 

## INTRODUCTION 
Data cleaning or wrangling refers to a steps taken to clean and transform our data after querying our database, to turn raw data into an Analytical dataset ready for analysis this is a prerequisite for every successfull data analysis
this helps the Analyst to efficiently and perfectly analyse our data for good and informed business decisions 

In this project I'll walk you through a few steps I used in cleaning and transforming the datasets gotten from my local PostgreSQL database, we'll be dealing with two different datasets throughout this project, the first dataset is the john&Johnsons dataset and imaginary news paper selling company I'll use this for to show all the cleaning 
processes I take while cleaning my datasets, And the second data set S.F_crime_data which is a dataset that contains data on crime and all related to a every crime in the data 
 
### GETTING TO KNOW OUR DATASETS 
- The first data john and johnson contains 5 tables which are account table, web_event table, orders table, sales_rep table and regions table 
- The second dataset contains just one table and many columns which are, date,category, incident_num, descript, resolution, address et all. 

## DATA CLEANING 
At this point I'll take you through how I write codes to clean my data and make it ready my transforming it into a form I'll need for my analysis 
 
1. From our first dataset the john&johnson dataset, In the accounts table, primary_poc(point of contact) column, primary_poc has the combined values of both the first name and the second name of the poc, but I'll need the names separated as first and last name. 
- how do I do this in sql, I'll have to split the names to form two separate columns. My code below and result 

2. From our john&johnson dataset, my manager wants me to create an email for each primary_poc, and says it should be the first name of the poc, last name of the poc@, company name.com 
- how do I do these first I'll have to split the primary_poc which I already did in our first instance, next I'll concatenate in the order I want the email address to be formed, I'll use a sub query to to perform my extraction of the values, and then the outer query to call the values I need, so as to improve runtime performance and optimize my code 

3.

