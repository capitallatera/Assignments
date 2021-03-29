--JOIN, INDEX, VIEW, CLUSTER INDEX, UNION, INTERSECT

USE LEARN;

SELECT * FROM EMP_1;
SELECT * FROM EMP_SAL;

SELECT EMP_1.EID, NAME, DOB,DEPT, DESI,SALARY 
FROM EMP_1
INNER JOIN EMP_SAL
ON EMP_1.EID=EMP_SAL.EID;

SELECT * FROM CJ1;

INSERT INTO CJ1 VALUES(1,'KAPIL');
INSERT INTO CJ1 VALUES(2,'ROHAN');
INSERT INTO CJ1 VALUES(3,'RAJAT');
INSERT INTO CJ1 VALUES(4,'AMIT');
INSERT INTO CJ1 VALUES(5,'MOHIT');

SELECT * FROM CJ1;
SELECT * FROM CJ2;

ALTER TABLE CJ2 DROP COLUMN NAME;

ALTER TABLE CJ2 ADD MARKS INT;

TRUNCATE TABLE CJ2;  --- ONLY REMOVE THE RECORDS

INSERT INTO CJ2 VALUES(1,90);
INSERT INTO CJ2 VALUES(2,95);
INSERT INTO CJ2 VALUES(3,80);
INSERT INTO CJ2 VALUES(3,79);
INSERT INTO CJ2 VALUES(11,94);


SELECT CJ1.RNO , NAME, MARKS FROM CJ1
CROSS JOIN CJ2;  --NO NEED FOR  COMMON  COLUMN


CREATE TABLE A1 (VAL CHAR(1));
CREATE TABLE A2 (VAL INT);

INSERT INTO A1 VALUES('A');
INSERT INTO A1 VALUES('B');
INSERT INTO A1 VALUES('C');
INSERT INTO A1 VALUES('D');

INSERT INTO A2 VALUES(1);
INSERT INTO A2 VALUES(2);
INSERT INTO A2 VALUES(3);

DROP TABLE A1;
DROP TABLE A2;

SELECT * FROM A1;
SELECT * FROM A2;

SELECT A1.VAL, A2.VAL FROM A1
CROSS JOIN A2;

SELECT CJ1.RNO, NAME, MARKS FROM CJ1
CROSS JOIN CJ2;

SELECT CJ1.RNO , NAME, MARKS FROM CJ1
CROSS JOIN CJ2
WHERE CJ1.RNO=CJ2.RNO;   --CROSS JOIN +  WHERE =INNER JOIN

CREATE TABLE SJ (ID INT,NAME CHAR(2), BOSSID INT);
INSERT INTO SJ(ID,NAME) VALUES(1,'A');
INSERT INTO SJ VALUES(2,'B',1);
INSERT INTO SJ VALUES(3,'C',1);
INSERT INTO SJ VALUES(4,'D',2);
INSERT INTO SJ VALUES(5,'E',3);
INSERT INTO SJ VALUES(6,'G',3);
INSERT INTO SJ VALUES(7,'G',6);

CREATE TABLE BOSS(BID INT, NAME CHAR(2));
INSERT INTO BOSS VALUES(1,'A');
INSERT INTO BOSS VALUES(2,'B');
INSERT INTO BOSS VALUES(3,'C');
INSERT INTO BOSS VALUES(6,'F');

SELECT * FROM SJ;
SELECT * FROM BOSS;

SELECT SJ.ID, SJ.NAME,SJ.BOSSID,BOSS.NAME FROM SJ
INNER JOIN BOSS
ON SJ.BOSSID=BOSS.BID;

SELECT SJ.ID,SJ.NAME,SJ.BOSSID,BOSS.NAME FROM SJ
CROSS JOIN BOSS
WHERE BOSS.BID=SJ.BOSSID;



SELECT SJ.ID, SJ.NAME AS 'EMP NAME',BOSS.NAME AS 'BOSS NAME' FROM SJ
LEFT JOIN BOSS
ON SJ.BOSSID=BOSS.BID;

--SELECT * FROM SJ;
-- COPY OF SINGLE TABLE 'SJ'
SELECT S1.ID, S1.NAME AS 'EMP NAME' ,S2.NAME AS 'BOSS NAME'  FROM SJ S1
LEFT JOIN SJ S2
ON S1.BOSSID=S2.ID;-- COMPARING 2 COLUMNS OF A SINGLE TABLE FOR JOIN CALLED SELF JOIN IMPORTANT

--UNION
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
LEFT JOIN CJ2
ON CJ1.RNO=CJ2.RNO
UNION 
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
RIGHT JOIN CJ2
ON CJ1.RNO=CJ2.RNO; 


--UNION ALL
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
LEFT JOIN CJ2
ON CJ1.RNO=CJ2.RNO
UNION ALL
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
RIGHT JOIN CJ2
ON CJ1.RNO=CJ2.RNO;


--INTERSECT
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
LEFT JOIN CJ2
ON CJ1.RNO=CJ2.RNO
INTERSECT
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
RIGHT JOIN CJ2
ON CJ1.RNO=CJ2.RNO;


--EXCEPT
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
LEFT JOIN CJ2
ON CJ1.RNO=CJ2.RNO
EXCEPT
SELECT CJ1.RNO , NAME, MARKS FROM CJ1
RIGHT JOIN CJ2
ON CJ1.RNO=CJ2.RNO;


SELECT EID, NAME, CITY,DOB FROM EMP_1  WHERE CITY='DELHI'; 

--INDEX

CREATE INDEX IND1_CITY ON EMP_1 (CITY);

DROP INDEX IND1_CITY;


--IMPLICIT CREATED AUTOMATICALLY   BASED ON(PRIMARY KEY, UNIQUE)      EXPLICIT  MANUALLY CREATED

CREATE TABLE TEST
(ID INT,
NAME CHAR(10),
CITY VARCHAR(20),
)

INSERT INTO TEST VALUES(1,'A','DEL');
INSERT INTO TEST VALUES(4,'B','GGN');
INSERT INTO TEST VALUES(3,'C','FBD');
INSERT INTO TEST VALUES(6,'D','DEL');
INSERT INTO TEST VALUES(2,'E','NOIDA');
INSERT INTO TEST VALUES(5,'A','GGN');

DELETE TEST;
SELECT * FROM TEST;
--NOT NULL AND PRIMARY KEY WORKS TOGETHER
ALTER TABLE TEST ALTER COLUMN ID INT NOT NULL;

ALTER TABLE TEST
ADD CONSTRAINT PKID PRIMARY KEY (ID);   -- WORKING AS IMPLICIT INDEXING
-- NOT ABLE TO CREATE CLUSTERED INDES DUE TO ALREADY EXISTENCE OF IMPLICIT INDEX
CREATE CLUSTERED INDEX INDCITY  ON TEST (CITY);

--DELETE PKID AND CREATE CLUSTER INDEX
ALTER TABLE TEST
DROP CONSTRAINT PKID;

CREATE CLUSTERED INDEX INDCITY  ON TEST (CITY);   -- WORKING AS EXPLICIT INDEXING


--VIEW
USE LEARN;
CREATE VIEW DDEMP
AS
	(SELECT * FROM EMP_1 WHERE CITY='DELHI');

SELECT * FROM DDEMP;
--
CREATE VIEW V_EMP
AS
	(SELECT EID, NAME,CITY,DOB, PHNO FROM EMP_1);

SELECT * FROM V_EMP;

CREATE VIEW V_PS
AS
	(SELECT EMP_1.EID,NAME,DOB,DEPT,DESI, SALARY AS 'BASIC' ,SALARY*.9 AS 'PF' FROM EMP_1
	INNER JOIN EMP_SAL
	ON EMP_1.EID =EMP_SAL.EID);

SELECT * FROM V_PS;










