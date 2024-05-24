
[General]
Version=1

[Preferences]
Username=
Password=2690
Database=
DateFormat=DD/MM/YYYY
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MORIYA
Name=ORDER_
Count=600

[Record]
Name=ORDERID
Type=NUMBER
Size=3
Data=Sequence(1, [], [])
Master=

[Record]
Name=DONE
Type=VARCHAR2
Size=15
Data=List('y', 'n')
Master=

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(1/5/2020, 1/1/2024)
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=3
Data=Random(1, 200)
Master=

[Record]
Name=BLOODID
Type=NUMBER
Size=3
Data=List(select BLOODID from BLOOD)
Master=

[Record]
Name=BANKID
Type=NUMBER
Size=3
Data=List(select BANKID from BLOODBANK)
Master=

