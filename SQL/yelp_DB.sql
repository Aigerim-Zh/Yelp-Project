-- Creating tables for Yelp_data
CREATE TABLE Business (
     Business_ID VARCHAR(100) NOT NULL,
     Business_Name VARCHAR(100) NOT NULL,
	 City VARCHAR (100) NOT NULL,
	 States VARCHAR (100) NOT NULL,
	 Postal_Code INT NOT NULL, 
	 Latitude DECIMAL (8,6) NOT NULL,
	 Longitude DECIMAL (9,6) NOT NULL,
	 Star_Rating FLOAT NOT NULL,
	 Review_Count INT NOT NULL,
	 Delivery BOOL NOT NULL,
	 Takeout BOOL NOT NULL,
	 Outdoor_Dining BOOL NOT NULL,
	 Vegetarian_Options BOOL NOT NULL,
	 Free_WiFi BOOL NOT NULL,
	 PRIMARY KEY (Business_ID)
 );
 
CREATE TABLE Reviews (
	Review_ID VARCHAR (100) NOT NULL,
	User_ID VARCHAR (100) NOT NULL, 
	Business_ID VARCHAR (100) NOT NULL,
	Star_Rating FLOAT NOT NULL,
	Review_Text VARCHAR (65535) NOT NULL,
	PRIMARY KEY (Review_ID),
	FOREIGN KEY (Business_ID) REFERENCES Business (Business_ID),
	UNIQUE (User_ID)
);
 
CREATE TABLE Users (
	User_ID VARCHAR (100) NOT NULL,
	User_Name varchar (100) NOT NULL,
	Review_Count INT NOT NULL,
	Yelping_Since DATE NOT NULL,
	Average_Stars FLOAT NOT NULL,
	PRIMARY KEY (User_ID),
	FOREIGN KEY (User_ID) REFERENCES Reviews (User_ID)
);