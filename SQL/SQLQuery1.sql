CREATE DATABASE learn;

USE learn;

CREATE TABLE STU (RNO INT, NAME CHAR(5), AGE INT);

SELECT * FROM STU;

INSERT INTO STU (RNO, NAME, AGE) VALUES(1,'AJAY',12);

SELECT * FROM STU;

SELECT RNO, NAME, AGE FROM STU;

INSERT INTO STU VALUES (2,'MOHIT',13);

SELECT * FROM STU;

INSERT INTO STU (RNO, NAME) VALUES (3,'ROHIT');

INSERT INTO STU (NAME, RNO,AGE) VALUES ('RAM',4,10);

CREATE DATABASE TEST;

USE TEST;

USE learn;

SELECT * FROM STU;

SELECT * FROM STU WHERE NAME='AJAY';

--LIKE PATTERN MATCHING %- ANY NO OF CHARACTERS _- A SINGLE CHARACTER --

SELECT * FROM STU WHERE NAME LIKE 'A%';

SELECT * FROM STU WHERE NAME LIKE '%IT';   --RESULT WOULD BE MOHIT, ROHIT

SELECT * FROM STU WHERE NAME LIKE '%M';

SELECT * FROM STU WHERE NAME LIKE '%A%';

SELECT TOP 3* FROM STU;

USE LEARN;

SELECT * FROM STU;

UPDATE STU SET AGE =15 WHERE RNO =3;

DELETE FROM STU WHERE RNO=4;

DELETE FROM STU;  --IT WILL REMOVE THE RECORDS ONLY

DELETE STU;  --SAME AS ABOVE

SELECT * FROM STU;

ALTER TABLE STU ADD CLASS CHAR(5);

UPDATE STU SET CLASS ='7TH';

ALTER TABLE STU DROP COLUMN CLASS;   --IT WILL REMOVE IT FROM STRUCTURE ITSELF

INSERT INTO STU VALUES(5,'ABHINAV',12);  --NOT ABLE TO ENTER CAUSE OF CHAR(5) DATATYPE PARAMETER

ALTER TABLE STU ALTER COLUMN NAME CHAR(10);

-- DROP TABLE STU;  -- UNABLE TO DROP CAUSE IT IS IN USE (DONT DROP NOW)
-- DROP DATABASE learn;
-- TRUNCATE TABLE STU;

SELECT * FROM STU;

SELECT 5%2;

USE learn;

SELECT * FROM STU WHERE NAME <> 'RAM';		/* NOT EQUAL*/

SELECT * FROM STU WHERE NAME!='AJAY';

SELECT * FROM STU WHERE NOT NAME='ROHIT';

SELECT * FROM STU WHERE NAME='MOHIT' OR RNO=1;

SELECT * FROM STU WHERE NAME LIKE '%IT' AND AGE='11';

--BETWEEN RANGE

SELECT * FROM STU;

ALTER TABLE STU ADD SALARY INT;

UPDATE STU SET SALARY=10000 WHERE RNO=1;

UPDATE STU SET SALARY=20000 WHERE RNO=2;

UPDATE STU SET SALARY=30000 WHERE RNO=3;

UPDATE STU SET SALARY=40000 WHERE RNO=4;

SELECT * FROM STU WHERE SALARY BETWEEN 10000 AND 30000;

SELECT * FROM STU WHERE SALARY <=30000 AND SALARY>=20000;

--IN LIST

SELECT * FROM STU WHERE NAME='AJAY' OR RNO=2 OR AGE=15;

SELECT * FROM STU WHERE NAME IN ('AJAY','MOHIT','ROHIT');

--LIKE PATTERN MATCHING

SELECT * FROM STU WHERE SALARY IS NULL;

--DISTINCT -UNIQUE VALUES OF A FIELD

SELECT DISTINCT NAME FROM STU;

SELECT DISTINCT SALARY FROM STU;

SELECT * FROM STU;

