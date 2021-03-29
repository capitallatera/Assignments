CREATE DATABASE INVENTORY;

USE INVENTORY;


CREATE TABLE CUST 
(CID CHAR(5) PRIMARY KEY,
CNAME VARCHAR(20) NOT NULL,
ADDRES VARCHAR(30) NOT NULL,
CITY VARCHAR(20) NOT NULL,
PHONE VARCHAR(10) NOT NULL,
EMAIL VARCHAR(30) NOT NULL,
DOB DATE CHECK (DOB<'01-JAN-1995')
);

CREATE TABLE PRODUCT
(PID CHAR(5) PRIMARY KEY,
PDESC VARCHAR(20) NOT NULL,
PRICE INT CHECK(PRICE>0),
CATEGORY VARCHAR(20) CHECK ( CATEGORY IN ('IT','HA','COVID-19')),
SID CHAR(5)  REFERENCES SUPPLIER(SID)   --SUPPLIER SID SHOULD BE PRIMARY OTHER WISE IT WILL NOT WORK
);

--DROP TABLE CUST;

CREATE TABLE SUPPLIER (
SID CHAR(5) PRIMARY KEY,   
SNAME VARCHAR(20) NOT NULL,
SADD VARCHAR(20) NOT NULL,
SCITY VARCHAR(20) CHECK(SCITY='DELHI'),
SPHONE VARCHAR(10) UNIQUE,
EMAIL VARCHAR(30)
);

CREATE TABLE ORDERS(
OID CHAR(5) PRIMARY KEY,   --SHOULD BE PRIMARY KEY
ODATE DATE,
CID CHAR(5) REFERENCES CUST(CID),
PID CHAR(5) REFERENCES PRODUCT(PID),
OQTY INT CHECK(OQTY>=1)
);


--INSERT RECOREDS HERE


CREATE TABLE STOCK(
PID CHAR(5) REFERENCES PRODUCT(PID),
SQTY INT CHECK(SQTY>0),
ROL INT CHECK(ROL>0),
MOQ INT CHECK(MOQ>=5)
);














































