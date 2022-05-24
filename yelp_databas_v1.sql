-- yelp_databas_v1.sql
CREATE TABLE Business (
    Restaurant_ID VARCHAR (100) NOT NULL,
    Restaurants_Name VARCHAR (100) NOT NULL,
    Address VARCHAR (300) NOT NULL,
    City VARCHAR (100) NOT NULL,
    States VARCHAR (100) NOT NULL,
    Postal_Code INT NOT NULL,
    Latitude DECIMAL (8,6) NOT NULL,
    Longitude DECIMAL (9,6) NOT NULL,
    Stars_Rating FLOAT NOT NULL,
    Review_Count INT NOT NULL,
    Restaurants_Delivery BOOL NOT NULL,
    Outdoor_Seating BOOL NOT NULL,
    Accepts_CreditCards BOOL NOT NULL,
    Price_Range VARCHAR NOT NULL,
    Alcohol BOOL NOT NULL,
    Good_For_Kids BOOL NOT NULL,
    Reservations BOOL NOT NULL,
    Restaurants_TakeOut BOOL NOT NULL,
    WiFi BOOL NOT NULL,
    Good_For_Groups BOOL NOT NULL,
    Wheelchair_Accessible BOOL NOT NULL,
    Happy_Hour BOOL NOT NULL,
    Noise_Level VARCHAR NOT NULL,
    Dietary_Restrictions BOOL NOT NULL,
    CONSTRAINT pk_Business PRIMARY KEY (Restaurant_ID)
);
CREATE TABLE Reviews (
    Review_ID VARCHAR (100) NOT NULL,
    User_ID VARCHAR (100) NOT NULL,
    Restaurant_ID VARCHAR (100) NOT NULL,
    Stars_Rating FLOAT NOT NULL,
    Review_Text VARCHAR (65535) NOT NULL,
    CONSTRAINT pk_Reviews PRIMARY KEY (Review_ID)
);
CREATE TABLE Users (
    User_ID VARCHAR (100) NOT NULL,
    User_Name VARCHAR (100) NOT NULL,
    Review_Count INT NOT NULL,
    Yelping_Since VARCHAR NOT NULL,
    Average_Stars FLOAT NOT NULL,
    CONSTRAINT pk_User PRIMARY KEY (User_ID)
);
CREATE TABLE Census_Income (
    Postal_Code INT NOT NULL,
    Total_Estimate_Households_per_Zip FLOAT NOT NULL,
    Total_Estimate_Married_couple_Family_households FLOAT NOT NULL,
    Total_Estimate_Nonfamily_households FLOAT NOT NULL,
    Median_Income_dollars FLOAT NOT NULL,
    Mean_Income_dollars FLOAT NOT NULL,
    CONSTRAINT pk_Census_Income PRIMARY KEY (Postal_Code)
);
CREATE TABLE Census_Population (
    Postal_Code INT NOT NULL,
    Population INT NOT NULL,
    CONSTRAINT pk_Census_Population PRIMARY KEY (Postal_Code)
);
ALTER TABLE Business ADD CONSTRAINT fk_Business_Postal_Code FOREIGN KEY(Postal_Code)
REFERENCES Census_Income (Postal_Code);
ALTER TABLE Reviews ADD CONSTRAINT fk_Reviews_User_ID FOREIGN KEY(User_ID)
REFERENCES Users (User_ID);
ALTER TABLE Reviews ADD CONSTRAINT fk_Reviews_Restaurant_ID FOREIGN KEY(Restaurant_ID)
REFERENCES Business (Restaurant_ID);
ALTER TABLE Census_Population ADD CONSTRAINT fk_Census_Population_Postal_Code FOREIGN KEY(Postal_Code)
REFERENCES Census_Income (Postal_Code);
