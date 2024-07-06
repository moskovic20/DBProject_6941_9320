create or replace procedure sendOrders_ByBank
              (bankNum in NUMBER, numOrdersSent out NUMBER) is

  numDonation NUMBER;
  isEmpty_ BOOLEAN := TRUE;
  isOrderSent BOOLEAN;
  
  CURSOR car_ordersToSend IS
    SELECT * FROM order_ o
    WHERE o.bankid = bankNum AND o.done = 'n'
    ORDER BY o.orderdate;
  myOrder car_ordersToSend%ROWTYPE;
  
  CURSOR bank_cursor IS
    SELECT * FROM bloodbank WHERE bankid = bankNum;
  myBank bank_cursor%ROWTYPE;

  bankid_not_found EXCEPTION;
  
begin
   -- get bank details
  OPEN bank_cursor;
  FETCH bank_cursor INTO myBank;
  
  -- if bank not found
  IF bank_cursor%NOTFOUND THEN
       RAISE bankid_not_found;
  END IF;
  CLOSE bank_cursor;
    
  -- print bank details
  DBMS_OUTPUT.PUT_LINE('bankID: ' || bankNum || '   manager: ' ||
         myBank.manager || '   city: ' || myBank.city || CHR(10)
         || CHR(10) || '- - - - - - - - - - - - - - - - - ' || CHR(10) ||
         'The details of the orders that have not yet been sent in this bank:' || CHR(10));
         
  -- print all orders   
  FOR myOrder IN car_ordersToSend LOOP
    isEmpty_ := FALSE;
    DBMS_OUTPUT.PUT_LINE(myOrder.orderid || '         ' || myOrder.orderdate ||
     '         ' || myOrder.hospital);
  END LOOP;
  
  numOrdersSent:=0;
  IF isEmpty_ THEN
    DBMS_OUTPUT.PUT_LINE('There are no pending orders for this bank');
    
  ELSE
    --Start of shipping orders
    DBMS_OUTPUT.PUT_LINE(CHR(10)||'start send orders:');
    
    FOR myOrder IN car_ordersToSend LOOP
        isOrderSent:=sendOrder(bankNum,myOrder.Bloodid,myOrder.Amount);
     
     IF isOrderSent then --The order sent
        update order_ o
        set o.done='y'
        where o.orderid=myOrder.Orderid;
        DBMS_OUTPUT.PUT_LINE('ORDER NUM: '||myOrder.Orderid||' SENT');
        numOrdersSent:=numOrdersSent+1;
        
     ELSE
       DBMS_OUTPUT.PUT_LINE('ORDER NUM: '||myOrder.Orderid||' UNABLE TO SEND YET');
       
     END IF;
    END LOOP;

  END IF;

EXCEPTION
  WHEN bankid_not_found THEN
    RAISE_APPLICATION_ERROR
    (-20002, 'The blood bank number entered is incorrect');

end sendOrders_ByBank;
/
