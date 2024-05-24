
[General]
Version=1

[Preferences]
Username=
Password=2495
Database=
DateFormat=DD/MM/YYYY
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MORIYA
Name=DONOR
Count=600

[Record]
Name=DONORID
Type=NUMBER
Size=3
Data=Sequence(100, [], [])
Master=

[Record]
Name=FULLNAME
Type=VARCHAR2
Size=15
Data=FirstName + ' ' =  + LastName
Master=

[Record]
Name=DATEOFBIRTH
Type=DATE
Size=
Data=Random(1/1/1960, 1/1/2003)
Master=

[Record]
Name=GENDER
Type=VARCHAR2
Size=15
Data=List('F', 'M')
Master=

[Record]
Name=WEIGHT
Type=NUMBER
Size=4,2
Data=Random(50, 99)
Master=

[Record]
Name=NUMBERPHONE
Type=VARCHAR2
Size=15
Data='05' + List('1', '2','3', '4','7', '8','9')+'-' +[0000000]
Master=

[Record]
Name=BLOODID
Type=NUMBER
Size=3
Data=List(select bloodid from blood)
Master=

