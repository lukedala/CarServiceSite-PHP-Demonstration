CREATE TABLE IF NOT EXISTS CUSTOMER (
	CUST_ID INT(10),
	CUST_FNAME VARCHAR(20),
	CUST_LNAME VARCHAR(30),
	CUST_ADDRESS VARCHAR(30),
	CUST_CITY VARCHAR(20),
	CUST_STATE VARCHAR(2),
	CUST_ZIP INT (5),
	CUST_EMAIL VARCHAR(30),
	CUST_PASSWORD VARCHAR(10),
	PRIMARY KEY (CUST_ID)
);

CREATE TABLE IF NOT EXISTS VEHICLE (
	VEH_ID INT(6),
	VEH_MAKE VARCHAR(20),
	VEH_MODEL VARCHAR(20),
	VEH_YEAR INT(4),
	PRIMARY KEY (VEH_ID)
);

CREATE TABLE IF NOT EXISTS CAR (
	CAR_VIN VARCHAR(17),
	CUST_ID INT(10),
	VEH_ID INT(6),
	PRIMARY KEY (CAR_VIN),
	FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID),
	FOREIGN KEY (VEH_ID) REFERENCES VEHICLE(VEH_ID)
);

CREATE TABLE IF NOT EXISTS SERVICE_TYPE (
	SERV_ID INT (6),
	SERV_DESCRIPTION VARCHAR(20),
	SERV_COST DECIMAL(10),
	PRIMARY KEY (SERV_ID)
);

CREATE TABLE IF NOT EXISTS RECOMMENDED_SERVICE (
	REC_ID INT(5),
	VEH_ID INT(6),
	SERV_ID INT (6),
	PRIMARY KEY (REC_ID),
	FOREIGN KEY (SERV_ID) REFERENCES SERVICE_TYPE(SERV_ID),
	FOREIGN KEY (VEH_ID) REFERENCES VEHICLE(VEH_ID)
);

CREATE TABLE IF NOT EXISTS TECHNICIAN (
	TECH_ID INT(10),
	TECH_FNAME VARCHAR(20),
	TECH_LNAME VARCHAR(30),
	PRIMARY KEY (TECH_ID)
);

CREATE TABLE IF NOT EXISTS SCHEDULE (
	START_TIME DATETIME,
	TECH_ID INT(10),
	AVAILABLE BOOLEAN,
	PRIMARY KEY (START_TIME),
	FOREIGN KEY (TECH_ID) REFERENCES TECHNICIAN(TECH_ID)
);

CREATE TABLE IF NOT EXISTS APPOINTMENT (
	APT_ID INT(10),
	SERV_ID INT (6),
	TECH_ID INT(10),
	CAR_VIN VARCHAR(17),
	PRIMARY KEY (APT_ID),
	FOREIGN KEY (SERV_ID) REFERENCES SERVICE_TYPE(SERV_ID),
	FOREIGN KEY (TECH_ID) REFERENCES TECHNICIAN(TECH_ID),
	FOREIGN KEY (CAR_VIN) REFERENCES CAR(CAR_VIN)
);

