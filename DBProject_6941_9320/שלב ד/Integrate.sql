-----����� ��� ����� ����� ����� ��-----

ALTER TABLE bookstoborrow
ADD stationID NUMBER(3);

ALTER TABLE bookstoborrow
ADD CONSTRAINT fk_station
FOREIGN KEY (stationID)
REFERENCES station(stationID);

UPDATE bookstoborrow
SET stationID = FLOOR(DBMS_RANDOM.VALUE(1, 401));


----------------------------------------����� ������� ��������-----------

-----------------------------------------����� �������

UPDATE customers
SET customerid = 100
WHERE customerid = 1;

UPDATE borrows
SET customerid = 100
WHERE customerid = 1;


--����� ����� ��� ���� ����� �� ���� �����
ALTER TABLE BORROWS
 DROP CONSTRAINT SYS_C008385;

---------------------����� ����� BORROWS

--����� ���� ������
ALTER TABLE borrows
MODIFY (customerid NUMBER(5));

--����� �����
UPDATE borrows
SET customerid = customerid * 10;


---------------------����� ����� CUSTOMERS

--����� ���� �����
ALTER TABLE customers
MODIFY (customerid NUMBER(5))

--����� �����
UPDATE customers
SET customerid = customerid * 10;



------------------------------------����� ���� ������----------------------

--���� ����� ��� ����� �����
ALTER TABLE donation
 DROP CONSTRAINT SYS_C008349;

--����� �� �����
RENAME donor TO person;

--����� ���� �����
ALTER TABLE PERSON
MODIFY (DONORID NUMBER(5));

--����� �����
ALTER TABLE PERSON
RENAME COLUMN donorid TO personID;

--����� ������
ALTER TABLE PERSON
 ADD ADDRESS VARCHAR2(15);
 
-------------------------------------------����� �������------------------

INSERT INTO PERSON (PERSONID, FULLNAME, DATEOFBIRTH, GENDER,
 WEIGHT, NUMBERPHONE, BLOODID, ADDRESS)
SELECT CUSTOMERID, CNAME, DATEOFBIRTH, NULL, NULL, PHONE, NULL, ADDRESS
FROM CUSTOMERS;

----------------����� ������ ���� PERSON

ALTER TABLE BORROWS
ADD CONSTRAINT fk_customerid
FOREIGN KEY (CUSTOMERID)
REFERENCES PERSON(PERSONID);

ALTER TABLE DONATION
ADD CONSTRAINT fk_donorid
FOREIGN KEY (DONORID)
REFERENCES PERSON(PERSONID);


-------------------------------����� ����� CUSTOMERS---------------------------

DROP TABLE CUSTOMERS;
