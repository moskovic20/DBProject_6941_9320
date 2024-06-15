------------------------- parameters queries -------------------

--query1
SELECT O.ORDERID, O.ORDERDATE, O.HOSPITAL, O.DONE
FROM ORDER_ O
WHERE O.ORDERDATE BETWEEN 
      &<name="from_date" hint="enter date between 2020-2024"
      type="date" required="true"> 
      AND 
      &<name="until_date"
      hint="enter date between 2020-2024" type="date" required="true"> 
AND O.HOSPITAL = 
      &<name="hospital_name" type="string" 
      hint="select hospital from the list"
      list="select distinct hospital from order_" required="true">
ORDER BY O.ORDERDATE ASC;


--query2
SELECT * 
FROM donation d
WHERE d.donorid IN (
      SELECT donorid
      FROM donor do
      WHERE do.fullname = &<name="donor_name" type="string"
      required="true" hint="enter donor name">)
ORDER BY d.donationdate &<name="descending sort "
      hint="sort by donationdata"
      checkbox="desc,asc" >;


--query3
SELECT donationid,donationdate,donorid,s.stationid
FROM donation d join station s on d.stationid=s.stationid
WHERE d.donationdate IN (
    &<name="date"
    hint="enter date between 2020-2024"
    type="date"
    required="true">) 
and
    s.city in (
    &<name="cities"
    type="string"
    hint="Select desired cities"
    list="select distinct  city from station"
    multiselect="yes"
    required="true">);
    

--query4
SELECT *
FROM STATION S
WHERE S.CITY = &<NAME = "station_city" type="string" list="select distinct city from station" 
                 hint="Select a city" required="true">
AND S.NUMOFWORKERS = (
    SELECT MAX(NUMOFWORKERS)
    FROM STATION
    WHERE CITY = &<NAME = "station_city">
);

      
