DECLARE
    -- Array of blood types
    TYPE BloodTypesArray IS TABLE OF VARCHAR2(15) INDEX BY PLS_INTEGER;
    blood_types BloodTypesArray;
    main_donor_id NUMBER := 271; 
    donations_count NUMBER;
    
    donor_cursor SYS_REFCURSOR;
    fetched_donor_id DONOR.DONORID%TYPE;
    donor_name DONOR.FULLNAME%TYPE;
    num_donations NUMBER;
BEGIN
  
    DBMS_OUTPUT.PUT_LINE('---------------------- procedure -------------------'||CHR(10));
   
    blood_types(1) := 'A';
    blood_types(2) := 'B';
    blood_types(3) := 'AB';
    blood_types(4) := 'O';
    
     DBMS_OUTPUT.PUT_LINE('Details of blood donors in 2023 by blood type'||chr(10));
     
    -- Loop through each blood type in the array
    FOR i IN 1..blood_types.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('----------------------');
        DBMS_OUTPUT.PUT_LINE('Blood Type: ' || blood_types(i));
        DBMS_OUTPUT.PUT_LINE('----------------------');
        
        -- Call the procedure with current blood type and fetch donor_cursor
        checkdonors(blood_types(i), donor_cursor);
        
        DBMS_OUTPUT.PUT_LINE(chr(10)||'Top 3 donors for Blood Type ' || blood_types(i) || ':');
        
        -- Print top 3 donors for the current blood type
        FOR j IN 1..3 LOOP
            FETCH donor_cursor INTO fetched_donor_id, donor_name, num_donations;
            EXIT WHEN donor_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Donor ID: ' || fetched_donor_id || ', Full Name: ' || donor_name 
            || ', Number of Donations: ' || num_donations);
        END LOOP;
         CLOSE donor_cursor;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(CHR(10)||CHR(10)||'---------------------- function-------------------'||CHR(10));
    donations_count := count_donations(main_donor_id);

    IF donations_count >= 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number of blood donations made by the donor with the ID ' 
        || main_donor_id || ' is: ' || donations_count);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No blood donations were found for the donor ' || main_donor_id);
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        
END;
