# Yelp-Project

# Restaurant Performance Prediction

# Project Abstract
The purpose of this project is to test a series of Machine Learning models to predict a restaurant's success. We assume that the model with the strongest performance will be beneficial for restaurant businesses. 

We gathered data from **Yelp** on the top restaurant attributes associated with higher or lower ratings. Based on all possible combinations of these attributes and additional features, the models will make rating predictions. 

We measured success through **ratings** (from 1 to 5 stars) and classified restaurants into appropriate classes. 
First, we classified the ratings into four classes: poor, average, good, and successful. However, we obtained better performance with two classes only: lower- and higher-performing restaurants. We started with 10 features and added 5 more restaurant features, which increased the accuracy. The models controlling for socio-economic factors such as income and population tend to perform slightly better. Finally, adding the State feature also slightly improved the model indicating small structural differences across examined regions. 

Having balanced data gave more equal prediction rates across classes and, therefore, the most unbiased overall accuracy. **The Easy Ensemble AdaBoost Classifier** model predicting 2 classes yielded the highest and most unbiased accuracy of **66.85%** while including all 15 restaurant features, Census income and population data, and region control. 

A series of due diligence tests lead us to over a 20% increase in the accuracy rate of the strongest model. 

---------------------------------------------------------------------------------------

# Motivation Behind the Topic
The restaurant industry took a big hit from the recent pandemic. Now, more than ever, restaurant owners can greatly benefit from the insights presented by what consumers currently value the most in the food industry. By accessing data on the top-rated attributes, restaurant owners and investors can learn how to best appeal to the public in these ever-changing times. 

The predicting model developed in this project can be applied to other regions and can also be used by various stakeholders.

---------------------------------------------------------------------------------------

# Team Members & Communication Protocols

## Our Team

In this group project, responsibilities were shared equally among all team members. Each team member participated in generating content for the various areas of the project. 

This is a layout of responsibilities per area that each member oversees:

| Member                                               | Responsibilities                                             |
| ---------------------------------------------------- | ------------------------------------------------------------ |
| [Aigerim Zhanibekova](https://github.com/Aigerim-Zh) | Machine Learning; Manage the GitHub repository; ERD diagram and SQL schema; README write-up|
| [Ana Bisker](https://github.com/anaorenstein)       |  Data Cleaning and Merging; Machine Learning; README write-up; General Project Manager          |
| [Hristo Bustamante](https://github.com/hbustamante8) | SQL Database Creation; Data Cleaning and Merging; Machine Learning; README write-up        |
| [Leila Corvera Fontela](https://github.com/leilacf)  | SQL Database Creation; Data Cleaning and Merging; README write-up |
| [Ngoc Chau](https://github.com/Ngoclchau)            | Data Cleaning and Merging; Data Extraction; Data Transforming; README write-up            |

## Communications

- Team members have allocated a regular slot for weekly meetings over Zoom in addition to the bi-weekly meetings that are had during class. 

- We created a shared Google Drive that contains:
  - Useful Links - Zoom, Project GitHub, Dataset Guide, Project Rubrics
  - Miscellaneous Brainstorming

- Direct Messaging:
  - SMS group messages
  - Slack group

---------------------------------------------------------------------------------------

# Data Source
The data used in this project is [Yelp's businesses, reviews, and users subset data](https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset?datasetId=10100&language=Python&outputs=null) extracted from Kaggle.

- The original raw data contains business information across 8 metropolitan areas in the USA and Canada. For this project, we will focus on the USA and 13 states.

- The data was last updated on February 16, 2021.

- There are 150,346 records in total, which will be filtered to only restaurants. 

---------------------------------------------------------------------------------------

# Questions We Hope to Answer 
- What attributes are the most important in making a restaurant more or less successful?
- How are the combination of attributes correlated with a restaurant's rating?
- Can we predict a restaurant's rating based on its current or potential attributes? Examples of Attributes:
    - Delivery 
    - Takeout
    - Outdoor Dining
    - Vegetarian Options
    - Free Wi-Fi
- Are there any significant differences across regions?

---------------------------------------------------------------------------------------

# Database
As part of this project, we will develop a database in **PostgreSQL** using **pgAdmin**. As demonstrated in the **Entity Relationship Diagram** below, the database consists of three tables:
- Business
- Reviews
- User

The Business table has a one-to-many connection to the Reviews table through the Business_ID column.

The User table has a one-to-many connection to the Reviews table through the User_ID. 

The ERD specifies a data type for each column:

![image](https://github.com/Aigerim-Zh/Yelp-Project/blob/main/ERD%20Table.png)

## Segment One

For **Segment 1** of this project, we used synthetic datasets generated through [generatedata.com](https://generatedata.com/generator). 
These are our custom-tailored synthetic datasets:

- [Business.csv](business.csv)
- [Reviews.csv](reviews.csv)
- [User.csv](user.csv)

---------------------------------------------------------------------------------------
# Data Processing 
Since our data come in JSON format, it will require significant cleaning. 

We expect the following data cleaning tasks:

- All categorical and text variables will be converted into numerical data.
- Filtering the data for restaurants. 
- Checking for data types, duplicates, and null values. 
- In the Business JSON dataset, all attributes of interest are in one column. Each attribute needs to be extracted in a separate column.
- Renaming and reordering columns in a readable format. 
- Finally, all JSON files will be converted to Pandas DataFrames and then to CSV files.

---------------------------------------------------------------------------------------
# Machine Learning

In this section, we will describe our progress in Machine Learning model implementation. 

----

## Multiple Linear Regression

First, we started with a multiple regression model with a continuous target variable of star ratings. 

The code can be found here: 

[Linear Regression]()

The R^2 of this model is [X]. After inspecting the data more closely, we found that the target variable of Stars Ratings follows a discrete distribution with only 9 unique values. 

---

## Classification Models
Based on the results from the Linear Regression Model, we moved to classification models with a categorical target variable. 

All the code for classification models is saved [here](https://github.com/Aigerim-Zh/Yelp-Project/tree/Aigerim/Machine_Learning_Models).

We will compare each model based on its overall accuracy score and an F-1 score for each class, a harmonic mean of precision, and recall rates. The F-1 score metric will be used since neither precision nor recall has higher importance, given the topic question.

Below are the four main stages in our machine learning development process. In each stage, we tested the following models:
- **MultiClass Classification Logistic Regression** 
- **Balanced Random Forest** 
- **Easy Ensemble AdaBoost Classifier**

In Stages 1 to 3, we used Yelp data's ratings and put them into four classes:
* 4.1 to 5 - Successful
* 3.1 to 4 - Good
* 2.1 to 3 - Average
* 1 to 2 - Poor

---
### Stage 1. Four Classes with Ten Attributes.

In Stage 1, we included 10 restaurant attributes recorded by Yelp:

```
X = business_df[['Review_Count', 'Restaurants_Delivery', 'Outdoor_Seating',
       'Restaurants_TakeOut', 'WiFi', 'Restaurants_Reservations',
       'Good_For_Groups', 'Wheelchair_Accessible', 'Happy_Hour',
       'Dietary_Restrictions']]
```
The dataset has 49,857 observations. 

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/01_ML_Results.png)


Based on the results above, we can see that the **MultiClass Classification Logistic Regression** is biased toward the majority classes. That is why we tried the following resampling techniques:
- **Naive Random Oversampling**. Instances of the minority class are randomly selected and added to the training set until the majority and minority classes are balanced.
- **SMOTE Oversampling**. New instances are interpolated. That is, for an instance from the minority class, new values are generated based on its distance from its neighbors.
- **Cluster Centroids Undersamplig**. Akin to SMOTE, the algorithm identifies clusters of the majority class, then generates synthetic data points, called centroids, that are representative of the clusters. The majority class is then undersampled down to the size of the minority class. 
- **SMOTEEN, Combination of Over- and Under-Sampling** combines the SMOTE and Edited Nearest Neighbors (ENN) algorithms. It includes the following steps: 
1. Oversample the minority class with SMOTE.
2. Clean the resulting data with an undersampling strategy. If the two of the nearest neighbors of a data point belong to different classes, the data point is dropped.

The results with resampling techniques show an unbiased accuracy rate for both testing and training sets and an F-1 score showing a more equal prediction success distribution. 

The **Naive Random Oversampling** technique for the **MultiClass Logistic Regression** model produced the highest unbiased testing accuracy rate (43.32%) with no overfitting. Moreover, the prediction rate for each class is not very different.

The **Easy Ensemble AdaBoost Classifier** produced the second-highest accuracy rate and predicted each class at a more equal rate than the Logistic Regression, however, the prediction rate for the "Good" class is quite higher than for other classes. The **Balanced Random Forest** model produced overfitting results with the training accuracy above the testing one. 

--

### Stage 2. Four Classes with Fifteen Attributes
To further improve the accuracy, we added 5 more restaurant attributes. 

The list of features looks as follows:

```
X = business_df.['Review_Count', 'Restaurants_Delivery', 'Outdoor_Seating',
       'Accepts_CreditCards', 'Price_Range', 'Alcohol', 'Good_For_Kids',
       'Reservations', 'Restaurants_TakeOut', 'WiFi', 'Good_For_Groups',
       'Wheelchair_Accessible', 'Happy_Hour', 'Noise_Level',
       'Dietary_Restrictions''])
```
The number of observations was reduced to 27,207.

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/02_ML_Results.png)

The results above show that adding these additional attributes increased the accuracy in all models. This time, the **Easy Ensemble AdaBoost Model** performed slightly better than the **Naive Random Oversampling**.

--

### Stage 3. Four Classes with Fifteen Attributes and Census Data
We also wanted to test the data while controlling for socio-economic factors such as income and population. We extracted the Census data from [here](). 

We selected the Median Income instead of the Mean Income as per the [feature selection](), in which the Median Income had a higher correlation with Stars Ratings. Moreover, as per the feature importance rank as part of all Random Forests models, the Median Income had a higher importance score. 

Now, the set of features looks as follows:

```
X = business_df[['Review_Count', 'Restaurants_Delivery', 'Outdoor_Seating',
       'Accepts_CreditCards', 'Price_Range', 'Alcohol', 'Good_For_Kids',
       'Reservations', 'Restaurants_TakeOut', 'WiFi', 'Good_For_Groups',
       'Wheelchair_Accessible', 'Happy_Hour', 'Noise_Level',
       'Dietary_Restrictions',
         'Total_Estimate_Married-couple_Family_households',
       'Total_Estimate_Nonfamily_households',
                'Median_Income(dollars)', 
                'Total_Estimate_Households_per_Zip']]

```

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/03_ML_Results.png)

Adding the Census data decreased the number of observations to 24,739. As it can be seen, the accuracy rate dropped for all Logistic Regression models. However, **the accuracy only slightly improved** for the Balanced Random Forests and Easy Ensemble AdaBoost Classifier models. 

Since the strongest model, the Easy Ensemble AdaBoost Classifier had some improvement, we will continue including the Census data in the next steps.  

--

### Stage 4. Two Classes with Fifteen Attributes and Census Data 

As a next step, we tried categorizing the target variable into two classes: lower- and higher-performing restaurants. It might be more compelling for restaurants to know if they belong to one of these two categories rather than one of the four previous categories.

#### Threshold of 3
We first started with a threshold of 3:
- 1 to 2.9 - Lower Performance
- 3 to 5 - Higher Performance

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/04_Theshold_3_ML_Results.png)

Reducing the number of classes significantly improved accuracy in all cases. However, as we can see, the two classes are unbalanced with the majority falling into the high-performance category. That is why we run the Logistic Regression model with resampling techniques to balance out the classes and their prediction rates. 

The prediction rates in all last two models seem to be biased toward the majority class.

#### Threshold of 3.5 With and Without State

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/04_Threshold_3.5_with_without_State.png)

As a next step, we increased the threshold to 3.5:
- 1 to 3.4 - Lower Performance
- 3.5 to 5 - Higher Performance

Increasing the threshold made classes much more balanced. That is why the Logistic Regression model without resampling techniques was used. 

As we can see, the prediction rates in all models are more balanced out, which makes the overall accuracy more representative. The strongest model remains the Easy Ensemble AdaBoost Classifier. 

As we achieved the highest and most unbiased accuracy rate in this step, we wanted to test an additional feature of "State", which might control for some structural differences across regions. 

Adding the State feature slightly improved the performance of **the strongest model to 66.85%**. 

##### Scaling with a StandardScaler()

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/04_Theshold_3.5_Stnd_Scaler.png)

As the last step, we tried scaling data using a StandardScaler(). As expected, the results almost stayed the same as the models are not sensitive to scaling.

--
# Feature Importance Based on the Strongest Model
![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/Machine_Learning_Models/Feature_Imporance.png)

Although the Balanced Random Forest produced overfitting results in the majority of settings, its feature importance calculator is useful. In the chart above, all features are ranked according to their importance. Although we tried removing less important features, the accuracy score dropped slightly, i.e., all less important features collectively make a meaningful contribution to the model.

In the next section, the actual relation of each feature to the restaurant's classification will be examined.
-----------------------------------------------------------------------------------------
### Dashboard
We will use **Tableau** to create and host our dashboard, which will be connected to our **Postgres** database. 

(We may also create an interactive Javascript interface to demonstrate our model.)

-----------------------------------------------------------------------------------------

### Project Results 

Google Slides

Live Presentation

[TBD]

-----------------------------------------------------------------------------------------

### Areas for Future Analysis

[TBD]

-----------------------------------------------------------------------------------------

### Areas for Improvement 

[TBD]