DECLARE
    myBankID NUMBER;
    numPendingOrders NUMBER;
    numOrdersSent NUMBER;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('START PROGRAM, DATE: ' || SYSDATE || CHR(10) || CHR(10));
    
    --bankID := ROUND(DBMS_RANDOM.VALUE(1, 20));
    myBankID := 7;
    
    SELECT COUNT(*) INTO numPendingOrders 
    FROM order_ o
    WHERE o.bankid = myBankID AND o.done = 'n';
    
    sendOrders_ByBank(myBankID, numOrdersSent);
    
    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'A total of ' || numOrdersSent 
    || ' out of ' || numPendingOrders || ' orders were sent');
    commit;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Handle any exceptions
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

