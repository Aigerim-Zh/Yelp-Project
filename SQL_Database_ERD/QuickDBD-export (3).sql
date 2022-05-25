-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Business" (
    "Restaurant_ID" varchar   NOT NULL,
    "Restaurants_Name" varchar   NOT NULL,
    "Address" varchar   NOT NULL,
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Postal_Code" int   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longitude" float   NOT NULL,
    "Stars_Rating" float   NOT NULL,
    "Review_Count" int   NOT NULL,
    "Restaurants_Delivery" bool   NOT NULL,
    "Outdoor_Seating" bool   NOT NULL,
    "Accepts_CreditCards" bool   NOT NULL,
    "Price_Range" varchar   NOT NULL,
    "Alcohol" bool   NOT NULL,
    "Good_For_Kids" bool   NOT NULL,
    "Reservations" bool   NOT NULL,
    "Restaurants_TakeOut" bool   NOT NULL,
    "WiFi" bool   NOT NULL,
    "Good_For_Groups" bool   NOT NULL,
    "Wheelchair_Accessible" bool   NOT NULL,
    "Happy_Hour" bool   NOT NULL,
    "Noise_Level" varchar   NOT NULL,
    "Dietary_Restrictions" bool   NOT NULL,
    CONSTRAINT "pk_Business" PRIMARY KEY (
        "Restaurant_ID"
     )
);

CREATE TABLE "Reviews" (
    "Review_ID" varchar   NOT NULL,
    "User_ID" varchar   NOT NULL,
    "Restaurant_ID" varchar   NOT NULL,
    "Stars_Rating" int   NOT NULL,
    "Review_Text" varchar   NOT NULL,
    CONSTRAINT "pk_Reviews" PRIMARY KEY (
        "Review_ID"
     )
);

CREATE TABLE "User" (
    "User_ID" varchar   NOT NULL,
    "User_Name" varchar   NOT NULL,
    "Review_Count" int   NOT NULL,
    "Yelping_Since" varchar   NOT NULL,
    "Average_Stars" float   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "User_ID"
     )
);

CREATE TABLE "Census_Income" (
    "Postal_Code" int   NOT NULL,
    "Total_Estimate_Households_per_Zip" int   NOT NULL,
    "Total_Estimate_Married-couple_Family_households" int   NOT NULL,
    "Total_Estimate_Nonfamily_households" int   NOT NULL,
    "Median_Income(dollars)" int   NOT NULL,
    "Mean_Income(dollars)" int   NOT NULL,
    CONSTRAINT "pk_Census_Income" PRIMARY KEY (
        "Postal_Code"
     )
);

CREATE TABLE "Census_Population" (
    "Postal_Code" int   NOT NULL,
    "Population" int   NOT NULL,
    CONSTRAINT "pk_Census_Population" PRIMARY KEY (
        "Postal_Code"
     )
);

ALTER TABLE "Business" ADD CONSTRAINT "fk_Business_Postal_Code" FOREIGN KEY("Postal_Code")
REFERENCES "Census_Income" ("Postal_Code");

ALTER TABLE "Reviews" ADD CONSTRAINT "fk_Reviews_User_ID" FOREIGN KEY("User_ID")
REFERENCES "User" ("User_ID");

ALTER TABLE "Reviews" ADD CONSTRAINT "fk_Reviews_Restaurant_ID" FOREIGN KEY("Restaurant_ID")
REFERENCES "Business" ("Restaurant_ID");

ALTER TABLE "Census_Population" ADD CONSTRAINT "fk_Census_Population_Postal_Code" FOREIGN KEY("Postal_Code")
REFERENCES "Census_Income" ("Postal_Code");

