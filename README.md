# Yelp-Project

## Topic 
The purpose of this project is to develop a machine learning model to predict whether a restaraunt can be successul based on its attributes. 

## Motivation 
We selected this topic because building this model can inform investors or business owners who want to open a restarurant or who currently run a restaraunt in the specified area on what they need to implement in their restaurants and services to make it successful. This model can be applied to other regions and used by other stakeholders.

## Team Members and Communication Protocols
In this group project, responsibilities were shared more or less equally among all team members. Each team member participated in every part of the project. However, some had their unique responsibilities as well. 

| Member | Responsibilities                            |
----------------------------------------------------
| [Aigerim Zhanibekova]() | Manage the GitHub repository and README write-up; Data Cleaning; Machine Learning |
| [Ana Bisker]() | General Project Manager; |
| [Hristo Bustamante]() |  |
| [Leila Corvera Fontela]() | |
| [Ngoc Chau]() | Conversion of JSON into CSV; |

Team members had regular meetings over Zoom and always stayed in touch through IMessages and Slack chats. Some intermediate and brainstorming files were shared through Google Drive. 

## Source of the Data
The data used in this project is [Yelp's businesses, reviews, and users subset data](https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset?datasetId=10100&language=Python&outputs=null) extracted from Kaggle.
    - The original raw data contains business information across 8 metropolitan areas in the USA and Canada. For this project, we will focus on the USA and X states. 
    - The data was last updated on February 16, 2021.
    - There are 150,346 records in total, which will be filtered to only restaraunts resulting [20,019] records. 

ERD diagram


## Questions we hope to answer with the data 
- What are the most important attributes that make a restaurant more or less successful (how are they correlated with its rating)?
- Can we predict a restaurant's rating based on its current or potential attributes?
    - Attributes such as 
- Are there any significant differences across regions?


-----------------------------------------------------------------------------------------
## Database 
As a part of this project, we will develop a database in PostgreSQL. The database consits of two tables:
- Business information
- Ratings
- Attributes 
-----------------------------------------------------------------------------------------
## Machine Learning Model 
We are going to use a predictive **Supervized Machine Learning** model by classifying the target variable of ratings. 
Success is measured through ratings (from 0 to 5 stars) in the following manner:
- 4 to 5 - successful
- 3 to 3.9 - good
- 2 to 2.9 - average
- 0 to 1.9 - poor


[ERD] table
#### Data Processing 
- Check for data types
- Duplicates and null values


#### Feature Selection 

#### Splitting Data into Training and Testing: 

-----------------------------------------------------------------------------------------

## Dashboard
We will use Tableu to create and host our dashboard, which will be connected to our Postgres database

-------------

## Project Results



________
## Areas for Future Analysis



______
## Areas for Improvement 



