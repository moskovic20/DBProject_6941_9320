--insert bloodBank:
insert into BLOODBANK (bankid, manager, numberphone, city)
values (1, 'David Cohen', '055-1234567', 'Tel Aviv');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (2, 'Sarah Levi', '052-8765432', 'Jerusalem');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (3, 'Michael Mizra', '054-9012345', 'Haifa');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (4, 'Rachel Avrahm', '051-6789012', 'Rishon LeZion');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (5, 'Yosef Dayan', '053-3456789', 'Petah Tikva');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (6, 'Miriam Katz', '055-0123456', 'Ashdod');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (7, 'Daniel Biton', '052-7890123', 'Netanya');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (8, 'Leah Gabay', '054-4567890', 'Beersheba');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (9, 'Moshe Peretz', '051-1234567', 'Bnei Brak');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (10, 'Rivka Shalom', '053-8901234', 'Holon');


--insert donor:
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (381, 'Walter Rosas', to_date('14-03-1994', 'dd-mm-yyyy'), 'F', 72.03, '057-2617748', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (382, 'Mira Manning', to_date('25-07-1974', 'dd-mm-yyyy'), 'F', 75.46, '051-6920320', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (383, 'Micky MacDowell', to_date('17-06-1984', 'dd-mm-yyyy'), 'M', 77.95, '058-2797287', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (384, 'Elle Paxton', to_date('20-01-1965', 'dd-mm-yyyy'), 'M', 98.74, '058-4486237', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (385, 'Praga Sizemore', to_date('31-10-1967', 'dd-mm-yyyy'), 'F', 58.13, '058-0665921', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (386, 'France Stevens', to_date('18-10-1981', 'dd-mm-yyyy'), 'M', 57.51, '052-8599701', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (387, 'Cevin Carter', to_date('12-07-1962', 'dd-mm-yyyy'), 'M', 90.03, '054-4286170', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (388, 'Candice Davies', to_date('06-05-1965', 'dd-mm-yyyy'), 'F', 77.85, '053-8070375', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (389, 'Nicole Caine', to_date('01-12-1980', 'dd-mm-yyyy'), 'M', 66.8, '057-9686642', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (390, 'Shannyn Dayne', to_date('22-07-1988', 'dd-mm-yyyy'), 'M', 53.24, '059-1007052', 4);



--insert station:
insert into STATION (stationid, city, numberphone, manager)
values (1, 'Jerusalem', '054-2175226', 'Robbi Dauer');
insert into STATION (stationid, city, numberphone, manager)
values (2, 'Jerusalem', '054-4780626', 'Quinn Haage');
insert into STATION (stationid, city, numberphone, manager)
values (3, 'Jerusalem', '054-6203348', 'Shana Eein');
insert into STATION (stationid, city, numberphone, manager)
values (4, 'Jerusalem', '054580-4262', 'Signd Zeclli');
insert into STATION (stationid, city, numberphone, manager)
values (5, 'Jerusalem', '054-8667131', 'Burke Proer');
insert into STATION (stationid, city, numberphone, manager)
values (6, 'Jerusalem', '053-6439459', 'Samtha Ovesen');
insert into STATION (stationid, city, numberphone, manager)
values (7, 'Jerusalem', '051-1028616', 'Nanial Worssam');
insert into STATION (stationid, city, numberphone, manager)
values (8, 'Jerusalem', '051-3006959', 'Brooke Masen');
insert into STATION (stationid, city, numberphone, manager)
values (9, 'Jerusalem', '051-9932603', 'Waly Hares');
insert into STATION (stationid, city, numberphone, manager)
values (10, 'Jerusalem', '051-2281456', 'Carol Vyel');


--insert donation:
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (1, to_date('25-08-2022', 'dd-mm-yyyy'), 'Y', 665, 251, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (2, to_date('09-06-2020', 'dd-mm-yyyy'), 'Y', 568, 115, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (3, to_date('02-03-2020', 'dd-mm-yyyy'), 'Y', 110, 88, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (4, to_date('10-07-2022', 'dd-mm-yyyy'), 'N', 381, 120, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (5, to_date('02-12-2022', 'dd-mm-yyyy'), 'Y', 108, 260, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (6, to_date('08-12-2020', 'dd-mm-yyyy'), 'Y', 398, 94, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (7, to_date('14-11-2021', 'dd-mm-yyyy'), 'N', 238, 196, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (8, to_date('26-05-2020', 'dd-mm-yyyy'), 'N', 436, 153, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (9, to_date('21-02-2021', 'dd-mm-yyyy'), 'N', 549, 8, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (10, to_date('23-08-2023', 'dd-mm-yyyy'), 'N', 257, 191, 20);


--insert order_:
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (523, 'y', to_date('22-12-2020', 'dd-mm-yyyy'), 1, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (524, 'n', to_date('11-10-2022', 'dd-mm-yyyy'), 13, 6, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (525, 'n', to_date('21-07-2021', 'dd-mm-yyyy'), 12, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (526, 'n', to_date('19-11-2020', 'dd-mm-yyyy'), 30, 7, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (527, 'y', to_date('20-02-2023', 'dd-mm-yyyy'), 12, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (528, 'n', to_date('15-05-2023', 'dd-mm-yyyy'), 22, 4, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (529, 'n', to_date('10-02-2023', 'dd-mm-yyyy'), 26, 5, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (530, 'n', to_date('20-09-2020', 'dd-mm-yyyy'), 14, 4, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (531, 'n', to_date('27-06-2021', 'dd-mm-yyyy'), 17, 6, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (532, 'y', to_date('11-08-2023', 'dd-mm-yyyy'), 17, 7, 10);


--insert blood:
insert into BLOOD (bloodtype, sign, bloodid)
values ('''A''', '''+''', 1);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''A''', '''-''', 2);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''B''', '''+''', 3);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''B''', '''-''', 4);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''AB''', '''+''', 5);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''AB''', '''-''', 6);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''O''', '''+''', 7);
insert into BLOOD (bloodtype, sign, bloodid)
values ('''O''', '''-''', 8);


