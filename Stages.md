## Stages of Development of Final Machine Learning Model



In **Stages 1 to 3**, we used Yelp data's ratings and put them into **four classes**:

* 4.1 to 5 - Successful
* 3.1 to 4 - Good
* 2.1 to 3 - Average
* 1 to 2 - Poor



### Stage 1. Four Classes with Ten Attributes

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



### Stage 3. Four Classes with Fifteen Attributes and Census Data

We also wanted to test the data while controlling for socio-economic factors such as income and population. We extracted the Census data from [here](CSV_files/Census_Data.csv). 

We selected the Median Income instead of the Mean Income as per the [feature selection](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/Machine_Learning_Models/Feature_Selection.ipynb), in which the Median Income had a higher correlation with Stars Ratings. Moreover, as per the feature importance rank as part of all Random Forests models, the Median Income had a higher importance score. 

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

Since the strongest model, the Easy Ensemble AdaBoost Classifier, had some improvement, we will continue including the Census data in the next steps.  



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

As we can see, the prediction rates in all models are more balanced out, which makes the overall accuracy more representative. **The strongest model remains the Easy Ensemble AdaBoost Classifier**. 

As we achieved the highest and most unbiased accuracy rate in this step, we wanted to test an additional feature of "State", which might control for some structural differences across regions. 

Adding the State feature slightly improved the performance of **the strongest model to 66.85%**. 




### Scaling with a StandardScaler()

![](https://github.com/Aigerim-Zh/Yelp-Project/blob/Aigerim/ML_Results/Images/04_Theshold_3.5_Stnd_Scaler.png)

We tried scaling data using a StandardScaler(). As expected, the results almost stayed the same as the models are not sensitive to scaling.

