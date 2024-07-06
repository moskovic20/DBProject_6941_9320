create or replace function sendOrder
(bankNum in number ,bloodType in number, amount in number) 
  return BOOLEAN is Result BOOLEAN;

  
   CURSOR car_donation  IS
     select * 
     from donation d 
     where d.bankid=bankNum
     and d.isexists='Y'
     and d.valid='Y'
     and d.donorid in 
        (select donorid from donor do where do.bloodid=bloodType ); 
      
     myDon car_donation%ROWTYPE;
     numDon number:=0;
                     
begin
  
     --count donations
     FOR myDon IN car_donation LOOP
         numDon:=numDon+1;
         if numDon=amount then
           exit;
           end if;
     END LOOP;
     
     --if have enough donations
     if numDon = amount then
        numDon:=0;
       
       --take donations(update isExists)
       FOR myDon IN car_donation LOOP  
          if numDon=amount then
           exit;
           end if;
          UPDATE donation d
          SET d.isexists= 'N'
          where d.donationid=myDon.donationid;
          numDon:=numDon+1;
       END LOOP;
      
        --order sent successfully
        result:=TRUE;
     
     --if no have enough donations
     else
        --order not sent
       result:=FALSE;
     end if;

  return(Result);
end sendOrder;
/
