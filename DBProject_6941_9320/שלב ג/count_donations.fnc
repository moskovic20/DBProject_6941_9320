create or replace function count_donations(theid in NUMBER) return number is

 total_donations NUMBER;
    blood_type VARCHAR2(15); 

BEGIN
    SELECT B.BLOODTYPE INTO blood_type
    FROM DONOR D
    JOIN BLOOD B ON D.BLOODID = B.BLOODID
    --JOIN DONATION DO ON D.DONORID = DO.DONORID
    WHERE D.DONORID = theid;

    IF blood_type <> 'O' THEN
        
        RETURN 0;
    END IF;

    SELECT COUNT(*) INTO total_donations
    FROM DONATION
    WHERE DONORID = theid;

 
    RETURN total_donations;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        
        RETURN 0;
    WHEN OTHERS THEN
      
        RETURN -1;
END count_donations;
/
