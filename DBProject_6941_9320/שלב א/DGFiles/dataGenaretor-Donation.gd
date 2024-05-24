
[General]
Version=1

[Preferences]
Username=
Password=2752
Database=
DateFormat=DD/MM/YYYY
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MORIYA
Name=DONATION
Count=800

[Record]
Name=DONATIONID
Type=NUMBER
Size=3
Data=Sequence(1, [], [])
Master=

[Record]
Name=DONATIONDATE
Type=DATE
Size=
Data=Random(1/1/2020, 1/1/2024)
Master=

[Record]
Name=VALID
Type=VARCHAR2
Size=15
Data=List('Y', 'N')
Master=

[Record]
Name=DONORID
Type=NUMBER
Size=3
Data=List(select DONORID from DONOR)
Master=

[Record]
Name=STATIONID
Type=NUMBER
Size=3
Data=List(select STATIONID from STATION)
Master=

[Record]
Name=BANKID
Type=NUMBER
Size=3
Data=List(select BANKID from BLOODBANK)
Master=

