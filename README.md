# Yelp-Project

## Topic 
The purpose of this project is to develop a Machine Learning model to predict a restaurant's success. 

Success is measured through ratings (from 1 to 5 stars) in the following manner:
- 4 to 5 - successful
- 3 to 3.9 - good
- 2 to 2.9 - average
- 1 to 1.9 - poor

We gathered data from Yelp on the top restaurant attributes associated with higher or lower ratings. Based on all possible combinations of these attributes, the model will make rating predictions. 
---------------------------------------------------------------------------------------

## Motivation 
The restaurant industry took a big hit from the recent pandemic. Now, more than ever, restaurant owners can greatly benefit from the insights presented by what consumers currently value the most in the food industry. In accessing data on the top rated attributes, restaurant owners and investors can learn how to best appeal to the public in ever-changing times. 

The predicting model developed in this project can be applied to other regions and used by various stakeholders.
---------------------------------------------------------------------------------------

## Team Members and Communication Protocols
In this group project, responsibilities were shared equally among all team members. Each team member participated in every part of the project. However, some had their unique responsibilities as well. 

| Member | Responsibilities                            |
| -------------| ------------------------------------- |
| [Aigerim Zhanibekova](https://github.com/Aigerim-Zh) | Manage the GitHub repository and README write-up; Data Cleaning; Machine Learning; ERD diagram |
| [Ana Bisker](https://github.com/anaorenstein) | General Project Manager; Machine Learning Lead; |
| [Hristo Bustamante](https://github.com/hbustamante8) | Machine Learning; Data Cleaning; Database Creation |
| [Leila Corvera Fontela](https://github.com/leilacf) | Machine Learning; Data Cleaning; Database Creation; ERD diagram ]|
| [Ngoc Chau](https://github.com/Ngoclchau) | Data Extraction; Data Cleaning; ERD diagram|

Team members had regular meetings over Zoom and always stayed in touch through IMessages and Slack chats. Some intermediate and brainstorming files were shared through Google Drive. 
---------------------------------------------------------------------------------------

## Source of the Data
The data used in this project is [Yelp's businesses, reviews, and users subset data](https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset?datasetId=10100&language=Python&outputs=null) extracted from Kaggle.
    - The original raw data contains business information across 8 metropolitan areas in the USA and Canada. For this project, we will focus on the USA and X states. 
    - The data was last updated on February 16, 2021.
    - There are 150,346 records in total, which will be filtered to only restaraunts resulting in [X] records. 
---------------------------------------------------------------------------------------

## Questions We Hope to Answer with the Data 
- What are the most important attributes that make a restaurant more or less successful (how are they correlated with its rating)?
- Can we predict a restaurant's rating based on its current or potential attributes?
    - Attributes such as:
        - Delivery Takeout
        - Outdoor Dining
        - Vegeterian Options
        - Free Wi-Fi
- Are there any significant differences across regions?

---------------------------------------------------------------------------------------

## Database
As a part of this project, we will develop a database in PostgreSQL using pgAdmin. As demonstrated in the Entity Relationship Diagram below, the database consits of three tables:
- Business
- Reviews
- User

The Business table has a one-to-many connection to the Reviews table through the Business_ID column. The User table has a one-to-many connection to the Reviews table through the User_ID. The ERD also specifies a data type for each column. 

![ERD]()

**For Segment 1** of this project, we used synthetic datasets generated through [generatedata.com](https://generatedata.com/generator) saved [here](). 


---------------------------------------------------------------------------------------
## Data Processing 
Since our data came in JSON format, it will require significant cleaning. We expect the following data cleaning tasks:
- Filtering the data for restaurants. 
- Checking for data types, duplicates, and null values. 
- In the Business JSON dataset, all attributes of interest are in one column. Each attribute needs to be extracted in a separate column.
- Renaming and reordering columns in a readible format. 
- Finally, all JSON files will be converted to Pandas DataFrames and then to CSV files. 
---------------------------------------------------------------------------------------
## Machine Learning Model 
We are going to use a predictive **Supervized Machine Learning** model to predict ratings based on all possible combinations of attributes. To implement our model, we will create a model, train the model, and then create predictions. 

**For Segment 1** of this project, we are going to start with a preliminary **Multiple Linear Regression** model using synthetic data. 
[Ana - model building steps]
1. 
2.
3.
Feature Selection 
There are five independent variables 
The dependent variable is Star Ratings. 

-----------------------------------------------------------------------------------------
## Dashboard
We will use Tableau to create and host our dashboard, which will be connected to our Postgres database

-----------------------------------------------------------------------------------------

## Project Results
-----------------------------------------------------------------------------------------

## Areas for Future Analysis
-----------------------------------------------------------------------------------------

## Areas for Improvement 



