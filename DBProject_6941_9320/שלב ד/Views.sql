
-----------------VIEW_bloodDonation--------------------------------------

create or replace view JerusalemDonors as
select 
    p.personid as ID_,
    p.fullname as Name_,
    p.numberphone,
    p.dateofbirth,
    p.gender,
    d.donationdate,
    b.bloodtype,
    s.stationid
from donation d join person p on d.donationid = p.personid
join blood b on p.bloodid = b.bloodid
join station s on d.stationid = s.stationid
where s.city = 'Jerusalem';

-----שאילתה 1
select Name_,numberphone
from JerusalemDonors
where gender = 'F';

-----שאילתה 2
select stationid,count(*) as Oֹֹ_DonationCount
from JerusalemDonors
where bloodtype = 'O'
group by stationid;


-----------------VIEW_library---------------------------------------------
CREATE OR REPLACE VIEW libraryview AS
SELECT b.borroeid, b.booknumber, b.borrowdate, b.returndate,
       p.personid, p.fullname
FROM BORROWS b
JOIN PERSON p ON b.customerid = p.personid
JOIN BOOKSTOBORROW btob ON b.booknumber = btob.booknumber
WHERE btob.isborrow = 'Y';

-- שאילתה 1
SELECT booknumber
FROM libraryview
WHERE borrowdate BETWEEN to_date('01/05/2024', 'DD/MM/YYYY')
                     AND to_date('01/06/2025', 'DD/MM/YYYY');

-- שאילתה 2
Select personid , count(*) AS totalbooks
From libraryview
GROUP BY personid;
