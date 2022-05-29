CREATE TABLE Business (
    Restaurant_ID varchar (300) NOT NULL,
    Restaurants_Name varchar (300) NOT NULL,
    Address varchar (300) NOT NULL,
    City varchar (100) NOT NULL,
    States varchar (100)  NOT NULL,
    Postal_Code varchar (100) NOT NULL,
    Latitude DECIMAL (8,6) NOT NULL,
    Longitude DECIMAL (9,6) NOT NULL,
    Stars_Rating FLOAT NOT NULL,
    Review_Count int   NOT NULL,
    Restaurants_Delivery bool   NOT NULL,
    Outdoor_Seating bool   NOT NULL,
    Accepts_CreditCards bool   NOT NULL,
    Price_Range varchar   NOT NULL,
    Alcohol bool   NOT NULL,
    Good_For_Kids bool   NOT NULL,
    Reservations bool   NOT NULL,
    Restaurants_TakeOut bool   NOT NULL,
    WiFi bool   NOT NULL,
    Good_For_Groups bool   NOT NULL,
    Wheelchair_Accessible bool   NOT NULL,
    Happy_Hour bool   NOT NULL,
    Noise_Level varchar   NOT NULL,
    Dietary_Restrictions bool   NOT NULL,
    PRIMARY KEY (Restaurant_ID)
);

CREATE TABLE Reviews (
    Review_ID VARCHAR (100) NOT NULL,
    User_ID VARCHAR (100) NOT NULL,
    Restaurant_ID VARCHAR (100) NOT NULL,
    Stars_Rating FLOAT NOT NULL,
    Review_Text VARCHAR (65535) NOT NULL,
    PRIMARY KEY (Review_ID)
);

CREATE TABLE Users (
    User_ID VARCHAR (100) NOT NULL,
    User_Name VARCHAR (100) NOT NULL,
    Review_Count INT NOT NULL,
    Yelping_Since VARCHAR NOT NULL,
    Average_Stars FLOAT NOT NULL,
    PRIMARY KEY (User_ID)
);

CREATE TABLE Census_Data (
    Postal_Code VARCHAR (100) NOT NULL,
    Total_Estimate_Households_per_Zip FLOAT NOT NULL,
    Total_Estimate_Married_couple_Family_households FLOAT NOT NULL,
    Total_Estimate_Nonfamily_households FLOAT NOT NULL,
    Median_Income_dollars FLOAT NOT NULL,
    Mean_Income_dollars FLOAT NOT NULL,
    PRIMARY KEY (Postal_Code)
);


	SELECT
		Business.Postal_Code,
		Restaurant_ID,
		Restaurants_Name,
		Address,
		City,
		States,
		Latitude,
		Longitude,
		Stars_Rating,
		Review_Count,
		Restaurants_Delivery,
		Outdoor_Seating,
		Accepts_CreditCards,
		Price_Range,
		Alcohol,
		Good_For_Kids,
		Reservations,
		Restaurants_TakeOut,
		WiFi,
		Good_For_Groups,
		Wheelchair_Accessible,
		Happy_Hour,
		Noise_Level,
		Dietary_Restrictions,
		Total_Estimate_Households_per_Zip,
		Total_Estimate_Married_couple_Family_households,
		Total_Estimate_Nonfamily_households,
		Median_Income_dollars
		
	INTO Merged_Data

	FROM Business

	INNER JOIN Census_Data
		ON Census_Data.Postal_Code=Business.Postal_Code
	ORDER BY Restaurants_Name;
	
SELECT * FROM Merged_Data;