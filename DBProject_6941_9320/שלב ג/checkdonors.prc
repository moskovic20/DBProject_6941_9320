CREATE OR REPLACE PROCEDURE checkdonors(
    thebloodtype IN VARCHAR2,
    donor_cursor OUT SYS_REFCURSOR
) IS
    CURSOR donorcursor IS 
        SELECT D.DONORID, D.FULLNAME
        FROM DONOR D
        JOIN BLOOD B ON D.BLOODID = B.BLOODID
        JOIN DONATION DO ON D.DONORID = DO.DONORID
        WHERE B.BLOODTYPE = thebloodtype
          AND DO.DONATIONDATE BETWEEN TO_DATE('01/01/2023', 'DD/MM/YYYY')
           AND TO_DATE('01/01/2024', 'DD/MM/YYYY');
    
    donor_rec donorcursor%ROWTYPE;
    donor_id DONOR.DONORID%TYPE;
    donor_name DONOR.FULLNAME%TYPE;
BEGIN
    IF thebloodtype NOT IN ('A', 'B', 'AB', 'O') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid blood type: ' || thebloodtype);
    END IF;

    OPEN donorcursor;
    
    LOOP
        FETCH donorcursor INTO donor_rec;
        EXIT WHEN donorcursor%NOTFOUND;

        donor_id := donor_rec.DONORID;
        donor_name := donor_rec.FULLNAME;

        DBMS_OUTPUT.PUT_LINE('Donor ID: ' || donor_id || ', Full Name: ' || donor_name);
    END LOOP;

    CLOSE donorcursor;

    OPEN donor_cursor FOR
        SELECT D.DONORID, D.FULLNAME, COUNT(DO.DONATIONID) AS NUM_DONATIONS
        FROM DONOR D
        JOIN BLOOD B ON D.BLOODID = B.BLOODID
        JOIN DONATION DO ON D.DONORID = DO.DONORID
        WHERE B.BLOODTYPE = thebloodtype
          AND DO.DONATIONDATE BETWEEN TO_DATE('01/01/2023', 'DD/MM/YYYY')
          AND TO_DATE('01/01/2024', 'DD/MM/YYYY')
        GROUP BY D.DONORID, D.FULLNAME
        HAVING COUNT(DO.DONATIONID) > 1
        ORDER BY COUNT(DO.DONATIONID) DESC;
        
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No donors found for the specified blood type and date range.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END checkdonors;
/
