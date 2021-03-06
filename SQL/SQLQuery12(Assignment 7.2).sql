-- ASSIGNMENT-7 --

USE DEMO;

SELECT * FROM EMP;

-- EID, NAME, CITY, DOJ OF GURGAON EMPLOYEES
SELECT EID, NAME, CITY,DOJ FROM EMP
INNER JOIN EMP_SALARY
ON EMP.EID=EMP_SALARY.EMPID
WHERE CITY ='PITTSBURGH';


-- EID, NAME, DOJ, DEPT, DESI AND SALARY OF ALL MANAGERS
SELECT EID, NAME, DOJ, DEPT,DESI,SAL FROM EMP 
INNER JOIN EMP_SALARY
ON EMP.EID=EMP_SALARY.EMPID
WHERE DESI='MGR';


--REDUCE THE SALARY OF ALL DELHI EMPLOYEES BY 10%.

SELECT * FROM EMP_SALARY;
SELECT * FROM EMP_1 WHERE CITY ='DEL';
SELECT SAL,SAL*.10 AS 'CUTTING AMOUNT', SAL-SAL*.10 AS 'AFTER REDUCING' FROM EMP_SALARY;

SELECT SAL FROM EMP_SALARY;

--DISPLAY THE EID, NAME, CITY, DOJ, DEPT,DESI AND SALARY OF THE TEAM MEMBERS OF DAVID AND RAMESH SHARMA.

SELECT  * FROM EMP;
SELECT * FROM EMP_1;
SELECT * FROM EMP_SAL;
SELECT * FROM EMP_SALARY;
SELECT * FROM EMP_SAL_DETAILS;

SELECT EMP_1.EMPID,NAME,CITY,DOJ,DEPT,DESI,SALARY FROM EMP_1 
INNER JOIN EMP_SAL
ON EMP_1.EMPID=EMP_SAL.EID
WHERE NAME IN ('RAJAN SHARMA','ROHIT SARKAR');

--CHECK AGAIN THE ABOVE CODE;RIGHT THE SPECIFIC CODE FOR THE SAME

--CREATE A TRAINING TABLE CONTAINING EID,NAME,DEPT INSERT THE DETAILS OF OPS TEAM MEMBERS IN THE TRAINING TABLE.

CREATE TABLE TRAINING (EID CHAR(5), NAME VARCHAR(30),DEPT VARCHAR(30));

INSERT INTO TRAINING (EID,NAME,DEPT)(SELECT E_1.EID, NAME, DEPT FROM EMP AS E_1 
INNER JOIN EMP_SAL E_2
ON E_1.EID=E_2.EID);

SELECT * FROM TRAINING;

--DETAILS OF DIRECTORS SHOULD BE DELETED FROM THE TRAINING TABLE.

DELETE FROM TRAINING WHERE EID  IN (SELECT EID FROM TRAINING WHERE DEPT ='Marketing');

--DISPLAY THE SALARY DETAILS OFF ALL EMPLOYEES IF ANY OF THE TEAM MEMBER HAS SALARY MORE THAN 200000.

SELECT * FROM EMP_SAL WHERE SALARY>'15000';



	






















