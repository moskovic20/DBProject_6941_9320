------------------------ add hospital to order table 

ALTER TABLE Order_ ADD Hospital VARCHAR(15);

-- enter data
DECLARE
  v_random_hospital VARCHAR2(255);
BEGIN
  FOR r IN (SELECT rowid AS rid FROM order_) LOOP
    v_random_hospital := CASE TRUNC(DBMS_RANDOM.VALUE(0, 12))
                          WHEN 0 THEN 'Sheba'
                          WHEN 1 THEN 'Rabin'
                          WHEN 2 THEN 'Ichilov'
                          WHEN 3 THEN 'Soroka'
                          WHEN 4 THEN 'Wolfson'
                          WHEN 5 THEN 'Assuta'
                          WHEN 6 THEN 'Yoseftal'
                          WHEN 7 THEN 'Hadassah'
                          WHEN 8 THEN 'Shaare Zedek'
                          WHEN 9 THEN 'Barzilai'
                          WHEN 10 THEN 'Laniado'
                          WHEN 11 THEN 'Poriya'

                        END;
    UPDATE order_
    SET Hospital = v_random_hospital
    WHERE rowid = r.rid;
  END LOOP;
  COMMIT;
END;


------------------------------------ add num of workers to station table
ALTER TABLE station ADD numOfWorkers number(3);

-- enter data
DECLARE
  v_random_numOfWorkers NUMBER;
BEGIN
  FOR r IN (SELECT rowid AS rid FROM station) LOOP
    v_random_numOfWorkers := TRUNC(DBMS_RANDOM.VALUE(5,21)); 
    UPDATE station
    SET numOfWorkers = v_random_numOfWorkers
    WHERE rowid = r.rid;
  END LOOP;
  COMMIT;
END;


------------------------------------ add monthly budger for station to dtation table
ALTER TABLE station ADD monthlyBudget number(5);

-- enter data
DECLARE
  v_random_monthlyBudget NUMBER;
BEGIN
  FOR r IN (SELECT rowid AS rid FROM station) LOOP
    v_random_monthlyBudget := ROUND(DBMS_RANDOM.VALUE(40000, 70000) / 500) * 500;  
    UPDATE station
    SET monthlyBudget = v_random_monthlyBudget
    WHERE rowid = r.rid;
  END LOOP;
  COMMIT;
END;
