USE LEARN;

SELECT * FROM EMP_SAL;
SELECT * FROM EMP_1;

DROP VIEW V_EMP;

CREATE VIEW V_EMP 
AS
	(SELECT * FROM EMP_1 WHERE CITY ='DELHI');


SELECT * FROM V_EMP;

INSERT INTO EMP_1 VALUES('E0006','NOBITA','DWARKA SEC 14', 'DELHI','10-NOV-1999','7240977599');

DELETE FROM EMP_1 WHERE EID='E0007';

INSERT INTO V_EMP VALUES('E0006','NOBITA','DWARKA SEC 14', 'DELHI','10-NOV-1999','7240977599');

INSERT INTO V_EMP VALUES('E0008','MANOJ','DLF PHASE 3', 'GURGAON','03-DEC-1999','7240966299');

DROP VIEW V_EMP;

CREATE VIEW V_EMP
AS
	SELECT * FROM EMP_1
	WHERE CITY='DELHI'
	WITH CHECK OPTION;

--DELETE 

--UPDATE

--

--FUNCTIONS--
SELECT COUNT(NAME) FROM EMP_1;

SELECT * FROM EMP_SAL;

SELECT MAX(SALARY) AS 'MAX', MIN(SALARY) AS 'MIN' , SUM (SALARY) AS 'TOTAL SALARY'  ,AVG(SALARY) AS 'AVG SALARY'FROM EMP_SAL;

SELECT SQRT(16);

SELECT RAND();

SELECT ASCII('A'), CHAR(65);

SELECT CONCAT('HELLO ','WORLD');

SELECT * FROM EMP_1;

SELECT EID,NAME,CONCAT(ADDR,CITY)AS "FULL ADDRESS"  FROM EMP_1;

SELECT CHARINDEX('L','WELCOME');

SELECT ADDR, CHARINDEX(' ',ADDR) FROM EMP_1;

SELECT LEFT ('WELCOME',3);

SELECT ADDR, LEFT(ADDR,CHARINDEX(' ',ADDR)) FROM EMP_1;

SELECT ADDR, RIGHT(ADDR,1) FROM EMP_1;

SELECT ADDR,LOWER(ADDR) AS 'LOWER CASE',LEN(ADDR) AS 'LENGTH' FROM EMP_1;

SELECT COUNT(EID) FROM EMP_SAL WHERE SALARY IS NULL;

--SUBSTRING
SELECT SUBSTRING ('WELCOME',3,3);

SELECT REPLACE ('INDIA','I','K');

SELECT REVERSE ('INDIA');

SELECT STUFF('ABCDEFGHIJ',3,4,'XYZ');

SELECT EID,ADDR, CHARINDEX(' ',ADDR) AS 'SPACE',LEN(ADDR) AS 'LENGTH', LEFT(ADDR,CHARINDEX(' ',ADDR)) AS 'FIRST',RIGHT(ADDR,CHARINDEX(' ',ADDR)) AS 'SECOND'FROM EMP_1;

SELECT EID,ADDR, CHARINDEX(' ',ADDR) AS 'SPACE',LEN(ADDR) AS 'LENGTH', LEFT(ADDR,LEN(ADDR)-CHARINDEX(' ',ADDR)) AS 'FIRST',RIGHT(ADDR,LEN(ADDR)-CHARINDEX(' ',ADDR)) AS 'SECOND',
CONCAT(LEFT(ADDR,1),RIGHT(ADDR,LEN(ADDR)-CHARINDEX(' ',ADDR)))
FROM EMP_1;

SELECT DATEADD(YY,20,GETDATE());

SELECT * FROM EMP_1;

SELECT EID, NAME,DOB,DATEDIFF(YY,DOB, GETDATE()) FROM EMP_1;

SELECT DAY(GETDATE()) AS 'DAY',MONTH(GETDATE()) AS 'MONTH',YEAR(GETDATE()) AS 'YEAR';

SELECT CONVERT (VARCHAR(20), GETDATE(),111);

SELECT CONVERT (VARCHAR(20), GETDATE());

SELECT FORMAT(GETDATE(),'Y');

SELECT DOB, DATEADD(D,90,DOB) AS '90 DAYS' FROM EMP_1;


--USER DEFINED FUNCTIONS --
USE LEARN;

CREATE FUNCTION MYSUM(@X AS INT, @Y AS INT)
RETURNS INT
AS 
BEGIN
		DECLARE @Z AS INT;
		SET @Z =@X+@Y;
		RETURN @Z;
END;

SELECT DBO.MYSUM(10,20);

CREATE FUNCTION CAL(@A AS INT, @B AS INT , @O AS CHAR(1))
RETURNS INT
AS 
BEGIN
		DECLARE @R AS INT;
		IF @O='+'
			SET @R=@A+@B;
		ELSE IF @O='-'
			SET @R=@A-@B;
		ELSE IF @O='*'
			SET @R=@A*@B;
		ELSE IF @O='/'
			SET @R=@A/@B;
		ELSE IF @O='%'
			SET @R=@A%@B;
		ELSE SET @R=0;
		RETURN @R;
END;

DROP FUNCTION CAL;

SELECT DBO.CAL(20,2,'*');


CREATE FUNCTION FN(@X VARCHAR(100))
RETURNS VARCHAR(50)
AS 
BEGIN
		DECLARE @S AS INT;
		DECLARE @R AS VARCHAR(50);
		SET @S =CHARINDEX(' ',@X);
		SET @R =LEFT(@X,@S);
		RETURN @R;
END;


SELECT DBO.FN('ANIL SARKAR');

SELECT * FROM EMP_SAL;

DROP FUNCTION FNPS;

CREATE FUNCTION FNPS (@X AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
		(SELECT EMP_1.EID,NAME,DOB, DEPT, DESI,SALARY, SALARY*.09 AS 'PF' FROM EMP_1
		INNER JOIN EMP_SAL
		ON EMP_1.EID=EMP_SAL.EID
		WHERE DEPT=@X);

SELECT * FROM FNPS('HR');

SELECT * FROM EMP_1;
SELECT * FROM EMP_SAL;

-- SUBSTRING--
SELECT EID, NAME, CITY, DOB FROM EMP_1
WHERE EID IN (SELECT EID FROM EMP_SAL WHERE DESI='MANAGER');

SELECT * FROM EMP_SAL 
WHERE EID IN (SELECT EID FROM EMP_1 WHERE CITY='DELHI');
