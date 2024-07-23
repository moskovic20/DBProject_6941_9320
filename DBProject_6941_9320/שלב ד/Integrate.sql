-----חיבור ספר השאלה לתחנת תרומת דם-----

ALTER TABLE bookstoborrow
ADD stationID NUMBER(3);

ALTER TABLE bookstoborrow
ADD CONSTRAINT fk_station
FOREIGN KEY (stationID)
REFERENCES station(stationID);

UPDATE bookstoborrow
SET stationID = FLOOR(DBMS_RANDOM.VALUE(1, 401));


----------------------------------------חיבור הלקוחות והתורמים-----------

-----------------------------------------טיפול במפתחות

UPDATE customers
SET customerid = 100
WHERE customerid = 1;

UPDATE borrows
SET customerid = 100
WHERE customerid = 1;


--מחיקת המפתח הזר בכדי לשנות את ערכי המפתח
ALTER TABLE BORROWS
 DROP CONSTRAINT SYS_C008385;

---------------------טיפול בטבלה BORROWS

--הגדלת מספר ספרותי
ALTER TABLE borrows
MODIFY (customerid NUMBER(5));

--הכפלת המפתח
UPDATE borrows
SET customerid = customerid * 10;


---------------------טיפול בטבלה CUSTOMERS

--הגדלת מספר ספרות
ALTER TABLE customers
MODIFY (customerid NUMBER(5))

--הכפלת המפתח
UPDATE customers
SET customerid = customerid * 10;



------------------------------------יצירת טבלה משותפת----------------------

--הסרת התלות בין תרומה לתורם
ALTER TABLE donation
 DROP CONSTRAINT SYS_C008349;

--שינוי שם הטבלה
RENAME donor TO person;

--הגדלת מספר ספרות
ALTER TABLE PERSON
MODIFY (DONORID NUMBER(5));

--התאמת הטבלה
ALTER TABLE PERSON
RENAME COLUMN donorid TO personID;

--הוספת עמודות
ALTER TABLE PERSON
 ADD ADDRESS VARCHAR2(15);
 
-------------------------------------------הכנסת הנתונים------------------

INSERT INTO PERSON (PERSONID, FULLNAME, DATEOFBIRTH, GENDER,
 WEIGHT, NUMBERPHONE, BLOODID, ADDRESS)
SELECT CUSTOMERID, CNAME, DATEOFBIRTH, NULL, NULL, PHONE, NULL, ADDRESS
FROM CUSTOMERS;

----------------יצירת תלויות עבור PERSON

ALTER TABLE BORROWS
ADD CONSTRAINT fk_customerid
FOREIGN KEY (CUSTOMERID)
REFERENCES PERSON(PERSONID);

ALTER TABLE DONATION
ADD CONSTRAINT fk_donorid
FOREIGN KEY (DONORID)
REFERENCES PERSON(PERSONID);


-------------------------------מחיקת הטבלה CUSTOMERS---------------------------

DROP TABLE CUSTOMERS;
