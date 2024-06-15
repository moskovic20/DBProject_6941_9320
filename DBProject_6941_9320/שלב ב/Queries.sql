---------------------  select queries  ---------------------

--query 1
select fullname, numberphone
from donor D
where bloodid in 
      (SELECT bloodid
       FROM BLOOD B
       WHERE b.sign='+' and BLOODTYPE ='O')and 
             EXISTS (select donationid
                     from donation
                     where donorid=D.DONORID and stationid in(
                         select stationid
                         from station
                         where city='Tel Aviv'));
                         
                         
--query 2
SELECT s.city, COUNT(d.donationid) AS womans_donations
FROM station s
LEFT JOIN (
    SELECT d.donationid, d.stationid
    FROM donation d
    JOIN donor r ON d.donorid = r.donorid
    WHERE r.gender = 'F' AND EXTRACT(YEAR FROM d.donationdate) = 2023
    ) d ON s.stationid = d.stationid
GROUP BY s.city
ORDER BY s.city ASC;


--query 3
SELECT DO.DONATIONDATE, D.FULLNAME, D.DONORID   
FROM DONOR D
JOIN DONATION DO ON DO.DONORID = D.DONORID     
WHERE D.DATEOFBIRTH
BETWEEN to_date('01/01/1990','DD/MM/YYYY') and to_date('01/01/2003','DD/MM/YYYY')
AND NOT EXISTS(
    SELECT 1
    FROM DONATION DON
    WHERE DON.DONORID = D.DONORID
    AND D.DATEOFBIRTH BETWEEN to_date('01/06/2023','DD/MM/YYYY') and to_date('01/01/2024','DD/MM/YYYY')
)
ORDER BY DO.DONATIONDATE DESC;


--query 4
SELECT distinct MAX_BLOOD_BANK.BANKID, MAX_BLOOD_BANK.BLOODTYPE
FROM BLOODBANK BA
JOIN ORDER_ O ON O.BANKID = BA.BANKID
JOIN (
    SELECT BLOODTYPE, BANKID
    FROM (
        SELECT B.BLOODTYPE, BA.BANKID, COUNT(*) AS TOTAL_ORDERS
        FROM ORDER_ O
        JOIN BLOOD B ON B.BLOODID = O.BLOODID
        JOIN BLOODBANK BA ON BA.BANKID = O.BANKID
        GROUP BY B.BLOODTYPE, BA.BANKID
        ORDER BY COUNT(*) DESC
    ) SUB
    WHERE ROWNUM = 1
) MAX_BLOOD_BANK ON MAX_BLOOD_BANK.BANKID = BA.BANKID;




---------------------  delete queries  ---------------------

--query 1

delete from donation d
where d.valid='N'


--query 2
DELETE FROM order_
WHERE HOSPITAL = 'Sheba'
  AND ORDERDATE = TO_DATE('09/06/2024', 'DD/MM/YYYY')
  AND AMOUNT = 500
  AND BLOODID in (SELECT bloodid
       FROM BLOOD b
       WHERE b.sign='+' and BLOODTYPE ='AB')
  AND BANKID IN (SELECT bn.bankid
       FROM bloodbank bn
       WHERE bn.city='Bat Yam');


---------------------  update queries  ---------------------

--query 1
UPDATE ORDER_
SET DONE = 'y'
WHERE HOSPITAL = 'Ichilov'
      AND DONE='n'
      AND ORDERDATE BETWEEN TO_DATE('01/01/2023','DD/MM/YYYY')
      AND TO_DATE('01/01/2024','DD/MM/YYYY')
      AND bloodid IN (
            SELECT bloodid
            FROM BLOOD B
            WHERE BLOODTYPE ='O');
            

--query 2
UPDATE Station
SET monthlyBudget = monthlyBudget + 
    LEAST(10000, 700 * numofworkers) +
    CASE
        WHEN monthlyBudget = (
            SELECT MIN(monthlyBudget)
            FROM Station
        ) THEN 5000
        ELSE 0
    END;

