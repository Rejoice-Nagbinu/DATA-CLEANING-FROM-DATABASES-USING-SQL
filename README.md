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
At this point I'll take you through how I write codes to clean my data and make it ready by transforming it into a form I'll need for my analysis 
 
#### 1. From our first dataset the john&johnson dataset, In the accounts table, primary_poc(point of contact) column, primary_poc has the combined values of both the first name and the second name of the poc, but I'll need the names separated as first and last name. 
- how do I do this in sql, I'll have to split the names to form two separate columns. My code below and result 

![Screenshot_20220726-171508_1](https://user-images.githubusercontent.com/107328546/182004176-3f03e3cd-e0b4-4d77-9b68-62f474ae43ed.jpg)

![Screenshot_20220726-171508_2](https://user-images.githubusercontent.com/107328546/182004193-fed67568-2166-4c9d-9814-e8210190eb9a.jpg)

#### 2. From our john&johnson dataset, my manager wants me to create an email for each primary_poc, and says it should be the first name of the poc, last name of the poc@, company name.com 
- how do I do these first I'll have to split the primary_poc which I already did in our first instance, next I'll concatenate in the order I want the email address to be formed, I'll use a sub query to to perform my extraction of the values, and then the outer query to call the values I need, so as to improve runtime performance and optimize my code 

![Screenshot_20220726-172712_1](https://user-images.githubusercontent.com/107328546/182004220-31ced316-3e7f-4cd3-89b2-6a5e3a9414e4.jpg)

![Screenshot_20220726-172712_2](https://user-images.githubusercontent.com/107328546/182004227-40ab7d8e-5a77-47bf-a2cf-6b6d593fa221.jpg)

#### 3. From our second dataset the SF_crime dataset, I brought in this second dataset because our first dataset the date has already been cleaned and put in the correct format, I'll use this to show how to change date to a more analyzable format 
- let's get to know the datset with a brief look at the dataset

- and hereafter we take a look at the date column, you can see that the date column is not in the year-month-day format which is a best practice for sql and also the way i keep my dates column for easier analysis, also timestamp all of it was at 8:00:00am another wrong fill into our date column

- let's check to see if the dates columns has different lengths, so that while changing the format it is applied to every row in the correct step

- now how do I make this date column clean and in line with best practices and also ready to use for my analysis I'll have to split the date truncated to day since the timestamp is a wrong fill, and then concatenate the newly arrange date truncated to the day and then cast it as DATE, what this does is that it change ls the data type to a date data type in SQL 

#### 4. Back to our first dataset the john&johnson dataset, what if we had null values in orders table, account column and wanted to fill them maybe after getting their correct values from the data entry department with data from the accounts table, ID column. how do we do this, we'll use the coalesce function to update or fill out bills with our desired values.
- my code below 

#### 5. What if I'd like to replace the order table, account column with 0. 
- you just the same code but instead of a.id for the replacement value you use 0 instead

