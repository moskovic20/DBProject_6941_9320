prompt PL/SQL Developer import file
prompt Created on יום שישי 24 מאי 2024 by moriy
set feedback off
set define off
prompt Creating BLOOD...
create table BLOOD
(
  bloodtype VARCHAR2(15),
  sign      VARCHAR2(15),
  bloodid   NUMBER(3) not null
)
;
alter table BLOOD
  add primary key (BLOODID)
  ;

prompt Creating BLOODBANK...
create table BLOODBANK
(
  bankid      NUMBER(3) not null,
  manager     VARCHAR2(15),
  numberphone VARCHAR2(15),
  city        VARCHAR2(15)
)
;
alter table BLOODBANK
  add primary key (BANKID)
  ;

prompt Creating DONOR...
create table DONOR
(
  donorid     NUMBER(3) not null,
  fullname    VARCHAR2(15),
  dateofbirth DATE,
  gender      VARCHAR2(15),
  weight      NUMBER(4,2),
  numberphone VARCHAR2(15),
  bloodid     NUMBER(3)
)
;
alter table DONOR
  add primary key (DONORID)
  ;
alter table DONOR
  add foreign key (BLOODID)
  references BLOOD (BLOODID);

prompt Creating STATION...
create table STATION
(
  stationid   NUMBER(3) not null,
  city        VARCHAR2(15),
  numberphone VARCHAR2(15),
  manager     VARCHAR2(15)
)
;
alter table STATION
  add primary key (STATIONID)
  ;

prompt Creating DONATION...
create table DONATION
(
  donationid   NUMBER(3) not null,
  donationdate DATE,
  valid        VARCHAR2(15),
  donorid      NUMBER(3),
  stationid    NUMBER(3),
  bankid       NUMBER(3)
)
;
alter table DONATION
  add primary key (DONATIONID)
  ;
alter table DONATION
  add foreign key (DONORID)
  references DONOR (DONORID);
alter table DONATION
  add foreign key (STATIONID)
  references STATION (STATIONID);
alter table DONATION
  add foreign key (BANKID)
  references BLOODBANK (BANKID);

prompt Creating ORDER_...
create table ORDER_
(
  orderid   NUMBER(3) not null,
  done      VARCHAR2(15),
  orderdate DATE,
  amount    NUMBER(3),
  bloodid   NUMBER(3),
  bankid    NUMBER(3)
)
;
alter table ORDER_
  add primary key (ORDERID)
  ;
alter table ORDER_
  add foreign key (BLOODID)
  references BLOOD (BLOODID);
alter table ORDER_
  add foreign key (BANKID)
  references BLOODBANK (BANKID);

prompt Disabling triggers for BLOOD...
alter table BLOOD disable all triggers;
prompt Disabling triggers for BLOODBANK...
alter table BLOODBANK disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for STATION...
alter table STATION disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for ORDER_...
alter table ORDER_ disable all triggers;
prompt Disabling foreign key constraints for DONOR...
alter table DONOR disable constraint SYS_C007161;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C007178;
alter table DONATION disable constraint SYS_C007179;
alter table DONATION disable constraint SYS_C007180;
prompt Disabling foreign key constraints for ORDER_...
alter table ORDER_ disable constraint SYS_C007169;
alter table ORDER_ disable constraint SYS_C007170;
prompt Deleting ORDER_...
delete from ORDER_;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting STATION...
delete from STATION;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting BLOODBANK...
delete from BLOODBANK;
commit;
prompt Deleting BLOOD...
delete from BLOOD;
commit;
prompt Loading BLOOD...
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
commit;
prompt 8 records loaded
prompt Loading BLOODBANK...
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
insert into BLOODBANK (bankid, manager, numberphone, city)
values (11, 'David Azulay', '055-5678901', 'Bat Yam');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (12, 'Sarah Cohen', '052-2345678', 'Ramat Gan');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (13, 'Michael Peret', '054-9012345', 'Givatayim');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (14, 'Rachel Dahan', '051-6789012', 'Rehovot');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (15, 'Yosef Aviram', '053-3456789', 'Ashkelon');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (16, 'Miriam Cohen', '055-0123456', 'Kfar Saba');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (17, 'Daniel Edri', '052-7890123', 'Hod HaSharon');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (18, 'Leah Gabai', '054-4567890', 'Raanana');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (19, 'Moshe Sayag', '051-1234567', 'Lod');
insert into BLOODBANK (bankid, manager, numberphone, city)
values (20, 'Sarah Masoud', '053-8901234', 'Ramla');
commit;
prompt 20 records loaded
prompt Loading DONOR...
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
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (391, 'Guy Bacharach', to_date('25-11-1980', 'dd-mm-yyyy'), 'M', 79.03, '058-8204224', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (392, 'Vern Teng', to_date('20-04-1989', 'dd-mm-yyyy'), 'M', 90.07, '059-6449762', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (393, 'Mira Gates', to_date('13-12-1993', 'dd-mm-yyyy'), 'F', 82.15, '057-0749018', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (394, 'Gilberto Patton', to_date('14-12-1962', 'dd-mm-yyyy'), 'M', 72.31, '057-4167838', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (395, 'Lance Caviezel', to_date('18-04-1980', 'dd-mm-yyyy'), 'M', 63.17, '058-3116435', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (396, 'Ashton McGill', to_date('29-01-1982', 'dd-mm-yyyy'), 'F', 96.79, '058-5759978', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (397, 'Nik Jane', to_date('20-12-1967', 'dd-mm-yyyy'), 'M', 89.06, '052-6869165', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (398, 'Tony Hampton', to_date('15-11-1994', 'dd-mm-yyyy'), 'F', 70.75, '053-1390602', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (399, 'Rascal Galecki', to_date('20-01-1992', 'dd-mm-yyyy'), 'M', 90.88, '057-1524392', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (400, 'Lois Heche', to_date('04-04-1984', 'dd-mm-yyyy'), 'M', 97.56, '052-7122656', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (401, 'Goldie Farris', to_date('10-04-1961', 'dd-mm-yyyy'), 'F', 97.15, '053-7557696', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (402, 'Gates Gilliam', to_date('15-02-1973', 'dd-mm-yyyy'), 'F', 93.58, '057-3752913', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (403, 'Martha Venora', to_date('10-04-1968', 'dd-mm-yyyy'), 'F', 55.73, '052-5081510', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (404, 'Claude Harry', to_date('03-10-1963', 'dd-mm-yyyy'), 'M', 60.85, '053-7984760', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (405, 'King Griggs', to_date('24-01-1961', 'dd-mm-yyyy'), 'F', 61.78, '057-5124266', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (406, 'Benjamin Reno', to_date('21-02-1974', 'dd-mm-yyyy'), 'F', 98.69, '052-9019524', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (407, 'Alicia McCann', to_date('20-12-1964', 'dd-mm-yyyy'), 'M', 60.68, '052-2433691', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (408, 'Angela Dench', to_date('09-09-1990', 'dd-mm-yyyy'), 'F', 72.85, '053-9502745', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (409, 'Warren Colton', to_date('19-06-1962', 'dd-mm-yyyy'), 'M', 80.23, '059-8772638', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (410, 'Tony Wopat', to_date('11-02-1962', 'dd-mm-yyyy'), 'M', 98.9, '054-0004669', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (411, 'Marianne Carrad', to_date('10-03-1971', 'dd-mm-yyyy'), 'F', 60.36, '059-9644220', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (412, 'Lonnie Mitchell', to_date('07-08-1975', 'dd-mm-yyyy'), 'M', 89.19, '053-3185161', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (413, 'King Frakes', to_date('16-05-1992', 'dd-mm-yyyy'), 'M', 78.84, '057-0051480', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (414, 'Rosie Newman', to_date('11-10-2002', 'dd-mm-yyyy'), 'M', 62.29, '054-7914036', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (415, 'Tony Randal', to_date('28-09-1975', 'dd-mm-yyyy'), 'F', 97.49, '053-2061586', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (416, 'Vivica Lightfoo', to_date('17-06-1979', 'dd-mm-yyyy'), 'M', 53.41, '054-1102842', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (417, 'Sarah Nielsen', to_date('15-09-1986', 'dd-mm-yyyy'), 'F', 72.03, '053-5492854', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (418, 'Rade Rosas', to_date('25-08-1977', 'dd-mm-yyyy'), 'F', 76.21, '052-3486940', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (419, 'Anita Coltrane', to_date('12-09-1976', 'dd-mm-yyyy'), 'M', 61.72, '057-7594742', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (420, 'Jeroen Hobson', to_date('16-11-2000', 'dd-mm-yyyy'), 'F', 70.71, '058-8031653', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (421, 'Ivan Harary', to_date('31-08-1984', 'dd-mm-yyyy'), 'F', 50.56, '058-5196250', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (422, 'Maura Aglukark', to_date('16-12-1994', 'dd-mm-yyyy'), 'F', 86.45, '052-5466177', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (423, 'Chrissie Streep', to_date('13-04-1978', 'dd-mm-yyyy'), 'M', 95.55, '052-5146580', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (424, 'Minnie Pony', to_date('26-02-1972', 'dd-mm-yyyy'), 'F', 85.36, '052-7278991', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (425, 'Kazem Rhames', to_date('23-03-1994', 'dd-mm-yyyy'), 'F', 62.65, '058-3991089', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (426, 'Claude Amos', to_date('27-03-1964', 'dd-mm-yyyy'), 'M', 81.8, '057-1802199', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (427, 'Edie Fisher', to_date('19-03-1964', 'dd-mm-yyyy'), 'F', 81.13, '054-3943149', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (428, 'Winona Azaria', to_date('23-06-1993', 'dd-mm-yyyy'), 'M', 98.76, '059-1515951', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (429, 'Toshiro Kinski', to_date('24-10-1973', 'dd-mm-yyyy'), 'F', 98.85, '052-7196600', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (430, 'Ice Brooke', to_date('21-09-1999', 'dd-mm-yyyy'), 'M', 70.91, '052-1362004', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (431, 'Rascal Van Shel', to_date('16-08-1961', 'dd-mm-yyyy'), 'M', 66.19, '054-8678972', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (432, 'Lionel McGovern', to_date('14-10-1962', 'dd-mm-yyyy'), 'M', 90.69, '054-1837024', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (433, 'Philip Ticotin', to_date('26-07-1993', 'dd-mm-yyyy'), 'M', 69.84, '054-0298886', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (434, 'Noah Reubens', to_date('29-01-1992', 'dd-mm-yyyy'), 'M', 90.67, '057-8252174', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (435, 'Franco Zellwege', to_date('20-09-1980', 'dd-mm-yyyy'), 'M', 61.54, '053-2650693', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (436, 'Lee Morrison', to_date('04-02-1966', 'dd-mm-yyyy'), 'M', 77.41, '057-9999661', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (437, 'Edward Branagh', to_date('21-11-1968', 'dd-mm-yyyy'), 'M', 82.79, '052-2512383', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (438, 'Rhea Northam', to_date('01-09-1970', 'dd-mm-yyyy'), 'F', 92.29, '051-5305374', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (439, 'Xander Sewell', to_date('12-09-1963', 'dd-mm-yyyy'), 'M', 59.96, '051-9012250', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (440, 'Rosco Rippy', to_date('23-01-1972', 'dd-mm-yyyy'), 'F', 71.57, '051-1060189', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (441, 'Gary Rourke', to_date('30-11-1979', 'dd-mm-yyyy'), 'M', 77.19, '052-2914199', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (442, 'Hookah Shue', to_date('10-04-1999', 'dd-mm-yyyy'), 'F', 73.08, '059-0187215', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (443, 'Rich Lowe', to_date('09-07-1983', 'dd-mm-yyyy'), 'M', 64.39, '054-9313099', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (444, 'Christopher Daw', to_date('24-03-1971', 'dd-mm-yyyy'), 'M', 90.51, '053-2790810', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (445, 'Brooke Stuermer', to_date('18-01-1997', 'dd-mm-yyyy'), 'M', 81.65, '058-4600523', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (446, 'Howard Carrere', to_date('15-07-1988', 'dd-mm-yyyy'), 'M', 73.77, '057-1568440', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (447, 'Helen Neeson', to_date('10-02-1985', 'dd-mm-yyyy'), 'F', 64.42, '057-6767387', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (448, 'Hex Milsap', to_date('22-11-1968', 'dd-mm-yyyy'), 'M', 68.42, '053-5234893', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (449, 'Davis Dalley', to_date('07-01-1996', 'dd-mm-yyyy'), 'F', 84.43, '058-9913534', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (450, 'Eileen Cantrell', to_date('21-12-1991', 'dd-mm-yyyy'), 'M', 53.23, '051-5551196', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (451, 'Neneh Noseworth', to_date('20-02-1986', 'dd-mm-yyyy'), 'M', 60.58, '052-4246847', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (452, 'Isabella Nugent', to_date('18-02-1993', 'dd-mm-yyyy'), 'F', 77.56, '053-2097429', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (453, 'Terri Stuart', to_date('16-01-1961', 'dd-mm-yyyy'), 'M', 59.31, '058-4883287', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (454, 'Gates Rush', to_date('10-03-1999', 'dd-mm-yyyy'), 'M', 64, '053-8844437', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (455, 'Mint Christie', to_date('11-07-1960', 'dd-mm-yyyy'), 'F', 91.5, '058-4209981', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (456, 'Nastassja Downi', to_date('17-09-1993', 'dd-mm-yyyy'), 'M', 61.38, '059-1164679', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (457, 'Dianne Williams', to_date('16-10-1966', 'dd-mm-yyyy'), 'F', 51.45, '054-8927622', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (458, 'Humberto Kinnea', to_date('16-01-1984', 'dd-mm-yyyy'), 'M', 81.67, '054-9087494', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (459, 'Steve Candy', to_date('16-06-1965', 'dd-mm-yyyy'), 'F', 64.11, '051-8969927', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (460, 'Stewart Cleese', to_date('20-12-1991', 'dd-mm-yyyy'), 'F', 56.38, '058-4446626', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (461, 'Marc Crowell', to_date('04-08-1986', 'dd-mm-yyyy'), 'M', 74.72, '059-1440671', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (462, 'Philip Grier', to_date('05-01-1964', 'dd-mm-yyyy'), 'F', 54.41, '052-6839253', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (463, 'Jean-Luc Wakeli', to_date('04-07-1987', 'dd-mm-yyyy'), 'M', 59.39, '051-1816409', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (464, 'Suzy Walken', to_date('05-07-1998', 'dd-mm-yyyy'), 'M', 93.28, '054-4323679', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (465, 'Jennifer Dourif', to_date('31-08-1980', 'dd-mm-yyyy'), 'M', 65.84, '052-5089089', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (466, 'Juice Tyler', to_date('01-04-1975', 'dd-mm-yyyy'), 'M', 97.22, '058-5747508', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (467, 'Rose Margolyes', to_date('11-06-2001', 'dd-mm-yyyy'), 'M', 90.26, '054-1822423', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (468, 'Tim Paquin', to_date('24-05-1998', 'dd-mm-yyyy'), 'F', 61.47, '054-0474070', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (469, 'Wang Carrere', to_date('24-10-1968', 'dd-mm-yyyy'), 'F', 61.75, '058-6648607', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (470, 'Aida Negbaur', to_date('26-03-1979', 'dd-mm-yyyy'), 'F', 85.35, '052-0865036', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (471, 'James Solido', to_date('06-09-1992', 'dd-mm-yyyy'), 'M', 54.01, '054-1622013', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (472, 'Chubby Himmelma', to_date('13-02-1997', 'dd-mm-yyyy'), 'M', 60.33, '057-0964323', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (473, 'Naomi Lofgren', to_date('04-02-1973', 'dd-mm-yyyy'), 'M', 54.44, '053-4542197', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (474, 'Diane Loggins', to_date('25-06-1970', 'dd-mm-yyyy'), 'F', 96.71, '058-9286013', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (475, 'Gerald Chapman', to_date('15-03-1974', 'dd-mm-yyyy'), 'M', 85.74, '057-2577688', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (476, 'Tori Marshall', to_date('30-08-1985', 'dd-mm-yyyy'), 'M', 73.61, '057-9795401', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (477, 'Isaiah Russell', to_date('23-01-1989', 'dd-mm-yyyy'), 'F', 92.82, '051-7056499', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (478, 'Carrie Bandy', to_date('05-06-1976', 'dd-mm-yyyy'), 'M', 78.26, '058-4510023', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (479, 'Janeane Leoni', to_date('22-12-2000', 'dd-mm-yyyy'), 'M', 59.97, '059-2109957', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (480, 'Avril Navarro', to_date('05-07-1960', 'dd-mm-yyyy'), 'M', 57.06, '054-8757113', 1);
commit;
prompt 100 records committed...
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (481, 'Caroline Garza', to_date('23-07-1978', 'dd-mm-yyyy'), 'F', 60.43, '059-8840233', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (482, 'Lucy Spader', to_date('05-11-1974', 'dd-mm-yyyy'), 'F', 74.3, '057-7566215', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (483, 'Gerald Frakes', to_date('17-10-1961', 'dd-mm-yyyy'), 'M', 51.42, '059-5411253', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (484, 'Rosie Pfeiffer', to_date('06-04-1974', 'dd-mm-yyyy'), 'F', 84.51, '058-7271667', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (485, 'Ann Hartnett', to_date('10-03-1977', 'dd-mm-yyyy'), 'M', 96.84, '059-9300092', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (486, 'Patrick Hauer', to_date('19-07-1997', 'dd-mm-yyyy'), 'F', 97.31, '057-1078351', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (487, 'Joy Heslov', to_date('17-03-1998', 'dd-mm-yyyy'), 'M', 50.53, '054-7070221', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (488, 'Chad Sedaka', to_date('19-02-1960', 'dd-mm-yyyy'), 'F', 97.76, '052-3906829', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (489, 'Mary-Louise Cob', to_date('18-12-2002', 'dd-mm-yyyy'), 'M', 87.44, '051-0992861', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (490, 'Coley Gunton', to_date('13-12-1975', 'dd-mm-yyyy'), 'F', 82.51, '057-2689307', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (491, 'Lara Salonga', to_date('12-06-1989', 'dd-mm-yyyy'), 'M', 55.13, '059-8307464', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (492, 'Sheena English', to_date('20-05-1993', 'dd-mm-yyyy'), 'F', 66.26, '059-0125442', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (493, 'Mos Voight', to_date('02-10-1976', 'dd-mm-yyyy'), 'M', 83.08, '051-5542832', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (494, 'Cherry Sharp', to_date('06-09-1985', 'dd-mm-yyyy'), 'M', 76.88, '051-2980172', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (495, 'George Michael', to_date('10-01-1979', 'dd-mm-yyyy'), 'M', 77.01, '059-3765819', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (496, 'Andrae Greene', to_date('05-05-1986', 'dd-mm-yyyy'), 'M', 77.67, '059-4667024', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (497, 'Davey Depp', to_date('19-08-1992', 'dd-mm-yyyy'), 'M', 54.42, '057-0569858', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (498, 'Sam Sarsgaard', to_date('29-04-1978', 'dd-mm-yyyy'), 'M', 98.45, '053-0733371', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (499, 'Ben Idol', to_date('09-04-1998', 'dd-mm-yyyy'), 'M', 92.18, '059-1798343', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (500, 'Kathy Connelly', to_date('02-02-1981', 'dd-mm-yyyy'), 'F', 72.66, '057-7829941', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (501, 'Tramaine Polley', to_date('12-04-1998', 'dd-mm-yyyy'), 'M', 51.08, '052-8812488', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (502, 'Faye Brooks', to_date('09-03-1962', 'dd-mm-yyyy'), 'F', 64.13, '051-1552764', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (503, 'Graham DeGraw', to_date('29-03-1983', 'dd-mm-yyyy'), 'F', 53.85, '053-2498226', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (504, 'Ewan Farina', to_date('18-04-1980', 'dd-mm-yyyy'), 'F', 52.8, '058-7356116', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (505, 'Gabrielle Vassa', to_date('23-03-1970', 'dd-mm-yyyy'), 'M', 88.06, '057-9586574', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (506, 'Jeffrey Colton', to_date('03-01-1982', 'dd-mm-yyyy'), 'F', 65.18, '052-2884995', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (507, 'Freddy Cantrell', to_date('04-12-1999', 'dd-mm-yyyy'), 'F', 75.45, '059-5986573', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (508, 'Miriam Rourke', to_date('17-11-1982', 'dd-mm-yyyy'), 'M', 73.4, '054-0657710', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (509, 'Zooey Marx', to_date('08-08-2002', 'dd-mm-yyyy'), 'F', 55.35, '054-5419702', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (510, 'Robby Kristoffe', to_date('15-06-1966', 'dd-mm-yyyy'), 'F', 91.74, '058-1672686', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (511, 'Taye Goodman', to_date('10-02-1979', 'dd-mm-yyyy'), 'F', 89.03, '052-7622603', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (512, 'Cheech Osmond', to_date('07-12-1991', 'dd-mm-yyyy'), 'F', 50.44, '058-6228027', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (513, 'Jeff Murdock', to_date('28-03-1972', 'dd-mm-yyyy'), 'M', 51.06, '052-3194692', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (514, 'Penelope Blades', to_date('06-12-1984', 'dd-mm-yyyy'), 'F', 83.62, '057-5404160', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (515, 'Janeane Sanders', to_date('29-01-1981', 'dd-mm-yyyy'), 'F', 58.57, '054-8537325', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (516, 'Lauren Davies', to_date('20-05-1970', 'dd-mm-yyyy'), 'M', 71.65, '053-3129124', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (517, 'Vivica Anderson', to_date('12-08-1974', 'dd-mm-yyyy'), 'M', 69.42, '051-5755405', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (518, 'Alana Carter', to_date('11-09-1991', 'dd-mm-yyyy'), 'M', 95.34, '054-9149656', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (519, 'Jena Balin', to_date('30-01-1992', 'dd-mm-yyyy'), 'F', 94.33, '054-7787522', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (520, 'Brad Kristoffer', to_date('08-06-1987', 'dd-mm-yyyy'), 'F', 58.5, '053-2654975', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (241, 'Terence Cattral', to_date('17-09-1967', 'dd-mm-yyyy'), 'M', 76.12, '059-8926844', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (242, 'Cuba Cruz', to_date('16-05-1984', 'dd-mm-yyyy'), 'M', 51.05, '059-3135381', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (243, 'Wesley Braugher', to_date('15-04-2001', 'dd-mm-yyyy'), 'M', 52.83, '057-4369560', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (244, 'Oliver Benoit', to_date('26-10-1975', 'dd-mm-yyyy'), 'M', 63.82, '057-5366187', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (245, 'Janeane Rollins', to_date('07-09-1984', 'dd-mm-yyyy'), 'F', 80.05, '058-4432215', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (246, 'Stevie Bacharac', to_date('22-07-1987', 'dd-mm-yyyy'), 'M', 91.1, '054-3991261', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (247, 'Lupe Ness', to_date('03-01-1990', 'dd-mm-yyyy'), 'F', 85.19, '057-2549167', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (248, 'Gary Cook', to_date('24-06-1988', 'dd-mm-yyyy'), 'M', 88.82, '058-9740451', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (249, 'Carol Osmond', to_date('11-10-1985', 'dd-mm-yyyy'), 'M', 92.83, '054-6082223', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (250, 'Kay Phifer', to_date('03-05-1996', 'dd-mm-yyyy'), 'M', 85.99, '058-1322851', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (251, 'Lili Hayek', to_date('08-12-1971', 'dd-mm-yyyy'), 'F', 71.35, '059-0991801', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (252, 'Sara Raybon', to_date('11-03-1992', 'dd-mm-yyyy'), 'M', 51.4, '052-6093792', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (253, 'Arnold Tomlin', to_date('19-04-1980', 'dd-mm-yyyy'), 'F', 64.15, '057-9320885', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (254, 'Liev Vanian', to_date('13-07-1992', 'dd-mm-yyyy'), 'F', 74.64, '052-7085469', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (255, 'Kay Gyllenhaal', to_date('05-08-1995', 'dd-mm-yyyy'), 'F', 58.88, '054-4932305', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (256, 'Holly Chandler', to_date('06-06-1987', 'dd-mm-yyyy'), 'M', 87.26, '058-5835507', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (257, 'Gin Jolie', to_date('09-05-2002', 'dd-mm-yyyy'), 'M', 66.2, '054-9022022', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (258, 'Renee Kramer', to_date('30-07-1985', 'dd-mm-yyyy'), 'M', 76.84, '054-3269796', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (259, 'Garland Levert', to_date('26-11-1996', 'dd-mm-yyyy'), 'F', 93.86, '059-4480129', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (260, 'Herbie Day-Lewi', to_date('30-03-1986', 'dd-mm-yyyy'), 'F', 95.63, '054-8924502', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (261, 'Danny Wariner', to_date('17-09-1981', 'dd-mm-yyyy'), 'F', 80.83, '054-9866012', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (262, 'Elijah Rhodes', to_date('05-08-1966', 'dd-mm-yyyy'), 'F', 58.46, '059-6413427', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (263, 'Ed Lovitz', to_date('31-03-1977', 'dd-mm-yyyy'), 'F', 87.65, '051-5070929', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (264, 'Nancy Brody', to_date('24-10-1977', 'dd-mm-yyyy'), 'F', 61.78, '058-1957011', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (265, 'Robbie Crouch', to_date('18-11-1998', 'dd-mm-yyyy'), 'F', 57.54, '059-2141960', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (266, 'Chloe Roundtree', to_date('06-05-1970', 'dd-mm-yyyy'), 'M', 90, '051-9640556', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (267, 'Tanya Holliday', to_date('21-10-1983', 'dd-mm-yyyy'), 'F', 51.27, '059-8782798', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (268, 'Robert Benson', to_date('12-05-1987', 'dd-mm-yyyy'), 'M', 80.9, '058-4039343', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (269, 'Lynette Idol', to_date('25-04-1969', 'dd-mm-yyyy'), 'M', 68.58, '053-6042883', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (270, 'Isaiah Pollak', to_date('02-06-1988', 'dd-mm-yyyy'), 'F', 54.82, '059-6121232', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (271, 'Patty Woodard', to_date('16-08-2001', 'dd-mm-yyyy'), 'M', 55.18, '057-1926860', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (272, 'Patricia Child', to_date('08-10-1988', 'dd-mm-yyyy'), 'M', 93.03, '058-9272381', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (273, 'Dwight Rosselli', to_date('24-10-1974', 'dd-mm-yyyy'), 'M', 67, '057-9078730', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (274, 'Martin Bedelia', to_date('11-12-1976', 'dd-mm-yyyy'), 'F', 80.15, '054-8986706', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (275, 'Domingo Duchovn', to_date('08-03-1988', 'dd-mm-yyyy'), 'F', 88.13, '051-3597159', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (276, 'Anjelica Morton', to_date('24-02-1979', 'dd-mm-yyyy'), 'M', 90.07, '052-7061772', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (277, 'Dabney Pleasenc', to_date('11-03-1994', 'dd-mm-yyyy'), 'F', 83.95, '057-4355150', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (278, 'Alice Platt', to_date('05-01-1969', 'dd-mm-yyyy'), 'F', 65.08, '057-8978555', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (279, 'Donal Gibbons', to_date('05-07-1984', 'dd-mm-yyyy'), 'M', 64.06, '059-7111288', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (280, 'Emilio Biel', to_date('26-02-1984', 'dd-mm-yyyy'), 'F', 98.42, '059-4532104', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (281, 'Rachel Plummer', to_date('14-01-1963', 'dd-mm-yyyy'), 'M', 98.13, '052-7387979', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (282, 'Christine Singl', to_date('16-10-1989', 'dd-mm-yyyy'), 'M', 85.4, '052-8196804', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (283, 'Kitty Holiday', to_date('21-02-1966', 'dd-mm-yyyy'), 'M', 86.67, '051-0980504', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (284, 'Kid Khan', to_date('09-03-1963', 'dd-mm-yyyy'), 'F', 86.39, '052-3044333', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (285, 'Barry Brock', to_date('22-10-1998', 'dd-mm-yyyy'), 'F', 59.77, '057-9455737', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (286, 'Tyrone David', to_date('02-10-2001', 'dd-mm-yyyy'), 'M', 84.53, '054-2820530', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (287, 'Clive Butler', to_date('04-12-1993', 'dd-mm-yyyy'), 'M', 87.64, '057-2970449', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (288, 'Josh Collie', to_date('06-05-2002', 'dd-mm-yyyy'), 'M', 50.17, '059-1941163', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (289, 'Murray Hirsch', to_date('02-02-1961', 'dd-mm-yyyy'), 'F', 90.22, '053-1152108', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (290, 'Marisa Bandy', to_date('07-10-1984', 'dd-mm-yyyy'), 'F', 53.82, '058-4041877', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (291, 'Andrea Vassar', to_date('17-05-1963', 'dd-mm-yyyy'), 'F', 89.82, '059-2666008', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (292, 'Wayne Holden', to_date('21-03-1972', 'dd-mm-yyyy'), 'F', 59.18, '053-6190063', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (293, 'Patrick Steenbu', to_date('29-07-1998', 'dd-mm-yyyy'), 'F', 50.37, '054-0188459', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (294, 'Nicole Ryder', to_date('14-08-1960', 'dd-mm-yyyy'), 'F', 69.65, '054-6393094', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (295, 'Taye Adams', to_date('10-12-1989', 'dd-mm-yyyy'), 'F', 76.05, '058-4049772', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (296, 'Irene Archer', to_date('02-05-1976', 'dd-mm-yyyy'), 'F', 88.27, '051-2071290', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (297, 'Treat Foxx', to_date('10-05-1993', 'dd-mm-yyyy'), 'F', 88.3, '052-7065849', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (298, 'Derrick Rispoli', to_date('02-05-1985', 'dd-mm-yyyy'), 'F', 85.88, '059-9828291', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (299, 'Emerson Hanley', to_date('14-01-1965', 'dd-mm-yyyy'), 'F', 51.46, '054-5576282', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (300, 'Lindsey Vanian', to_date('15-09-1964', 'dd-mm-yyyy'), 'M', 67.83, '053-9782506', 2);
commit;
prompt 200 records committed...
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (301, 'Bernie Pitt', to_date('02-03-1966', 'dd-mm-yyyy'), 'F', 79.29, '054-5855808', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (302, 'Meredith Hutch', to_date('11-03-1966', 'dd-mm-yyyy'), 'F', 62.26, '052-8268471', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (303, 'Renee Rebhorn', to_date('26-01-1984', 'dd-mm-yyyy'), 'F', 91.89, '052-6497596', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (304, 'Mint Dorff', to_date('08-01-1997', 'dd-mm-yyyy'), 'M', 65.87, '053-8360241', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (305, 'Jessica Arquett', to_date('09-08-1964', 'dd-mm-yyyy'), 'M', 59.99, '051-7287696', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (306, 'Merle Barnett', to_date('29-08-1970', 'dd-mm-yyyy'), 'F', 60.01, '052-3430495', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (307, 'Samuel Schreibe', to_date('01-12-1993', 'dd-mm-yyyy'), 'M', 65.57, '052-7231704', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (308, 'Rory Stuart', to_date('11-10-1960', 'dd-mm-yyyy'), 'M', 64.86, '051-6573292', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (309, 'Carla Curfman', to_date('06-04-1981', 'dd-mm-yyyy'), 'F', 50.91, '057-0579226', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (310, 'Lionel Mitra', to_date('05-02-1972', 'dd-mm-yyyy'), 'F', 58.23, '057-7560029', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (311, 'Phoebe Conroy', to_date('19-02-1985', 'dd-mm-yyyy'), 'F', 72.58, '059-8536535', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (312, 'Timothy Conlee', to_date('19-08-1967', 'dd-mm-yyyy'), 'M', 68.12, '052-9336982', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (313, 'Dabney Allan', to_date('29-07-1999', 'dd-mm-yyyy'), 'M', 66.14, '057-6627283', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (314, 'Amy Donelly', to_date('07-04-1970', 'dd-mm-yyyy'), 'M', 92.36, '057-0286586', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (315, 'Brothers Assant', to_date('12-10-1976', 'dd-mm-yyyy'), 'M', 55.71, '059-9086055', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (316, 'Timothy O''Neal', to_date('04-10-1964', 'dd-mm-yyyy'), 'F', 83.39, '052-4068645', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (317, 'Gord Lyonne', to_date('11-11-1993', 'dd-mm-yyyy'), 'F', 81.63, '054-2509720', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (318, 'Adrien Cetera', to_date('05-03-1970', 'dd-mm-yyyy'), 'M', 96.16, '057-0447484', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (319, 'Mili Cross', to_date('15-02-1982', 'dd-mm-yyyy'), 'F', 72.45, '052-8722160', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (320, 'Ray Shalhoub', to_date('02-02-1974', 'dd-mm-yyyy'), 'M', 94.53, '051-5492601', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (321, 'Ruth Easton', to_date('06-01-1998', 'dd-mm-yyyy'), 'M', 75.85, '053-7950565', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (322, 'Malcolm Sevigny', to_date('13-11-1997', 'dd-mm-yyyy'), 'M', 87.32, '053-8828535', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (323, 'Adam Briscoe', to_date('24-02-1977', 'dd-mm-yyyy'), 'F', 85.06, '052-2437316', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (324, 'Nicole Mifune', to_date('19-09-1976', 'dd-mm-yyyy'), 'F', 97.58, '054-4236432', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (325, 'Jena Cleese', to_date('15-10-1976', 'dd-mm-yyyy'), 'F', 93.09, '051-5735212', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (326, 'Irene Carradine', to_date('20-04-1972', 'dd-mm-yyyy'), 'M', 91.26, '051-8375800', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (327, 'Radney Ryan', to_date('04-06-1998', 'dd-mm-yyyy'), 'M', 96.03, '057-1346294', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (328, 'Suzy Stowe', to_date('21-08-1987', 'dd-mm-yyyy'), 'M', 70.95, '052-2946615', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (329, 'Dick Kapanka', to_date('15-01-1971', 'dd-mm-yyyy'), 'F', 50.54, '058-4776588', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (330, 'Illeana Duke', to_date('10-03-1992', 'dd-mm-yyyy'), 'M', 52.41, '053-6749002', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (331, 'Hikaru Dalton', to_date('25-12-1986', 'dd-mm-yyyy'), 'F', 78.88, '058-9520413', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (332, 'Cledus Root', to_date('07-11-2001', 'dd-mm-yyyy'), 'M', 86.21, '057-2667427', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (333, 'Alan Iglesias', to_date('01-03-2000', 'dd-mm-yyyy'), 'M', 76.41, '051-0557202', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (334, 'Dianne Westerbe', to_date('02-06-1973', 'dd-mm-yyyy'), 'F', 85.87, '058-9655932', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (335, 'Chris Goodall', to_date('30-08-1977', 'dd-mm-yyyy'), 'F', 54.44, '052-9016159', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (336, 'Pelvic Piven', to_date('31-08-1974', 'dd-mm-yyyy'), 'M', 51.2, '054-6937483', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (337, 'Natacha Mahoney', to_date('19-11-2000', 'dd-mm-yyyy'), 'M', 54.42, '057-2963104', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (338, 'Carolyn Ponty', to_date('06-12-1968', 'dd-mm-yyyy'), 'M', 75.08, '059-7071312', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (339, 'Rufus Stewart', to_date('29-04-1989', 'dd-mm-yyyy'), 'F', 62.14, '057-4911433', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (340, 'Denzel Winger', to_date('10-07-1963', 'dd-mm-yyyy'), 'F', 72.66, '057-7363335', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (341, 'Simon Loveless', to_date('06-06-1993', 'dd-mm-yyyy'), 'M', 58.09, '052-3988587', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (342, 'Jeff Hirsch', to_date('30-08-1978', 'dd-mm-yyyy'), 'M', 80.82, '054-3283582', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (343, 'Lynette Johanss', to_date('13-05-1997', 'dd-mm-yyyy'), 'F', 62.46, '053-4452681', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (344, 'Rick Brooke', to_date('14-10-1971', 'dd-mm-yyyy'), 'F', 72.11, '058-5724104', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (345, 'Hilton Brothers', to_date('04-07-1991', 'dd-mm-yyyy'), 'M', 90.96, '054-4413048', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (346, 'Bob Hannah', to_date('30-08-1961', 'dd-mm-yyyy'), 'M', 51.02, '057-0689168', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (347, 'Wallace Haggard', to_date('10-04-1962', 'dd-mm-yyyy'), 'F', 77.17, '051-8213362', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (348, 'Rosario Eder', to_date('11-03-1970', 'dd-mm-yyyy'), 'M', 77.46, '052-4383219', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (349, 'Natalie Capshaw', to_date('16-04-1977', 'dd-mm-yyyy'), 'F', 83.25, '054-7010438', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (350, 'Rueben Dutton', to_date('28-10-1977', 'dd-mm-yyyy'), 'M', 71.27, '057-4911255', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (351, 'Loren Willis', to_date('15-10-1988', 'dd-mm-yyyy'), 'F', 84.46, '057-1718950', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (352, 'Harry Holm', to_date('22-01-1975', 'dd-mm-yyyy'), 'M', 85.11, '051-8872068', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (353, 'Colleen Mathis', to_date('17-06-1976', 'dd-mm-yyyy'), 'F', 75.25, '051-0558742', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (354, 'Kevin Carmen', to_date('25-11-1989', 'dd-mm-yyyy'), 'M', 79.88, '051-2105335', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (355, 'Yaphet Mantegna', to_date('17-05-1993', 'dd-mm-yyyy'), 'F', 76.75, '057-1527885', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (356, 'Millie Armatrad', to_date('14-01-1982', 'dd-mm-yyyy'), 'M', 56.85, '057-5861696', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (357, 'Howard Stevens', to_date('14-06-1968', 'dd-mm-yyyy'), 'F', 56.01, '053-1033219', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (358, 'Jeffrey Yankovi', to_date('07-01-1985', 'dd-mm-yyyy'), 'F', 69.38, '053-6347306', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (359, 'Giancarlo Gille', to_date('02-02-1994', 'dd-mm-yyyy'), 'M', 78.56, '053-5182865', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (360, 'Emm Flanagan', to_date('31-10-1997', 'dd-mm-yyyy'), 'M', 65.04, '054-2697239', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (361, 'Kieran Danger', to_date('01-08-2000', 'dd-mm-yyyy'), 'M', 76.87, '059-3653651', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (362, 'Armin Peniston', to_date('09-01-1976', 'dd-mm-yyyy'), 'M', 85.16, '052-0421213', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (363, 'Liv Makowicz', to_date('14-11-1985', 'dd-mm-yyyy'), 'F', 93.88, '058-7751267', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (364, 'Jimmie Reiner', to_date('23-04-1968', 'dd-mm-yyyy'), 'F', 80.42, '057-2260453', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (365, 'Olympia Hewitt', to_date('31-07-2001', 'dd-mm-yyyy'), 'M', 88.37, '051-4004135', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (366, 'Vanessa Parsons', to_date('07-02-1979', 'dd-mm-yyyy'), 'M', 84.46, '057-3292202', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (367, 'Kyra Love', to_date('25-01-1996', 'dd-mm-yyyy'), 'F', 74.6, '052-9591453', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (368, 'Rod Evett', to_date('17-02-1972', 'dd-mm-yyyy'), 'F', 50.11, '054-7075722', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (369, 'Tzi Breslin', to_date('28-12-2001', 'dd-mm-yyyy'), 'M', 73.96, '051-4544544', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (370, 'Rob Judd', to_date('31-08-1989', 'dd-mm-yyyy'), 'M', 86.56, '058-3207497', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (371, 'Latin Hershey', to_date('02-02-1986', 'dd-mm-yyyy'), 'F', 86.27, '051-2100005', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (372, 'Ian Washington', to_date('04-05-1974', 'dd-mm-yyyy'), 'M', 93.6, '053-6028852', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (373, 'Cledus Hartnett', to_date('16-05-1982', 'dd-mm-yyyy'), 'F', 84.13, '051-4327931', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (374, 'Naomi Cook', to_date('03-02-2000', 'dd-mm-yyyy'), 'M', 80.82, '051-5205484', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (375, 'Dwight Flemyng', to_date('23-01-1977', 'dd-mm-yyyy'), 'M', 61.5, '057-4751330', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (376, 'Emmylou Coughla', to_date('18-11-1963', 'dd-mm-yyyy'), 'M', 63.62, '057-8231007', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (377, 'Luke Johansson', to_date('21-05-1965', 'dd-mm-yyyy'), 'F', 51.02, '059-0138620', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (378, 'Phoebe Sawa', to_date('26-02-1970', 'dd-mm-yyyy'), 'M', 69.56, '057-0691088', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (379, 'Al Stoltz', to_date('04-01-1987', 'dd-mm-yyyy'), 'M', 91.63, '054-8478246', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (380, 'Jamie Gooding', to_date('02-12-1996', 'dd-mm-yyyy'), 'F', 97.95, '058-8794399', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (225, 'Madeline Phifer', to_date('09-11-1977', 'dd-mm-yyyy'), 'M', 69.66, '059-6864083', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (226, 'Dean Bruce', to_date('11-10-1980', 'dd-mm-yyyy'), 'M', 50.11, '059-5430819', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (227, 'Miguel Dafoe', to_date('28-11-1985', 'dd-mm-yyyy'), 'M', 64.72, '058-4386302', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (228, 'Liam Gill', to_date('10-03-1963', 'dd-mm-yyyy'), 'F', 84.25, '053-8076139', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (229, 'Vertical Skarsg', to_date('20-04-1968', 'dd-mm-yyyy'), 'M', 87.47, '054-1271246', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (230, 'Belinda Greenwo', to_date('13-12-1969', 'dd-mm-yyyy'), 'M', 74.12, '052-4476476', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (231, 'Paul Wincott', to_date('18-08-1988', 'dd-mm-yyyy'), 'M', 87.43, '058-6426298', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (232, 'Nelly Noseworth', to_date('10-03-1993', 'dd-mm-yyyy'), 'F', 80.16, '059-3016424', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (233, 'Josh Ramirez', to_date('12-02-1998', 'dd-mm-yyyy'), 'M', 59.86, '053-3767219', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (234, 'Clarence Carter', to_date('08-11-1995', 'dd-mm-yyyy'), 'F', 90.12, '059-0921640', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (235, 'Kurt Reiner', to_date('02-03-1985', 'dd-mm-yyyy'), 'M', 95.54, '058-4085439', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (236, 'Malcolm McGill', to_date('27-08-1961', 'dd-mm-yyyy'), 'F', 84.9, '058-4758941', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (237, 'Rik Arkenstone', to_date('13-03-1997', 'dd-mm-yyyy'), 'F', 57.61, '057-2094992', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (238, 'Dwight Burstyn', to_date('21-08-1965', 'dd-mm-yyyy'), 'M', 80.5, '059-7670704', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (239, 'Emma Berkoff', to_date('25-10-1986', 'dd-mm-yyyy'), 'M', 68.28, '054-1024996', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (240, 'Darius Li', to_date('16-12-1973', 'dd-mm-yyyy'), 'M', 83.54, '053-4620414', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (100, 'Ritchie Whitfor', to_date('26-06-1990', 'dd-mm-yyyy'), 'F', 50.98, '054-6971298', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (101, 'Miranda Watson', to_date('18-03-2000', 'dd-mm-yyyy'), 'M', 71, '057-2252805', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (102, 'Luke Posener', to_date('16-02-1969', 'dd-mm-yyyy'), 'M', 54.22, '057-3986689', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (103, 'Maury Finney', to_date('27-11-1971', 'dd-mm-yyyy'), 'F', 55.23, '052-5944829', 6);
commit;
prompt 300 records committed...
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (104, 'Toni Beckham', to_date('16-11-1961', 'dd-mm-yyyy'), 'F', 63.15, '051-0560636', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (105, 'Pat Maxwell', to_date('13-04-1970', 'dd-mm-yyyy'), 'F', 76.75, '051-6324677', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (106, 'Kirk Chandler', to_date('12-10-1971', 'dd-mm-yyyy'), 'F', 91.98, '059-8574854', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (107, 'Rob Diesel', to_date('08-11-1992', 'dd-mm-yyyy'), 'M', 63.64, '051-4318857', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (108, 'Gilbert Crow', to_date('11-10-1963', 'dd-mm-yyyy'), 'F', 85.67, '053-3235194', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (109, 'Dylan Hynde', to_date('13-11-1993', 'dd-mm-yyyy'), 'F', 61.37, '051-1588940', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (110, 'Frances Karyo', to_date('25-03-1972', 'dd-mm-yyyy'), 'F', 63.23, '057-9759240', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (111, 'Celia Jenkins', to_date('04-03-1968', 'dd-mm-yyyy'), 'M', 76.94, '054-8706397', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (112, 'Guy Murray', to_date('09-06-1969', 'dd-mm-yyyy'), 'M', 58.33, '058-1363303', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (113, 'Sophie Norton', to_date('08-11-1978', 'dd-mm-yyyy'), 'F', 72.55, '054-2260572', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (114, 'Cuba Thornton', to_date('14-11-1980', 'dd-mm-yyyy'), 'M', 84.26, '059-8945951', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (115, 'Marty Osmond', to_date('19-05-1991', 'dd-mm-yyyy'), 'M', 68.54, '057-3863321', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (116, 'Renee Scott', to_date('18-05-1971', 'dd-mm-yyyy'), 'M', 63.8, '053-7104960', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (117, 'Hikaru Burton', to_date('13-10-1979', 'dd-mm-yyyy'), 'F', 62.05, '059-5038139', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (118, 'Shirley Child', to_date('07-08-1970', 'dd-mm-yyyy'), 'M', 87.13, '054-3808892', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (119, 'Willem Foxx', to_date('03-03-1994', 'dd-mm-yyyy'), 'F', 54.21, '052-0052156', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (120, 'Natacha Miles', to_date('04-03-1988', 'dd-mm-yyyy'), 'F', 94.23, '053-3599367', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (121, 'Dwight Lee', to_date('25-01-2002', 'dd-mm-yyyy'), 'F', 79.11, '058-7497980', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (122, 'Judy Lithgow', to_date('23-11-1980', 'dd-mm-yyyy'), 'M', 88.17, '059-0217774', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (123, 'Rosco Scaggs', to_date('07-03-1969', 'dd-mm-yyyy'), 'F', 93.95, '059-6849325', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (124, 'Johnny Stevens', to_date('31-08-1985', 'dd-mm-yyyy'), 'M', 71.92, '053-3973123', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (125, 'Collin Matarazz', to_date('15-04-1976', 'dd-mm-yyyy'), 'M', 62.25, '052-8821273', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (126, 'Marisa Himmelma', to_date('09-12-1979', 'dd-mm-yyyy'), 'M', 76.12, '053-8403907', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (127, 'Ben Devine', to_date('31-07-1981', 'dd-mm-yyyy'), 'M', 91.87, '051-7169925', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (128, 'Grace Cohn', to_date('08-04-1976', 'dd-mm-yyyy'), 'F', 77.74, '057-0895630', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (129, 'Hugo Winans', to_date('28-11-1994', 'dd-mm-yyyy'), 'F', 59.78, '053-3892703', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (130, 'Edgar Willis', to_date('27-11-1995', 'dd-mm-yyyy'), 'M', 90.33, '054-9037529', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (131, 'Bernie Blanchet', to_date('10-11-1970', 'dd-mm-yyyy'), 'M', 84.16, '053-0395901', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (132, 'Judd McConaughe', to_date('08-08-1969', 'dd-mm-yyyy'), 'M', 92.54, '053-4495034', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (133, 'Illeana Huston', to_date('25-10-2000', 'dd-mm-yyyy'), 'M', 57.08, '059-8308566', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (134, 'Catherine Phoen', to_date('29-06-2001', 'dd-mm-yyyy'), 'M', 73.09, '052-5450216', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (135, 'Goran Mirren', to_date('11-06-1982', 'dd-mm-yyyy'), 'F', 92.3, '054-5835771', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (136, 'Leo Penn', to_date('02-10-1966', 'dd-mm-yyyy'), 'M', 97.88, '052-3146198', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (137, 'Oliver Moss', to_date('29-08-1993', 'dd-mm-yyyy'), 'M', 61.71, '057-1624501', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (138, 'Simon Davison', to_date('20-05-1996', 'dd-mm-yyyy'), 'M', 95.06, '059-5662397', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (139, 'Aaron Skaggs', to_date('25-04-1961', 'dd-mm-yyyy'), 'M', 52.19, '058-1842195', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (140, 'Humberto Prinze', to_date('18-05-2000', 'dd-mm-yyyy'), 'F', 67.74, '054-3995960', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (141, 'Ronny Hewitt', to_date('20-01-1979', 'dd-mm-yyyy'), 'M', 60.01, '059-2330229', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (142, 'Darren McGinley', to_date('20-09-1968', 'dd-mm-yyyy'), 'F', 77.39, '058-2314031', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (143, 'Rachel Weiland', to_date('29-01-1994', 'dd-mm-yyyy'), 'F', 79.72, '059-2444905', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (144, 'Bette Matheson', to_date('03-08-1997', 'dd-mm-yyyy'), 'M', 83.99, '053-0615494', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (146, 'Emerson Reeve', to_date('09-02-1970', 'dd-mm-yyyy'), 'F', 98.26, '052-2342812', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (147, 'First Buckingha', to_date('13-01-1978', 'dd-mm-yyyy'), 'M', 69.45, '053-4728110', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (148, 'Mac Taylor', to_date('08-02-1964', 'dd-mm-yyyy'), 'F', 60.78, '058-7255841', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (149, 'Mitchell Crimso', to_date('02-09-1973', 'dd-mm-yyyy'), 'F', 91.19, '059-3242018', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (150, 'Olga Detmer', to_date('03-09-1970', 'dd-mm-yyyy'), 'M', 96.62, '052-8650374', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (151, 'Meg Sarandon', to_date('01-08-1997', 'dd-mm-yyyy'), 'F', 75.85, '054-2357699', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (152, 'Barry Blackmore', to_date('25-08-1992', 'dd-mm-yyyy'), 'F', 59.24, '054-6386893', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (153, 'Merillee Giamat', to_date('21-09-1974', 'dd-mm-yyyy'), 'F', 93.93, '053-6917893', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (154, 'Kathleen Close', to_date('03-01-1985', 'dd-mm-yyyy'), 'M', 64.39, '058-3595772', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (155, 'Petula Garfunke', to_date('14-08-1997', 'dd-mm-yyyy'), 'M', 92.53, '051-7343217', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (156, 'Fairuza Holland', to_date('12-07-1983', 'dd-mm-yyyy'), 'M', 88.33, '054-5853057', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (157, 'Thora Prinze', to_date('26-12-1967', 'dd-mm-yyyy'), 'F', 92.21, '059-2364498', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (158, 'Cherry Bragg', to_date('04-04-2001', 'dd-mm-yyyy'), 'F', 53.64, '057-5148693', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (159, 'Leon Bassett', to_date('30-08-1988', 'dd-mm-yyyy'), 'M', 89.44, '058-9510521', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (160, 'Laura Yankovic', to_date('30-01-1963', 'dd-mm-yyyy'), 'F', 77.59, '057-5335680', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (161, 'Cyndi Coburn', to_date('22-03-1981', 'dd-mm-yyyy'), 'M', 55.36, '057-4240315', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (162, 'Danny Paquin', to_date('04-06-1998', 'dd-mm-yyyy'), 'F', 77.57, '058-0349765', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (163, 'Andy Lopez', to_date('11-09-1975', 'dd-mm-yyyy'), 'M', 70.04, '057-6981345', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (164, 'Juice Ness', to_date('13-03-1993', 'dd-mm-yyyy'), 'F', 50.56, '051-5643677', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (165, 'Thomas Oldman', to_date('29-09-1968', 'dd-mm-yyyy'), 'M', 65.68, '058-0950484', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (166, 'Clay Brooks', to_date('31-12-1975', 'dd-mm-yyyy'), 'F', 75.62, '057-9961928', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (167, 'Meredith Kattan', to_date('22-12-1967', 'dd-mm-yyyy'), 'M', 91.07, '054-7628579', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (168, 'Mia Snow', to_date('17-02-1962', 'dd-mm-yyyy'), 'F', 84.52, '051-3813115', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (169, 'Veruca Dern', to_date('11-02-1982', 'dd-mm-yyyy'), 'F', 97.39, '058-5218062', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (170, 'Anne Lofgren', to_date('10-03-1986', 'dd-mm-yyyy'), 'M', 71.93, '054-2853710', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (171, 'Kay DiCaprio', to_date('02-07-1992', 'dd-mm-yyyy'), 'M', 85.35, '057-6902885', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (172, 'Jeroen Kattan', to_date('26-08-1973', 'dd-mm-yyyy'), 'F', 80.58, '058-8918088', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (173, 'Diane Conley', to_date('07-09-1998', 'dd-mm-yyyy'), 'F', 86.82, '051-0609689', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (174, 'Maxine McKennit', to_date('13-12-1963', 'dd-mm-yyyy'), 'M', 72.78, '058-9666528', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (175, 'Hope Short', to_date('28-01-1971', 'dd-mm-yyyy'), 'M', 58.44, '052-2853961', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (176, 'Jon Brothers', to_date('17-11-1961', 'dd-mm-yyyy'), 'M', 95.23, '054-0397253', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (177, 'Eddie Mellencam', to_date('20-03-1996', 'dd-mm-yyyy'), 'M', 82.65, '054-9833277', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (178, 'Gina Zevon', to_date('20-07-1985', 'dd-mm-yyyy'), 'M', 80.28, '054-6565493', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (179, 'Ronnie Marley', to_date('21-01-1990', 'dd-mm-yyyy'), 'M', 54.04, '052-7398873', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (180, 'Lloyd Penders', to_date('04-01-1999', 'dd-mm-yyyy'), 'F', 96.56, '057-9064594', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (181, 'Holland Isaak', to_date('28-12-1985', 'dd-mm-yyyy'), 'M', 92.44, '059-4483907', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (182, 'Alfred Quinn', to_date('23-11-1995', 'dd-mm-yyyy'), 'M', 83.63, '053-6403911', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (183, 'Shelby Sample', to_date('06-12-1979', 'dd-mm-yyyy'), 'F', 98.95, '057-4912500', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (184, 'Hilton Sevenfol', to_date('17-11-2000', 'dd-mm-yyyy'), 'F', 69.56, '052-0211819', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (185, 'Lily Shannon', to_date('28-03-1993', 'dd-mm-yyyy'), 'F', 80.57, '057-0798377', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (186, 'Gilbert Cassidy', to_date('05-07-1996', 'dd-mm-yyyy'), 'M', 86.24, '051-4164724', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (187, 'Julianne Menike', to_date('16-12-2002', 'dd-mm-yyyy'), 'M', 63.62, '054-7642732', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (188, 'Glenn Stuermer', to_date('05-05-1991', 'dd-mm-yyyy'), 'F', 98.75, '052-7130622', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (189, 'Cary Mann', to_date('25-09-1998', 'dd-mm-yyyy'), 'F', 85.84, '052-6008393', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (190, 'Rachel Dillon', to_date('08-08-1999', 'dd-mm-yyyy'), 'M', 66.69, '053-4362383', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (191, 'Walter Camp', to_date('02-07-1961', 'dd-mm-yyyy'), 'M', 50.01, '057-8109777', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (192, 'Yolanda Ripley', to_date('15-08-1979', 'dd-mm-yyyy'), 'M', 80.4, '052-3497085', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (193, 'Rachid Tomei', to_date('25-01-1999', 'dd-mm-yyyy'), 'M', 56.95, '052-5115386', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (194, 'Olympia MacIsaa', to_date('22-01-1963', 'dd-mm-yyyy'), 'F', 70.75, '058-8004652', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (195, 'Leslie Coburn', to_date('03-11-1974', 'dd-mm-yyyy'), 'M', 50.67, '052-2848040', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (196, 'Mos Shelton', to_date('28-09-2002', 'dd-mm-yyyy'), 'F', 61.75, '054-2018256', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (197, 'Melanie Harriso', to_date('13-02-1983', 'dd-mm-yyyy'), 'F', 72.99, '054-8999494', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (198, 'Giancarlo Harar', to_date('29-05-1994', 'dd-mm-yyyy'), 'F', 88.95, '052-2283781', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (199, 'Aimee Forrest', to_date('27-01-1979', 'dd-mm-yyyy'), 'F', 98.37, '052-4571407', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (200, 'Lennie Cobbs', to_date('24-03-1961', 'dd-mm-yyyy'), 'F', 92.71, '052-7528944', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (201, 'Demi Grier', to_date('05-09-1994', 'dd-mm-yyyy'), 'M', 83.66, '059-7265808', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (202, 'Demi Hayes', to_date('13-02-1961', 'dd-mm-yyyy'), 'F', 53.82, '051-8420086', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (203, 'Lizzy Greenwood', to_date('26-10-1995', 'dd-mm-yyyy'), 'M', 88.1, '057-2372174', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (204, 'Sophie Mellenca', to_date('20-01-1966', 'dd-mm-yyyy'), 'F', 68.64, '052-8697244', 1);
commit;
prompt 400 records committed...
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (205, 'Leelee Douglas', to_date('23-08-1987', 'dd-mm-yyyy'), 'M', 79.52, '053-0749094', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (206, 'Miko Lipnicki', to_date('06-09-1990', 'dd-mm-yyyy'), 'M', 69.27, '054-0694194', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (207, 'Rory Crimson', to_date('10-12-1972', 'dd-mm-yyyy'), 'F', 65.25, '054-0948782', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (208, 'Marina Aykroyd', to_date('09-02-1964', 'dd-mm-yyyy'), 'M', 93.39, '053-0610098', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (209, 'Naomi Anderson', to_date('03-10-1986', 'dd-mm-yyyy'), 'F', 85.63, '051-7104333', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (210, 'Talvin Smurfit', to_date('09-08-1967', 'dd-mm-yyyy'), 'F', 75.77, '052-0194592', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (211, 'Marley Carlyle', to_date('01-11-1986', 'dd-mm-yyyy'), 'M', 89.05, '058-2758962', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (212, 'Queen Tyson', to_date('28-03-1966', 'dd-mm-yyyy'), 'F', 95.27, '059-9126566', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (213, 'Art Posey', to_date('19-01-1994', 'dd-mm-yyyy'), 'M', 81.08, '052-4598344', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (214, 'Laurence Derrin', to_date('23-11-1972', 'dd-mm-yyyy'), 'M', 98.13, '051-8077100', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (215, 'Vivica Smith', to_date('01-04-1990', 'dd-mm-yyyy'), 'M', 69.16, '059-2456571', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (216, 'Warren Ramis', to_date('24-10-1963', 'dd-mm-yyyy'), 'M', 79.61, '051-1534907', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (217, 'Jesus Mac', to_date('01-01-1995', 'dd-mm-yyyy'), 'M', 59.61, '058-1752749', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (218, 'Yolanda Gugino', to_date('08-05-1985', 'dd-mm-yyyy'), 'F', 70.62, '058-7215847', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (219, 'Parker Hingle', to_date('27-05-1988', 'dd-mm-yyyy'), 'M', 63.45, '059-8922757', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (220, 'Christina Monk', to_date('20-09-1980', 'dd-mm-yyyy'), 'M', 71.72, '052-7695007', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (221, 'Jose Cruise', to_date('11-09-1997', 'dd-mm-yyyy'), 'M', 73.87, '052-6449185', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (222, 'Patricia Cherry', to_date('17-09-1965', 'dd-mm-yyyy'), 'M', 78.37, '057-0939385', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (223, 'Night McKean', to_date('23-10-1990', 'dd-mm-yyyy'), 'M', 86.33, '054-1922280', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (224, 'Rosco Li', to_date('26-02-1970', 'dd-mm-yyyy'), 'F', 86.84, '054-3898781', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (521, 'Delbert Olin', to_date('25-06-1999', 'dd-mm-yyyy'), 'F', 74.28, '052-0758023', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (522, 'Philip Lachey', to_date('08-03-1990', 'dd-mm-yyyy'), 'M', 80.89, '054-1558044', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (523, 'Leelee Dushku', to_date('25-12-1993', 'dd-mm-yyyy'), 'F', 73.42, '057-4085517', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (524, 'Toshiro Marsden', to_date('18-05-1968', 'dd-mm-yyyy'), 'M', 92.22, '053-2915719', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (525, 'Matt Lowe', to_date('22-07-1966', 'dd-mm-yyyy'), 'M', 97.7, '053-9999433', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (526, 'Leo Blossoms', to_date('10-08-1981', 'dd-mm-yyyy'), 'F', 93.49, '054-9097576', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (527, 'Denzel McNeice', to_date('06-07-1968', 'dd-mm-yyyy'), 'M', 60.36, '059-2536838', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (528, 'Rhett Madsen', to_date('03-09-1992', 'dd-mm-yyyy'), 'F', 75.13, '057-0258797', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (529, 'Bob Rhys-Davies', to_date('14-03-1977', 'dd-mm-yyyy'), 'M', 96.3, '052-2954589', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (530, 'Bonnie Tucci', to_date('02-08-1999', 'dd-mm-yyyy'), 'F', 51.75, '052-6311966', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (531, 'Patrick Marguli', to_date('23-09-2001', 'dd-mm-yyyy'), 'F', 83.36, '059-2379470', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (532, 'Juan Anderson', to_date('19-07-1969', 'dd-mm-yyyy'), 'M', 75.42, '058-6392128', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (533, 'Chuck Rawls', to_date('15-09-1989', 'dd-mm-yyyy'), 'M', 82.86, '054-9808916', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (534, 'Garry Donelly', to_date('13-08-2001', 'dd-mm-yyyy'), 'F', 73.5, '052-9192622', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (535, 'Thelma Glenn', to_date('28-03-1964', 'dd-mm-yyyy'), 'M', 67.25, '053-6480693', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (536, 'Ruth Shocked', to_date('13-02-1990', 'dd-mm-yyyy'), 'F', 98.78, '058-1047688', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (537, 'Jonathan Bracco', to_date('26-04-1975', 'dd-mm-yyyy'), 'M', 74.76, '052-8523330', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (538, 'Bruce Chandler', to_date('09-11-1997', 'dd-mm-yyyy'), 'F', 65.55, '058-1301962', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (539, 'Shannon Conditi', to_date('04-08-1988', 'dd-mm-yyyy'), 'M', 93.2, '058-7265746', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (540, 'Nastassja Schwa', to_date('31-10-1982', 'dd-mm-yyyy'), 'M', 67.16, '058-7132397', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (541, 'Arnold Suchet', to_date('09-05-1982', 'dd-mm-yyyy'), 'M', 96.23, '058-9795880', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (542, 'Rosanna Richard', to_date('16-08-1996', 'dd-mm-yyyy'), 'F', 54.97, '052-2511176', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (543, 'Swoosie Westerb', to_date('14-08-1988', 'dd-mm-yyyy'), 'F', 76.43, '057-5657189', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (544, 'Elvis Robards', to_date('08-04-1992', 'dd-mm-yyyy'), 'M', 91.93, '053-9579167', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (545, 'Mena Posener', to_date('01-01-1983', 'dd-mm-yyyy'), 'M', 67.76, '053-9520614', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (546, 'Forest Conlee', to_date('08-01-1970', 'dd-mm-yyyy'), 'M', 70.53, '052-3049426', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (547, 'Patrick Sherman', to_date('29-12-1962', 'dd-mm-yyyy'), 'M', 73.56, '051-0106788', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (548, 'Lupe Springfiel', to_date('03-05-1997', 'dd-mm-yyyy'), 'M', 63.49, '059-9850239', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (549, 'Joanna Head', to_date('08-07-1974', 'dd-mm-yyyy'), 'M', 94.8, '054-1516010', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (550, 'Jean McLean', to_date('16-11-1963', 'dd-mm-yyyy'), 'F', 75.32, '058-1907390', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (551, 'Chantי Cox', to_date('05-12-1961', 'dd-mm-yyyy'), 'F', 90.16, '052-9884167', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (552, 'Samantha Armatr', to_date('19-02-1996', 'dd-mm-yyyy'), 'F', 69.54, '054-7636615', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (553, 'Sissy Benet', to_date('16-09-1983', 'dd-mm-yyyy'), 'M', 90.17, '051-1307308', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (554, 'Sinead Yulin', to_date('26-07-1972', 'dd-mm-yyyy'), 'M', 75.02, '054-0164968', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (555, 'Bret DeVita', to_date('27-10-1970', 'dd-mm-yyyy'), 'F', 67.14, '059-0154771', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (556, 'Debi Curry', to_date('20-09-1974', 'dd-mm-yyyy'), 'F', 93.19, '052-8922387', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (557, 'Albertina Hatfi', to_date('23-08-1985', 'dd-mm-yyyy'), 'F', 62.46, '052-9731899', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (558, 'Robbie Eckhart', to_date('08-06-2000', 'dd-mm-yyyy'), 'M', 79.77, '057-9840295', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (559, 'Fairuza Greenwo', to_date('20-09-1968', 'dd-mm-yyyy'), 'F', 93.4, '053-7089141', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (560, 'Gin Orlando', to_date('03-04-2002', 'dd-mm-yyyy'), 'M', 86.25, '058-4493235', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (561, 'Cherry Metcalf', to_date('07-05-1986', 'dd-mm-yyyy'), 'M', 65.57, '052-1748511', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (562, 'Fairuza Johanss', to_date('07-08-1961', 'dd-mm-yyyy'), 'F', 90.44, '057-5464085', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (563, 'Marty Rickles', to_date('17-06-1974', 'dd-mm-yyyy'), 'M', 93.55, '057-8483060', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (564, 'Brothers Harris', to_date('28-06-1993', 'dd-mm-yyyy'), 'F', 81.01, '054-9600977', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (565, 'Merrill Bandy', to_date('28-08-1997', 'dd-mm-yyyy'), 'M', 79.77, '054-7188777', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (566, 'Anthony Evanswo', to_date('25-03-1989', 'dd-mm-yyyy'), 'M', 95.04, '058-6028941', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (567, 'Stanley Sawa', to_date('13-12-1987', 'dd-mm-yyyy'), 'M', 72.11, '054-8420239', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (568, 'Giancarlo Hersh', to_date('01-12-1995', 'dd-mm-yyyy'), 'F', 78.72, '059-8876006', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (569, 'Rosanne Moody', to_date('17-03-2002', 'dd-mm-yyyy'), 'F', 52.99, '059-6445142', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (570, 'Lou Kramer', to_date('27-06-1962', 'dd-mm-yyyy'), 'M', 68.33, '057-8982839', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (571, 'Jeffrey Reiner', to_date('29-04-1970', 'dd-mm-yyyy'), 'F', 92.52, '051-6523580', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (572, 'Delroy Griggs', to_date('15-07-1967', 'dd-mm-yyyy'), 'F', 65.94, '054-5582776', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (573, 'Jesse Carlisle', to_date('05-04-1971', 'dd-mm-yyyy'), 'M', 79.49, '054-3191223', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (574, 'Noah Lang', to_date('11-02-1982', 'dd-mm-yyyy'), 'F', 91.46, '058-6278170', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (575, 'Gerald Vicious', to_date('02-11-1989', 'dd-mm-yyyy'), 'M', 95.11, '052-2780990', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (576, 'Nick Austin', to_date('27-08-1990', 'dd-mm-yyyy'), 'M', 52.61, '053-2499066', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (577, 'Curtis Sarandon', to_date('05-11-1971', 'dd-mm-yyyy'), 'F', 74.27, '054-7387462', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (578, 'Angela Sawa', to_date('22-08-1993', 'dd-mm-yyyy'), 'F', 88.58, '053-3975955', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (579, 'Jerry Mandrell', to_date('12-07-1981', 'dd-mm-yyyy'), 'M', 65.43, '059-7406437', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (580, 'Kelly Reid', to_date('02-08-1995', 'dd-mm-yyyy'), 'F', 56.37, '054-9299029', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (581, 'Yaphet Orlando', to_date('08-11-1981', 'dd-mm-yyyy'), 'F', 78.01, '054-2881839', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (582, 'Jonny Lee Mars', to_date('23-07-1990', 'dd-mm-yyyy'), 'M', 79.66, '051-3808896', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (583, 'Celia Tate', to_date('28-11-2000', 'dd-mm-yyyy'), 'M', 78.61, '051-5494737', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (584, 'Patti Grant', to_date('18-04-1995', 'dd-mm-yyyy'), 'M', 74.8, '051-3918222', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (585, 'Corey Mewes', to_date('03-01-1978', 'dd-mm-yyyy'), 'F', 90.74, '059-7375595', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (586, 'Frank Phillips', to_date('13-02-1981', 'dd-mm-yyyy'), 'M', 85.53, '052-4793867', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (587, 'Edward England', to_date('02-12-1980', 'dd-mm-yyyy'), 'F', 87.33, '059-0986247', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (588, 'Courtney Supern', to_date('22-01-1985', 'dd-mm-yyyy'), 'M', 55.32, '059-1371454', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (589, 'Debi Sanchez', to_date('09-11-1966', 'dd-mm-yyyy'), 'F', 98.01, '054-3754936', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (590, 'Tzi Vance', to_date('04-12-1977', 'dd-mm-yyyy'), 'F', 72.25, '058-0454187', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (591, 'Bernard Stallon', to_date('24-07-1998', 'dd-mm-yyyy'), 'M', 58.22, '059-8128002', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (592, 'Cheech Moffat', to_date('25-06-1965', 'dd-mm-yyyy'), 'F', 54.09, '052-9345360', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (593, 'Jeffery Katt', to_date('24-11-1985', 'dd-mm-yyyy'), 'F', 64.64, '057-5654183', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (594, 'Lynette Cassidy', to_date('05-02-1974', 'dd-mm-yyyy'), 'F', 55.16, '057-3793617', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (595, 'Mitchell Goldbe', to_date('31-03-1983', 'dd-mm-yyyy'), 'F', 73.8, '058-4392436', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (596, 'Gordon Haslam', to_date('21-05-1963', 'dd-mm-yyyy'), 'M', 83.72, '059-4158246', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (597, 'Trini Schiff', to_date('18-07-1976', 'dd-mm-yyyy'), 'M', 75.82, '054-8894879', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (598, 'Alex Assante', to_date('04-06-1961', 'dd-mm-yyyy'), 'M', 97.62, '057-8671352', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (599, 'Humberto Caine', to_date('07-01-1973', 'dd-mm-yyyy'), 'M', 62.34, '052-2111082', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (600, 'Goldie Lynskey', to_date('24-07-2000', 'dd-mm-yyyy'), 'M', 56.82, '053-8512486', 4);
commit;
prompt 500 records committed...
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (601, 'Coley Armstrong', to_date('16-11-1995', 'dd-mm-yyyy'), 'M', 61.12, '059-5118047', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (602, 'Geena Balin', to_date('18-10-1966', 'dd-mm-yyyy'), 'F', 79.52, '059-4932115', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (603, 'Joaquin Rooker', to_date('08-12-2000', 'dd-mm-yyyy'), 'F', 95.34, '053-5029282', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (604, 'Andy Devine', to_date('15-04-1997', 'dd-mm-yyyy'), 'M', 81.96, '059-9627649', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (605, 'Humberto Savage', to_date('12-07-2000', 'dd-mm-yyyy'), 'F', 58.42, '054-7274430', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (606, 'David Coverdale', to_date('08-11-1985', 'dd-mm-yyyy'), 'M', 52.51, '057-1445165', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (607, 'Vincent Thompso', to_date('21-12-1996', 'dd-mm-yyyy'), 'M', 68.89, '053-4383647', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (608, 'Melba Martin', to_date('16-01-1997', 'dd-mm-yyyy'), 'M', 67.85, '059-0171746', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (609, 'Kurt Masur', to_date('22-10-1973', 'dd-mm-yyyy'), 'F', 83.23, '058-4740997', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (610, 'Percy LuPone', to_date('22-05-2002', 'dd-mm-yyyy'), 'M', 66.89, '053-4024754', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (611, 'Rosie Summer', to_date('16-11-1990', 'dd-mm-yyyy'), 'M', 88.99, '054-5996006', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (612, 'Temuera Blige', to_date('07-08-1970', 'dd-mm-yyyy'), 'M', 78.27, '059-6246057', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (613, 'Tia Sample', to_date('18-03-1964', 'dd-mm-yyyy'), 'M', 76.76, '051-2522487', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (614, 'Glen Plimpton', to_date('06-09-1979', 'dd-mm-yyyy'), 'M', 79.62, '052-5460015', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (615, 'Tilda Hobson', to_date('22-03-1967', 'dd-mm-yyyy'), 'F', 69.99, '057-7404285', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (616, 'Dean Sedgwick', to_date('25-07-1995', 'dd-mm-yyyy'), 'F', 83.84, '051-1920949', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (617, 'Jeff Vannelli', to_date('21-12-1997', 'dd-mm-yyyy'), 'M', 56.8, '059-3253755', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (618, 'Steven Pryce', to_date('28-02-1969', 'dd-mm-yyyy'), 'F', 68.06, '052-0756186', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (619, 'Karen Reeves', to_date('17-06-1993', 'dd-mm-yyyy'), 'F', 79.63, '058-3804672', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (620, 'Freddy De Niro', to_date('28-08-2000', 'dd-mm-yyyy'), 'M', 60.56, '059-5852788', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (621, 'Cuba Carradine', to_date('05-03-1979', 'dd-mm-yyyy'), 'M', 53.46, '058-9905188', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (622, 'Sara Cleese', to_date('07-09-1997', 'dd-mm-yyyy'), 'F', 88.88, '057-8893866', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (623, 'Freddy Caviezel', to_date('31-03-1992', 'dd-mm-yyyy'), 'M', 60.73, '057-9710570', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (624, 'Dermot Griffith', to_date('31-07-1984', 'dd-mm-yyyy'), 'M', 89.74, '052-9764517', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (625, 'Nile Cattrall', to_date('06-01-1962', 'dd-mm-yyyy'), 'M', 77.28, '053-8975129', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (626, 'Blair Mollard', to_date('27-02-1999', 'dd-mm-yyyy'), 'M', 66.67, '051-4091565', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (627, 'Vondie Brando', to_date('23-01-1988', 'dd-mm-yyyy'), 'M', 92.37, '053-4128513', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (628, 'Jodie Reeves', to_date('07-06-1983', 'dd-mm-yyyy'), 'M', 71.68, '054-1231625', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (629, 'Jean Carlton', to_date('12-06-2001', 'dd-mm-yyyy'), 'F', 72.44, '054-8081847', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (630, 'Val Bassett', to_date('04-01-1990', 'dd-mm-yyyy'), 'F', 63.04, '051-3581472', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (631, 'Alan Buscemi', to_date('26-06-1970', 'dd-mm-yyyy'), 'M', 55.77, '057-9185012', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (632, 'Ruth Howard', to_date('21-02-2001', 'dd-mm-yyyy'), 'M', 69.64, '053-5328269', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (633, 'Yolanda England', to_date('02-01-1976', 'dd-mm-yyyy'), 'M', 58.82, '057-5926464', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (634, 'Angela Kotto', to_date('30-11-1989', 'dd-mm-yyyy'), 'M', 91.76, '054-2040152', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (635, 'Elvis Marin', to_date('04-10-1987', 'dd-mm-yyyy'), 'F', 96.09, '051-1248391', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (636, 'Michael Swayze', to_date('14-05-1969', 'dd-mm-yyyy'), 'M', 58.06, '053-5403008', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (637, 'Warren Posey', to_date('12-08-1974', 'dd-mm-yyyy'), 'F', 83.73, '057-9782087', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (638, 'Jeremy Easton', to_date('07-04-1973', 'dd-mm-yyyy'), 'M', 71.52, '054-5026700', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (639, 'Kieran Parsons', to_date('04-07-1983', 'dd-mm-yyyy'), 'M', 92.17, '054-7014056', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (640, 'Selma Madsen', to_date('15-05-1986', 'dd-mm-yyyy'), 'F', 88.46, '052-5425567', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (641, 'Neil Spacek', to_date('15-03-1969', 'dd-mm-yyyy'), 'M', 81.8, '057-3980721', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (642, 'Buddy Carlyle', to_date('09-09-1973', 'dd-mm-yyyy'), 'M', 64.52, '052-7372261', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (643, 'Kirsten Gilley', to_date('21-11-1960', 'dd-mm-yyyy'), 'F', 59.87, '058-6853050', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (644, 'Anita Wilkinson', to_date('23-06-1971', 'dd-mm-yyyy'), 'F', 66.38, '057-1795777', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (645, 'Brooke Sossamon', to_date('21-05-1963', 'dd-mm-yyyy'), 'M', 60.2, '051-4874123', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (646, 'Geoffrey Tucker', to_date('09-08-1998', 'dd-mm-yyyy'), 'M', 63.36, '058-2428702', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (647, 'Janeane Duke', to_date('23-09-1976', 'dd-mm-yyyy'), 'M', 75.63, '057-0933493', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (648, 'Bebe Wincott', to_date('10-05-1985', 'dd-mm-yyyy'), 'M', 85.61, '053-5724753', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (649, 'Juliette Gracie', to_date('12-11-1970', 'dd-mm-yyyy'), 'F', 90.6, '058-2266932', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (650, 'Geggy O''Donnell', to_date('10-08-1993', 'dd-mm-yyyy'), 'M', 62.21, '058-9371872', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (651, 'Harvey Beckham', to_date('27-04-1975', 'dd-mm-yyyy'), 'F', 56.39, '052-0730599', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (652, 'Beverley Craig', to_date('25-05-1994', 'dd-mm-yyyy'), 'F', 56.25, '051-0315758', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (653, 'Ernest Randal', to_date('11-04-1999', 'dd-mm-yyyy'), 'F', 66.81, '058-1857598', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (654, 'Seann Palmer', to_date('07-03-1964', 'dd-mm-yyyy'), 'F', 84.05, '057-2517318', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (655, 'Rosco Costello', to_date('21-02-1995', 'dd-mm-yyyy'), 'F', 97.14, '053-1912271', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (656, 'Olga Matarazzo', to_date('19-04-1966', 'dd-mm-yyyy'), 'M', 78.48, '057-4160381', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (657, 'Domingo Moffat', to_date('16-09-1961', 'dd-mm-yyyy'), 'M', 74.03, '051-9362546', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (658, 'Gloria Utada', to_date('13-01-1984', 'dd-mm-yyyy'), 'M', 87.41, '054-7635823', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (659, 'Claude Buscemi', to_date('04-09-1995', 'dd-mm-yyyy'), 'F', 67.62, '057-7384729', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (660, 'Barbara Jay', to_date('02-03-1977', 'dd-mm-yyyy'), 'F', 59.44, '057-8570174', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (661, 'Connie Trevino', to_date('16-07-1994', 'dd-mm-yyyy'), 'M', 93.42, '058-6163888', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (662, 'Benjamin Dutton', to_date('20-06-1994', 'dd-mm-yyyy'), 'M', 54.19, '054-9762158', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (663, 'Antonio Pfeiffe', to_date('24-07-1975', 'dd-mm-yyyy'), 'M', 84.15, '059-6556843', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (664, 'Sophie Irons', to_date('01-01-1986', 'dd-mm-yyyy'), 'F', 89.41, '059-2055156', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (665, 'Fiona Taylor', to_date('28-01-1988', 'dd-mm-yyyy'), 'M', 60.8, '054-8102981', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (666, 'Robbie Costello', to_date('17-03-1967', 'dd-mm-yyyy'), 'F', 55.15, '059-6178468', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (667, 'Trace Bradford', to_date('01-09-2002', 'dd-mm-yyyy'), 'M', 82.13, '053-3842564', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (668, 'Lennie Brock', to_date('02-06-1989', 'dd-mm-yyyy'), 'F', 92.92, '058-2699213', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (669, 'Cornell Duvall', to_date('24-04-1962', 'dd-mm-yyyy'), 'F', 78.24, '059-8431885', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (670, 'Larenz Tennison', to_date('23-01-1961', 'dd-mm-yyyy'), 'F', 71.26, '059-5160472', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (671, 'Collin Gore', to_date('16-03-2001', 'dd-mm-yyyy'), 'M', 60.93, '054-2282263', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (672, 'Beth Gooding', to_date('06-04-1986', 'dd-mm-yyyy'), 'M', 89.16, '051-1481033', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (673, 'Mena Everett', to_date('23-06-1970', 'dd-mm-yyyy'), 'F', 58.48, '052-3183164', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (674, 'Vivica Spader', to_date('25-02-1996', 'dd-mm-yyyy'), 'F', 76.23, '058-6667801', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (675, 'Miki Berry', to_date('01-12-1963', 'dd-mm-yyyy'), 'F', 92.43, '059-5951723', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (676, 'Neve Cheadle', to_date('24-02-1964', 'dd-mm-yyyy'), 'F', 91.4, '051-3050573', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (677, 'Lee Kravitz', to_date('08-04-1993', 'dd-mm-yyyy'), 'F', 54.48, '052-5800288', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (678, 'Salma Garber', to_date('09-05-1999', 'dd-mm-yyyy'), 'F', 87.97, '059-1840975', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (679, 'Miguel Gryner', to_date('27-08-1994', 'dd-mm-yyyy'), 'F', 76.75, '054-4610822', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (680, 'Debbie Guilfoyl', to_date('10-03-1967', 'dd-mm-yyyy'), 'M', 56.33, '053-3661410', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (681, 'Chantי Keen', to_date('01-09-1997', 'dd-mm-yyyy'), 'M', 81.76, '054-1818712', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (682, 'Nelly Noseworth', to_date('20-12-1987', 'dd-mm-yyyy'), 'F', 81.05, '054-1989223', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (683, 'Hikaru Krieger', to_date('08-05-1995', 'dd-mm-yyyy'), 'M', 70.44, '053-8797990', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (684, 'Todd Alston', to_date('02-07-1969', 'dd-mm-yyyy'), 'F', 88.1, '052-0365558', 5);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (685, 'Xander Kinney', to_date('23-07-1962', 'dd-mm-yyyy'), 'F', 70.64, '058-6690769', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (686, 'Vertical Mills', to_date('08-02-1976', 'dd-mm-yyyy'), 'F', 87.8, '054-9619204', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (687, 'Halle Cale', to_date('08-10-1962', 'dd-mm-yyyy'), 'M', 66.7, '054-4068428', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (688, 'Rhona Bryson', to_date('02-05-2002', 'dd-mm-yyyy'), 'M', 88.3, '057-8121826', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (689, 'Andie Turturro', to_date('12-11-2000', 'dd-mm-yyyy'), 'F', 62.89, '059-3188294', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (690, 'Belinda Collie', to_date('07-08-1972', 'dd-mm-yyyy'), 'M', 52.19, '054-1552411', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (691, 'Larenz Curtis', to_date('01-10-2002', 'dd-mm-yyyy'), 'F', 89.78, '059-0160576', 1);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (692, 'Rosco MacPherso', to_date('31-10-1964', 'dd-mm-yyyy'), 'M', 62.46, '054-2613789', 6);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (693, 'Guy Leachman', to_date('01-10-2000', 'dd-mm-yyyy'), 'M', 91.64, '059-1234686', 7);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (694, 'Holly Keen', to_date('15-06-1991', 'dd-mm-yyyy'), 'F', 60.46, '059-2222341', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (695, 'Kenneth McFadde', to_date('22-06-1985', 'dd-mm-yyyy'), 'F', 95.68, '052-8700471', 8);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (696, 'Cuba Elizabeth', to_date('04-05-2000', 'dd-mm-yyyy'), 'F', 89.35, '051-3249293', 4);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (697, 'Raul Coltrane', to_date('25-06-2001', 'dd-mm-yyyy'), 'F', 89.2, '053-3681541', 3);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (698, 'Jeanne McLean', to_date('28-12-1968', 'dd-mm-yyyy'), 'F', 76.47, '057-2766098', 2);
insert into DONOR (donorid, fullname, dateofbirth, gender, weight, numberphone, bloodid)
values (699, 'Uma Braugher', to_date('22-03-1969', 'dd-mm-yyyy'), 'F', 62.19, '054-3714443', 1);
commit;
prompt 599 records loaded
prompt Loading STATION...
insert into STATION (stationid, city, numberphone, manager)
values (102, 'Bnei Brak', '054-7015840', 'Dani Searke');
insert into STATION (stationid, city, numberphone, manager)
values (103, 'Bnei Brak', '054-2656955', 'Eula Shk');
insert into STATION (stationid, city, numberphone, manager)
values (104, 'Bnei Brak', '054-8489420', 'Glyn Bull');
insert into STATION (stationid, city, numberphone, manager)
values (105, 'Bnei Brak', '054-2441096', 'Garnet Hucy');
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
insert into STATION (stationid, city, numberphone, manager)
values (11, 'Jerusalem', '058-2301141', 'Anne Elcomb');
insert into STATION (stationid, city, numberphone, manager)
values (12, 'Jerusalem', '057-5402607', 'Alyse Elurne');
insert into STATION (stationid, city, numberphone, manager)
values (13, 'Jerusalem', '057-7877167', 'Judye Kmuntz');
insert into STATION (stationid, city, numberphone, manager)
values (14, 'Jerusalem', '059-1856308', 'Luci Largan');
insert into STATION (stationid, city, numberphone, manager)
values (15, 'Jerusalem', '051-7823755', 'Calypso Tey');
insert into STATION (stationid, city, numberphone, manager)
values (16, 'Tel Aviv', '052-2250895', 'Jany Heaood');
insert into STATION (stationid, city, numberphone, manager)
values (17, 'Tel Aviv', '053-4183292', 'Zed Heaslip');
insert into STATION (stationid, city, numberphone, manager)
values (18, 'Tel Aviv', '054-5024680', 'Sonnie Asif');
insert into STATION (stationid, city, numberphone, manager)
values (19, 'Tel Aviv', '059-4715133', 'Kasper Haook');
insert into STATION (stationid, city, numberphone, manager)
values (20, 'Tel Aviv', '053-7491709', 'Patten Iori');
insert into STATION (stationid, city, numberphone, manager)
values (21, 'Tel Aviv', '054-9998527', 'Enrika Doey');
insert into STATION (stationid, city, numberphone, manager)
values (22, 'Tel Aviv', '053-9642141', 'Frie Venour');
insert into STATION (stationid, city, numberphone, manager)
values (23, 'Tel Aviv', '053-5055266', 'Sibby Gahgan');
insert into STATION (stationid, city, numberphone, manager)
values (24, 'Tel Aviv', '053-2157540', 'Gina Heinel');
insert into STATION (stationid, city, numberphone, manager)
values (25, 'Tel Aviv', '057-8977906', 'Ruthe Petts');
insert into STATION (stationid, city, numberphone, manager)
values (26, 'Tel Aviv', '055-9161497', 'Ilise Pateman');
insert into STATION (stationid, city, numberphone, manager)
values (27, 'Tel Aviv', '051-8887850', 'Hadrian Howis');
insert into STATION (stationid, city, numberphone, manager)
values (28, 'Tel Aviv', '051-7922191', 'Drud Hoaux');
insert into STATION (stationid, city, numberphone, manager)
values (106, 'Bnei Brak', '054-2680616', 'Jalyn Gozard');
insert into STATION (stationid, city, numberphone, manager)
values (107, 'Bnei Brak', '054-5444106', 'Saundra Anni');
insert into STATION (stationid, city, numberphone, manager)
values (29, 'Tel Aviv', '053-1229433', 'Layney Haann');
insert into STATION (stationid, city, numberphone, manager)
values (30, 'Tel Aviv', '053-1264668', 'Phylis Stark');
insert into STATION (stationid, city, numberphone, manager)
values (31, 'Haifa', '054-5595560', 'Midge Rickd');
insert into STATION (stationid, city, numberphone, manager)
values (32, 'Haifa', '052-2719166', 'Georges Giatti');
insert into STATION (stationid, city, numberphone, manager)
values (33, 'Haifa', '053-6507538', 'Bowie Seer');
insert into STATION (stationid, city, numberphone, manager)
values (34, 'Haifa', '052-8877636', 'Arne De Micoli');
insert into STATION (stationid, city, numberphone, manager)
values (35, 'Haifa', '051-6168003', 'Rubetta Klan');
insert into STATION (stationid, city, numberphone, manager)
values (36, 'Haifa', '057-8246313', 'Marshal Loe');
insert into STATION (stationid, city, numberphone, manager)
values (37, 'Haifa', '051-7161792', 'Durand Taard');
insert into STATION (stationid, city, numberphone, manager)
values (38, 'Haifa', '051-7446430', 'Ariella Palo');
insert into STATION (stationid, city, numberphone, manager)
values (39, 'Haifa', '051-9881474', 'Christan Dash');
insert into STATION (stationid, city, numberphone, manager)
values (40, 'Haifa', '051-8781876', 'Chadwick Chey');
insert into STATION (stationid, city, numberphone, manager)
values (41, 'Haifa', '051-4102157', 'Carin Stops');
insert into STATION (stationid, city, numberphone, manager)
values (42, 'Haifa', '052-8918703', 'Hanan Hamor');
insert into STATION (stationid, city, numberphone, manager)
values (43, 'Haifa', '052-8816000', 'Marshall Tuman');
insert into STATION (stationid, city, numberphone, manager)
values (44, 'Rishon LeZion', '053-4213579', 'Loren Pegen');
insert into STATION (stationid, city, numberphone, manager)
values (45, 'Rishon LeZion', '053-4477566', 'Gifford Garron');
insert into STATION (stationid, city, numberphone, manager)
values (46, 'Rishon LeZion', '054-4630954', 'Raynell Cocozza');
insert into STATION (stationid, city, numberphone, manager)
values (47, 'Rishon LeZion', '057-2379480', 'Cicily Matsss');
insert into STATION (stationid, city, numberphone, manager)
values (48, 'Rishon LeZion', '058-8727844', 'Ronde Tyrst');
insert into STATION (stationid, city, numberphone, manager)
values (49, 'Rishon LeZion', '057-3705896', 'Teodor Huster');
insert into STATION (stationid, city, numberphone, manager)
values (50, 'Rishon LeZion', '054-3662474', 'Marnie Jeoise');
insert into STATION (stationid, city, numberphone, manager)
values (51, 'Rishon LeZion', '054-1630423', 'Filmer Worge');
insert into STATION (stationid, city, numberphone, manager)
values (52, 'Rishon LeZion', '052-6598948', 'Jerrome Provost');
insert into STATION (stationid, city, numberphone, manager)
values (53, 'Rishon LeZion', '051-2487326', 'Tremain Mcghan');
insert into STATION (stationid, city, numberphone, manager)
values (54, 'Rishon LeZion', '053-5191903', 'Gabey Wyborn');
insert into STATION (stationid, city, numberphone, manager)
values (55, 'Petah Tikva', '053-4237852', 'Devlin Tickel');
insert into STATION (stationid, city, numberphone, manager)
values (56, 'Petah Tikva', '052-7685898', 'Clare Ludsen');
insert into STATION (stationid, city, numberphone, manager)
values (57, 'Petah Tikva', '052-3189330', 'Garreth Wikles');
insert into STATION (stationid, city, numberphone, manager)
values (58, 'Petah Tikva', '051-6490472', 'Bentto Drews');
insert into STATION (stationid, city, numberphone, manager)
values (59, 'Petah Tikva', '051-6540379', 'Datha Chatten');
insert into STATION (stationid, city, numberphone, manager)
values (60, 'Petah Tikva', '058-4069488', 'Susann Priddy');
insert into STATION (stationid, city, numberphone, manager)
values (61, 'Petah Tikva', '059-5540008', 'Garvin McAirt');
insert into STATION (stationid, city, numberphone, manager)
values (62, 'Petah Tikva', '059-5674958', 'Shl Herley');
insert into STATION (stationid, city, numberphone, manager)
values (63, 'Petah Tikva', '050-8240547', 'Clarita Proby');
insert into STATION (stationid, city, numberphone, manager)
values (64, 'Petah Tikva', '058-2611271', 'Benetta Ubanks');
insert into STATION (stationid, city, numberphone, manager)
values (65, 'Petah Tikva', '059-8422707', 'Farly Mardell');
insert into STATION (stationid, city, numberphone, manager)
values (66, 'Petah Tikva', '051-2356987', 'Carol Larmor');
insert into STATION (stationid, city, numberphone, manager)
values (67, 'Ashdod', '052-5796822', 'Archie Crey');
insert into STATION (stationid, city, numberphone, manager)
values (69, 'Ashdod', '054-1630715', 'Ingelb Dennitts');
insert into STATION (stationid, city, numberphone, manager)
values (70, 'Ashdod', '057-8621689', 'Melony McQuade');
insert into STATION (stationid, city, numberphone, manager)
values (71, 'Ashdod', '057-7995691', 'Ivonne Yankov');
insert into STATION (stationid, city, numberphone, manager)
values (72, 'Ashdod', '054-7351966', 'Elbert Thile');
insert into STATION (stationid, city, numberphone, manager)
values (73, 'Ashdod', '054-4962298', 'Northrop Stle');
insert into STATION (stationid, city, numberphone, manager)
values (74, 'Ashdod', '052-9973322', 'Jana Lipt');
insert into STATION (stationid, city, numberphone, manager)
values (75, 'Ashdod', '059-3208255', 'Monte Hill');
insert into STATION (stationid, city, numberphone, manager)
values (76, 'Ashdod', '052-8313887', 'Kyla Mealand');
insert into STATION (stationid, city, numberphone, manager)
values (78, 'Ashdod', '052-8854460', 'Osbourne Rooper');
insert into STATION (stationid, city, numberphone, manager)
values (79, 'Ashdod', '051-9029809', 'Merrily Pophar');
insert into STATION (stationid, city, numberphone, manager)
values (80, 'Netanya', '051-6436346', 'Eadie Willisch');
insert into STATION (stationid, city, numberphone, manager)
values (81, 'Netanya', '059-9252988', 'Velvet Spng');
insert into STATION (stationid, city, numberphone, manager)
values (82, 'Netanya', '057-9993787', 'Elicia Perrie');
insert into STATION (stationid, city, numberphone, manager)
values (83, 'Netanya', '052-2128753', 'Cher Gowing');
insert into STATION (stationid, city, numberphone, manager)
values (84, 'Netanya', '051-9395403', 'Aurelia Tennick');
insert into STATION (stationid, city, numberphone, manager)
values (85, 'Netanya', '057-3236476', 'Enos Gartan');
insert into STATION (stationid, city, numberphone, manager)
values (86, 'Netanya', '054-3329298', 'Boigie Vako');
insert into STATION (stationid, city, numberphone, manager)
values (87, 'Netanya', '057-1637281', 'Godart Itvitz');
insert into STATION (stationid, city, numberphone, manager)
values (89, 'Netanya', '051-2625720', 'Zelig German');
insert into STATION (stationid, city, numberphone, manager)
values (90, 'Netanya', '051-9032020', 'Lorenza Krysz');
insert into STATION (stationid, city, numberphone, manager)
values (91, 'Netanya', '051-9578646', 'Sophey Lynds');
insert into STATION (stationid, city, numberphone, manager)
values (92, 'Netanya', '051-9158888', 'Tamas Arndt');
insert into STATION (stationid, city, numberphone, manager)
values (93, 'Beersheba', '051-8882036', 'Nancee Capstick');
insert into STATION (stationid, city, numberphone, manager)
values (94, 'Beersheba', '051-8042555', 'Matilde Royans');
insert into STATION (stationid, city, numberphone, manager)
values (95, 'Beersheba', '051-8388857', 'Alison Rubens');
insert into STATION (stationid, city, numberphone, manager)
values (96, 'Beersheba', '052-3207425', 'Redd Tiuit');
insert into STATION (stationid, city, numberphone, manager)
values (97, 'Beersheba', '051-9976257', 'Leese Gerasch');
commit;
prompt 100 records committed...
insert into STATION (stationid, city, numberphone, manager)
values (98, 'Beersheba', '050-8443682', 'Goddart Dawber');
insert into STATION (stationid, city, numberphone, manager)
values (99, 'Beersheba', '050-6062776', 'Monroe Milesop');
insert into STATION (stationid, city, numberphone, manager)
values (100, 'Beersheba', '050-6485680', 'Caron Waiton');
insert into STATION (stationid, city, numberphone, manager)
values (68, 'Ashdod', '053-1232784', 'Roolt Berkery');
insert into STATION (stationid, city, numberphone, manager)
values (77, 'Ashdod', '052-7572509', 'Mana Baudacci');
insert into STATION (stationid, city, numberphone, manager)
values (88, 'Netanya', '052-6728638', 'Lyndsie Vs');
insert into STATION (stationid, city, numberphone, manager)
values (101, 'Bnei Brak', '050-4187746', 'Lane Probyn');
insert into STATION (stationid, city, numberphone, manager)
values (108, 'Bnei Brak', '051-4437655', 'Tarrance Do');
insert into STATION (stationid, city, numberphone, manager)
values (109, 'Bnei Brak', '051-8370158', 'Rita Suard');
insert into STATION (stationid, city, numberphone, manager)
values (110, 'Bnei Brak', '051-6491458', 'Johnna Pozzo');
insert into STATION (stationid, city, numberphone, manager)
values (111, 'Bnei Brak', '051-5008522', 'Shane Mchie');
insert into STATION (stationid, city, numberphone, manager)
values (112, 'Holon', '051-3299972', 'Andree Gard');
insert into STATION (stationid, city, numberphone, manager)
values (113, 'Holon', '052-8988092', 'Annis Prd');
insert into STATION (stationid, city, numberphone, manager)
values (114, 'Holon', '052-5360262', 'Allyce Muffe');
insert into STATION (stationid, city, numberphone, manager)
values (115, 'Holon', '052-8139640', 'Lazaro Micheu');
insert into STATION (stationid, city, numberphone, manager)
values (116, 'Holon', '052-8789345', 'Barew Bonnell');
insert into STATION (stationid, city, numberphone, manager)
values (117, 'Holon', '052-8801179', 'Aylmer Schanke');
insert into STATION (stationid, city, numberphone, manager)
values (118, 'Holon', '059-3854675', 'Birch Nuschke');
insert into STATION (stationid, city, numberphone, manager)
values (119, 'Holon', '059-2010388', 'Shelbi Corser');
insert into STATION (stationid, city, numberphone, manager)
values (120, 'Holon', '059-3035874', 'Chick Wolffers');
insert into STATION (stationid, city, numberphone, manager)
values (121, 'Holon', '059-3089696', 'Kelly Hiurn');
insert into STATION (stationid, city, numberphone, manager)
values (122, 'Holon', '057-2581367', 'Gayel Caldaro');
insert into STATION (stationid, city, numberphone, manager)
values (123, 'Holon', '057-4709757', 'Gao Karoi');
insert into STATION (stationid, city, numberphone, manager)
values (124, 'Ramat Gan', '057-9726992', 'Inger Dose');
insert into STATION (stationid, city, numberphone, manager)
values (125, 'Ramat Gan', '057-4720934', 'Lorinda Ilem');
insert into STATION (stationid, city, numberphone, manager)
values (126, 'Ramat Gan', '057-2022607', 'Junette Meows');
insert into STATION (stationid, city, numberphone, manager)
values (127, 'Ramat Gan', '057-3304001', 'Callie Carlow');
insert into STATION (stationid, city, numberphone, manager)
values (128, 'Ramat Gan', '057-4254213', 'Abagail Dlman');
insert into STATION (stationid, city, numberphone, manager)
values (129, 'Ramat Gan', '057-6189595', 'Gipsy Mudge');
insert into STATION (stationid, city, numberphone, manager)
values (130, 'Ramat Gan', '057-2913883', 'Nais Whitter');
insert into STATION (stationid, city, numberphone, manager)
values (131, 'Ramat Gan', '054-1676703', 'Darnell Drust');
insert into STATION (stationid, city, numberphone, manager)
values (132, 'Ramat Gan', '054-3482287', 'Tomlin Bussy');
insert into STATION (stationid, city, numberphone, manager)
values (133, 'Ramat Gan', '054-6949415', 'Claudian Hands');
insert into STATION (stationid, city, numberphone, manager)
values (134, 'Ramat Gan', '054-1135922', 'Wain Moreing');
insert into STATION (stationid, city, numberphone, manager)
values (135, 'Ramat Gan', '054-7728008', 'Arliene Kocher');
insert into STATION (stationid, city, numberphone, manager)
values (136, 'Ramat Gan', '054-1495712', 'Kimmie Walker');
insert into STATION (stationid, city, numberphone, manager)
values (137, 'Ramat Gan', '059-8499635', 'Merrel Quene');
insert into STATION (stationid, city, numberphone, manager)
values (138, 'Ramat Gan', '059-3207433', 'Lorenzo Hargey');
insert into STATION (stationid, city, numberphone, manager)
values (139, 'Ramat Gan', '059-1977956', 'Vittorio Faey');
insert into STATION (stationid, city, numberphone, manager)
values (140, 'Ramat Gan', '058-8549334', 'Anabel Gitch');
insert into STATION (stationid, city, numberphone, manager)
values (141, 'Ramat Gan', '058-3630168', 'Paal Thynn');
insert into STATION (stationid, city, numberphone, manager)
values (142, 'Ramat Gan', '058-6383572', 'Atle McTavy');
insert into STATION (stationid, city, numberphone, manager)
values (143, 'Rehovot', '058-4995147', 'Harley Rie');
insert into STATION (stationid, city, numberphone, manager)
values (144, 'Rehovot', '058-4962263', 'Glenn Macolla');
insert into STATION (stationid, city, numberphone, manager)
values (145, 'Rehovot', '058-3235045', 'Gugma Brner');
insert into STATION (stationid, city, numberphone, manager)
values (146, 'Rehovot', '058-2423857', 'Vicki Acbe');
insert into STATION (stationid, city, numberphone, manager)
values (147, 'Rehovot', '058-8051104', 'Berta True');
insert into STATION (stationid, city, numberphone, manager)
values (148, 'Rehovot', '058-2586352', 'Tresa Abwsky');
insert into STATION (stationid, city, numberphone, manager)
values (149, 'Rehovot', '058-5217459', 'Thia Benoy');
insert into STATION (stationid, city, numberphone, manager)
values (150, 'Rehovot', '058-5896767', 'Sisile Callar');
insert into STATION (stationid, city, numberphone, manager)
values (151, 'Rehovot', '058-2467189', 'Wald Yoell');
insert into STATION (stationid, city, numberphone, manager)
values (152, 'Rehovot', '058-6929676', 'Jodie Muon');
insert into STATION (stationid, city, numberphone, manager)
values (153, 'Rehovot', '058-4685339', 'Onedo Whittet');
insert into STATION (stationid, city, numberphone, manager)
values (154, 'Rehovot', '058-4603506', 'Loria Hammill');
insert into STATION (stationid, city, numberphone, manager)
values (155, 'Rehovot', '058-6738569', 'Reine Dallon');
insert into STATION (stationid, city, numberphone, manager)
values (156, 'Rehovot', '057-1977838', 'Winonah Dooan');
insert into STATION (stationid, city, numberphone, manager)
values (157, 'Ashkelon', '057-1555069', 'Pamela Redsull');
insert into STATION (stationid, city, numberphone, manager)
values (158, 'Ashkelon', '057-4443730', 'Gerri Seagar');
insert into STATION (stationid, city, numberphone, manager)
values (159, 'Ashkelon', '057-2764009', 'Toiboid Pimm');
insert into STATION (stationid, city, numberphone, manager)
values (160, 'Ashkelon', '057-9441270', 'Tobias Wilon');
insert into STATION (stationid, city, numberphone, manager)
values (161, 'Ashkelon', '057-5615007', 'Morgan Blanque');
insert into STATION (stationid, city, numberphone, manager)
values (162, 'Ashkelon', '057-7064615', 'Dorthy Klimko');
insert into STATION (stationid, city, numberphone, manager)
values (163, 'Ashkelon', '057-8794206', 'Wylie Beere');
insert into STATION (stationid, city, numberphone, manager)
values (164, 'Ashkelon', '057-3983850', 'Rosalie Mrrow');
insert into STATION (stationid, city, numberphone, manager)
values (165, 'Bat Yam', '057-4050258', 'Bryn Dalmon');
insert into STATION (stationid, city, numberphone, manager)
values (167, 'Bat Yam', '057-4258390', 'Letty Whitr');
insert into STATION (stationid, city, numberphone, manager)
values (168, 'Bat Yam', '057-9205180', 'Janina Grayn');
insert into STATION (stationid, city, numberphone, manager)
values (169, 'Bat Yam', '057-7023344', 'Zah Fairburn');
insert into STATION (stationid, city, numberphone, manager)
values (170, 'Bat Yam', '057-7249368', 'Demetria Mth');
insert into STATION (stationid, city, numberphone, manager)
values (171, 'Bat Yam', '057-3451809', 'Arte Elflain');
insert into STATION (stationid, city, numberphone, manager)
values (172, 'Bat Yam', '057-5447247', 'Hugo Brookzie');
insert into STATION (stationid, city, numberphone, manager)
values (173, 'Bat Yam', '054-2759844', 'Jayson Antonio');
insert into STATION (stationid, city, numberphone, manager)
values (174, 'Kfar Saba', '054-3156055', 'Luca Wehden');
insert into STATION (stationid, city, numberphone, manager)
values (175, 'Kfar Saba', '054-6791163', 'Karsa Rehme');
insert into STATION (stationid, city, numberphone, manager)
values (176, 'Kfar Saba', '054-6437060', 'Frsco Lydtt');
insert into STATION (stationid, city, numberphone, manager)
values (177, 'Kfar Saba', '054-3990781', 'Judie Maslen');
insert into STATION (stationid, city, numberphone, manager)
values (178, 'Kfar Saba', '054-2276192', 'Rhianna Peev');
insert into STATION (stationid, city, numberphone, manager)
values (179, 'Kfar Saba', '054-9224031', 'Waiht Aubrey');
insert into STATION (stationid, city, numberphone, manager)
values (180, 'Kfar Saba', '054-2314411', 'Cassie Gread');
insert into STATION (stationid, city, numberphone, manager)
values (181, 'Kfar Saba', '054-9809080', 'Sadye Eckery');
insert into STATION (stationid, city, numberphone, manager)
values (182, 'Kfar Saba', '054-2055808', 'Torrance Clogg');
insert into STATION (stationid, city, numberphone, manager)
values (183, 'Herzliya', '054-3082286', 'Deeann Gerrd');
insert into STATION (stationid, city, numberphone, manager)
values (184, 'Herzliya', '054-8793001', 'Gennifer Guitte');
insert into STATION (stationid, city, numberphone, manager)
values (185, 'Herzliya', '058-5969748', 'Ambros Clapp');
insert into STATION (stationid, city, numberphone, manager)
values (186, 'Herzliya', '058-8891351', 'Sharlene Sired');
insert into STATION (stationid, city, numberphone, manager)
values (187, 'Herzliya', '058-1276404', 'Addia Oochan');
insert into STATION (stationid, city, numberphone, manager)
values (188, 'Herzliya', '058-1860484', 'Maribel Dorpe');
insert into STATION (stationid, city, numberphone, manager)
values (189, 'Herzliya', '058-4435268', 'Swen Lente');
insert into STATION (stationid, city, numberphone, manager)
values (190, 'Herzliya', '058-8156683', 'Orelie Molloy');
insert into STATION (stationid, city, numberphone, manager)
values (191, 'Herzliya', '058-6706850', 'Bambie Ollin');
insert into STATION (stationid, city, numberphone, manager)
values (192, 'Herzliya', '058-1333391', 'Marget Stuins');
insert into STATION (stationid, city, numberphone, manager)
values (193, 'Herzliya', '058-8744582', 'Lyda Cookley');
insert into STATION (stationid, city, numberphone, manager)
values (194, 'Herzliya', '058-4865442', 'Mare Novotna');
insert into STATION (stationid, city, numberphone, manager)
values (195, 'Herzliya', '058-3636084', 'Illa Earie');
insert into STATION (stationid, city, numberphone, manager)
values (196, 'Herzliya', '058-7906718', 'Ellth Scawn');
insert into STATION (stationid, city, numberphone, manager)
values (197, 'Herzliya', '058-4794461', 'Greggory Orknay');
insert into STATION (stationid, city, numberphone, manager)
values (198, 'Hadera', '058-4375137', 'Nissy Hyndley');
insert into STATION (stationid, city, numberphone, manager)
values (199, 'Hadera', '058-3490297', 'Frco Logsdail');
insert into STATION (stationid, city, numberphone, manager)
values (200, 'Hadera', '050-5673655', 'Douglass Wd');
insert into STATION (stationid, city, numberphone, manager)
values (166, 'Bat Yam', '057-7162108', 'Sharona Crhell');
commit;
prompt 200 records committed...
insert into STATION (stationid, city, numberphone, manager)
values (201, 'Raanana', '050-7676869', 'Joey Benger');
insert into STATION (stationid, city, numberphone, manager)
values (202, 'Raanana', '050-4239574', 'Khalil Derick');
insert into STATION (stationid, city, numberphone, manager)
values (203, 'Raanana', '050-6653772', 'Phidra Glstane');
insert into STATION (stationid, city, numberphone, manager)
values (204, 'Raanana', '050-7683905', 'Fidela Glim');
insert into STATION (stationid, city, numberphone, manager)
values (205, 'Raanana', '050-4209266', 'Jandy Vreerg');
insert into STATION (stationid, city, numberphone, manager)
values (206, 'Raanana', '050-2070021', 'Brendon Ick');
insert into STATION (stationid, city, numberphone, manager)
values (207, 'Raanana', '050-6663066', 'Livvyy Olanda');
insert into STATION (stationid, city, numberphone, manager)
values (208, 'Raanana', '050-7360221', 'Felecia Embra');
insert into STATION (stationid, city, numberphone, manager)
values (209, 'Givatayim', '050-4378812', 'Jasper Janko');
insert into STATION (stationid, city, numberphone, manager)
values (210, 'Givatayim', '050-6745664', 'Kenn Sconce');
insert into STATION (stationid, city, numberphone, manager)
values (211, 'Givatayim', '050-8151051', 'Odele Towow');
insert into STATION (stationid, city, numberphone, manager)
values (212, 'Givatayim', '052-7232298', 'Rodi Fkirk');
insert into STATION (stationid, city, numberphone, manager)
values (213, 'Givatayim', '052-6020014', 'Willie On');
insert into STATION (stationid, city, numberphone, manager)
values (214, 'Givatayim', '052-4950393', 'Ericka McDfy');
insert into STATION (stationid, city, numberphone, manager)
values (215, 'Givatayim', '052-4021752', 'Flossi Chasier');
insert into STATION (stationid, city, numberphone, manager)
values (216, 'Givatayim', '052-5389135', 'Grier Tod');
insert into STATION (stationid, city, numberphone, manager)
values (217, 'Givatayim', '052-6960482', 'Bebe Palay');
insert into STATION (stationid, city, numberphone, manager)
values (218, 'Givatayim', '052-1481763', 'Regina Charlo');
insert into STATION (stationid, city, numberphone, manager)
values (219, 'Givatayim', '052-7533124', 'Dasi Veronue');
insert into STATION (stationid, city, numberphone, manager)
values (220, 'Givatayim', '052-3907974', 'Kara Veldt');
insert into STATION (stationid, city, numberphone, manager)
values (221, 'Givatayim', '052-1207410', 'Benson Guinan');
insert into STATION (stationid, city, numberphone, manager)
values (222, 'Eilat', '052-9277856', 'Perla Skngs');
insert into STATION (stationid, city, numberphone, manager)
values (223, 'Eilat', '052-5928029', 'Harlin Beals');
insert into STATION (stationid, city, numberphone, manager)
values (224, 'Eilat', '052-7908054', 'Baldwin Sster');
insert into STATION (stationid, city, numberphone, manager)
values (225, 'Eilat', '052-7860434', 'Lauritz Ewin');
insert into STATION (stationid, city, numberphone, manager)
values (226, 'Eilat', '052-9629307', 'Winifred Behr');
insert into STATION (stationid, city, numberphone, manager)
values (227, 'Eilat', '053-1098502', 'Adan Goodlad');
insert into STATION (stationid, city, numberphone, manager)
values (228, 'Eilat', '053-9707448', 'Leif McCis');
insert into STATION (stationid, city, numberphone, manager)
values (229, 'Eilat', '053-8495297', 'Terri Twrow');
insert into STATION (stationid, city, numberphone, manager)
values (230, 'Eilat', '053-2834910', 'Alane Hasloch');
insert into STATION (stationid, city, numberphone, manager)
values (231, 'Eilat', '053-7071056', 'Petnia Devey');
insert into STATION (stationid, city, numberphone, manager)
values (232, 'Eilat', '053-5325666', 'Alexis Mihieli');
insert into STATION (stationid, city, numberphone, manager)
values (233, 'Eilat', '053-7746079', 'Stanford Huard');
insert into STATION (stationid, city, numberphone, manager)
values (234, 'Eilat', '053-7960920', 'Kakalina Varill');
insert into STATION (stationid, city, numberphone, manager)
values (235, 'Eilat', '053-7261452', 'Sholom Lili');
insert into STATION (stationid, city, numberphone, manager)
values (236, 'Eilat', '053-4211753', 'Olva Telker');
insert into STATION (stationid, city, numberphone, manager)
values (237, 'Eilat', '053-6279475', 'Alssa Liddel');
insert into STATION (stationid, city, numberphone, manager)
values (238, 'Afula', '053-1858869', 'Garey Tux');
insert into STATION (stationid, city, numberphone, manager)
values (239, 'Afula', '053-4942591', 'Roary Chaers');
insert into STATION (stationid, city, numberphone, manager)
values (240, 'Afula', '053-4494691', 'Sonya Lamy');
insert into STATION (stationid, city, numberphone, manager)
values (241, 'Nahariya', '053-6793567', 'Gardie Edrly');
insert into STATION (stationid, city, numberphone, manager)
values (242, 'Nahariya', '053-9202698', 'Clem Goreway');
insert into STATION (stationid, city, numberphone, manager)
values (243, 'Nahariya', '053-1624098', 'Jana Mcole');
insert into STATION (stationid, city, numberphone, manager)
values (244, 'Nahariya', '053-6605934', 'Evangelin Erley');
insert into STATION (stationid, city, numberphone, manager)
values (245, 'Nahariya', '053-5569851', 'Merla Klaas');
insert into STATION (stationid, city, numberphone, manager)
values (246, 'Nahariya', '053-5157725', 'Fair Noter');
insert into STATION (stationid, city, numberphone, manager)
values (247, 'Tiberias', '057-6251327', 'Teddie Ader');
insert into STATION (stationid, city, numberphone, manager)
values (248, 'Tiberias', '057-3607211', 'Vonny Molden');
insert into STATION (stationid, city, numberphone, manager)
values (249, 'Tiberias', '057-7881538', 'Figo Cawt');
insert into STATION (stationid, city, numberphone, manager)
values (250, 'Tiberias', '057-2460150', 'Lynn Davey');
insert into STATION (stationid, city, numberphone, manager)
values (251, 'Tiberias', '057-4416508', 'Cao Fiddian');
insert into STATION (stationid, city, numberphone, manager)
values (252, 'Tiberias', '057-4435311', 'Munmro Merton');
insert into STATION (stationid, city, numberphone, manager)
values (253, 'Lod', '057-2916515', 'Midge Weins');
insert into STATION (stationid, city, numberphone, manager)
values (254, 'Lod', '057-8837727', 'Veradis Bockin');
insert into STATION (stationid, city, numberphone, manager)
values (255, 'Lod', '057-3458164', 'Erwin Phiock');
insert into STATION (stationid, city, numberphone, manager)
values (256, 'Lod', '057-4771411', 'Grace Bowler');
insert into STATION (stationid, city, numberphone, manager)
values (257, 'Lod', '057-4939035', 'Rozele Mazzeo');
insert into STATION (stationid, city, numberphone, manager)
values (258, 'Lod', '057-4464917', 'Regine Tracey');
insert into STATION (stationid, city, numberphone, manager)
values (259, 'Lod', '057-5302389', 'Iggie Tassler');
insert into STATION (stationid, city, numberphone, manager)
values (260, 'Lod', '057-3642490', 'Mikey Gibbe');
insert into STATION (stationid, city, numberphone, manager)
values (261, 'Lod', '057-4052124', 'Male McKenny');
insert into STATION (stationid, city, numberphone, manager)
values (262, 'Lod', '057-5659180', 'Tah Jepp');
insert into STATION (stationid, city, numberphone, manager)
values (263, 'Lod', '057-4198322', 'Fredric Cowdow');
insert into STATION (stationid, city, numberphone, manager)
values (264, 'Ramla', '057-7230885', 'Muffin Camel');
insert into STATION (stationid, city, numberphone, manager)
values (265, 'Ramla', '057-8953641', 'Jemie Olsson');
insert into STATION (stationid, city, numberphone, manager)
values (266, 'Rosh HaAyin', '057-7728569', 'Araldo Chaken');
insert into STATION (stationid, city, numberphone, manager)
values (267, 'Rosh HaAyin', '057-8403567', 'Chaddy Anthon');
insert into STATION (stationid, city, numberphone, manager)
values (268, 'Rosh HaAyin', '057-4474036', 'Fulton Winham');
insert into STATION (stationid, city, numberphone, manager)
values (269, 'Rosh HaAyin', '057-1618254', 'Chaian Bartich');
insert into STATION (stationid, city, numberphone, manager)
values (270, 'Rosh HaAyin', '057-7857726', 'Duffy Obray');
insert into STATION (stationid, city, numberphone, manager)
values (271, 'Rosh HaAyin', '057-3908166', 'Baird Ton');
insert into STATION (stationid, city, numberphone, manager)
values (272, 'Rosh HaAyin', '057-2961158', 'Norina Mcrson');
insert into STATION (stationid, city, numberphone, manager)
values (273, 'Rosh HaAyin', '057-7494144', 'Field Ambler');
insert into STATION (stationid, city, numberphone, manager)
values (274, 'Rosh HaAyin', '057-6885059', 'Sherk Spivey');
insert into STATION (stationid, city, numberphone, manager)
values (275, 'Rosh HaAyin', '050-3899389', 'Kendell Abe');
insert into STATION (stationid, city, numberphone, manager)
values (276, 'Rosh HaAyin', '050-1677330', 'Ardys Gorcke');
insert into STATION (stationid, city, numberphone, manager)
values (277, 'Rosh HaAyin', '050-8731108', 'Filippa Edser');
insert into STATION (stationid, city, numberphone, manager)
values (278, 'Kiryat Gat', '050-8654671', 'Drusi Silson');
insert into STATION (stationid, city, numberphone, manager)
values (279, 'Kiryat Gat', '050-5319162', 'Karlte Hrdman');
insert into STATION (stationid, city, numberphone, manager)
values (280, 'Kiryat Gat', '050-1878924', 'Berndo Brown');
insert into STATION (stationid, city, numberphone, manager)
values (281, 'Kiryat Gat', '050-3820279', 'Arlina Mechan');
insert into STATION (stationid, city, numberphone, manager)
values (282, 'Kiryat Gat', '050-5612931', 'Alecia Leatod');
insert into STATION (stationid, city, numberphone, manager)
values (283, 'Kiryat Gat', '050-7436432', 'Mace Adacot');
insert into STATION (stationid, city, numberphone, manager)
values (284, 'Kiryat Motzkin', '050-5770111', 'Giffer Coam');
insert into STATION (stationid, city, numberphone, manager)
values (285, 'Kiryat Motzkin', '050-9122011', 'Vina Kidman');
insert into STATION (stationid, city, numberphone, manager)
values (286, 'Kiryat Motzkin', '050-4985048', 'Clina Pitone');
insert into STATION (stationid, city, numberphone, manager)
values (287, 'Kiryat Motzkin', '050-9369130', 'Jandy Kopmann');
insert into STATION (stationid, city, numberphone, manager)
values (288, 'Kiryat Motzkin', '050-5399669', 'Hugh Tarn');
insert into STATION (stationid, city, numberphone, manager)
values (289, 'Kiryat Motzkin', '050-6549691', 'Toni Scuse');
insert into STATION (stationid, city, numberphone, manager)
values (290, 'Kiryat Motzkin', '050-7111951', 'Wilden Anev');
insert into STATION (stationid, city, numberphone, manager)
values (291, 'Kiryat Bialik', '050-9012768', 'Lu Colbert');
insert into STATION (stationid, city, numberphone, manager)
values (292, 'Kiryat Bialik', '050-8647655', 'Chastity Dutcn');
insert into STATION (stationid, city, numberphone, manager)
values (293, 'Kiryat Bialik', '050-7986504', 'Justn Kirman');
insert into STATION (stationid, city, numberphone, manager)
values (294, 'Kiryat Bialik', '050-5174214', 'Amelie Ih');
insert into STATION (stationid, city, numberphone, manager)
values (295, 'Kiryat Bialik', '054-2725103', 'Andonis Pre');
insert into STATION (stationid, city, numberphone, manager)
values (296, 'Kiryat Yam', '054-9610223', 'Tristam Guam');
insert into STATION (stationid, city, numberphone, manager)
values (297, 'Kiryat Yam', '054-1928209', 'Pearline BIN');
insert into STATION (stationid, city, numberphone, manager)
values (298, 'Kiryat Yam', '054-7659392', 'Mehebel Remer');
insert into STATION (stationid, city, numberphone, manager)
values (299, 'Kiryat Ata', '054-7152751', 'Ware Wingar');
insert into STATION (stationid, city, numberphone, manager)
values (300, 'Kiryat Ata', '054-2005592', 'Roanne Selly');
commit;
prompt 300 records committed...
insert into STATION (stationid, city, numberphone, manager)
values (301, 'Kiryat Ata', '054-4124632', 'Billy Riell');
insert into STATION (stationid, city, numberphone, manager)
values (302, 'Dimona', '054-4289491', 'Caten McCarly');
insert into STATION (stationid, city, numberphone, manager)
values (303, 'Dimona', '054-8380023', 'Fey Malor');
insert into STATION (stationid, city, numberphone, manager)
values (304, 'Dimona', '054-4375263', 'Ophelia Sirs');
insert into STATION (stationid, city, numberphone, manager)
values (305, 'Dimona', '054-8961355', 'Kendal Batt');
insert into STATION (stationid, city, numberphone, manager)
values (306, 'Dimona', '059-2639648', 'Barn Merle');
insert into STATION (stationid, city, numberphone, manager)
values (307, 'Or Yehuda', '059-3315901', 'Loria Matula');
insert into STATION (stationid, city, numberphone, manager)
values (308, 'Or Yehuda', '059-5741419', 'Wakld Adcz');
insert into STATION (stationid, city, numberphone, manager)
values (309, 'Or Yehuda', '059-5472489', 'Merci McLain');
insert into STATION (stationid, city, numberphone, manager)
values (310, 'Nesher', '059-3286802', 'Clems Connor');
insert into STATION (stationid, city, numberphone, manager)
values (311, 'Nesher', '059-4122315', 'Ame Bointon');
insert into STATION (stationid, city, numberphone, manager)
values (312, 'Sakhnin', '059-8887207', 'Diahann Oby');
insert into STATION (stationid, city, numberphone, manager)
values (313, 'Karmiel', '059-9590706', 'Skye MacAdam');
insert into STATION (stationid, city, numberphone, manager)
values (314, 'Karmiel', '059-9905590', 'Antte Geist');
insert into STATION (stationid, city, numberphone, manager)
values (315, 'Karmiel', '059-1454914', 'Deedee Beggan');
insert into STATION (stationid, city, numberphone, manager)
values (316, 'Yavne', '059-5649595', 'Cayla Habrne');
insert into STATION (stationid, city, numberphone, manager)
values (317, 'Yavne', '059-8011641', 'Mica Ridgwell');
insert into STATION (stationid, city, numberphone, manager)
values (318, 'Yavne', '059-4987586', 'Barb Nicoson');
insert into STATION (stationid, city, numberphone, manager)
values (319, 'Sderot', '059-2498802', 'Joeann Budck');
insert into STATION (stationid, city, numberphone, manager)
values (320, 'Sderot', '059-5929934', 'Artie Goy');
insert into STATION (stationid, city, numberphone, manager)
values (321, 'Sderot', '053-5887745', 'Melli Kitidge');
insert into STATION (stationid, city, numberphone, manager)
values (322, 'Sderot', '053-1717310', 'Darryl Jess');
insert into STATION (stationid, city, numberphone, manager)
values (323, 'Sderot', '053-3653538', 'Pet Caret');
insert into STATION (stationid, city, numberphone, manager)
values (324, 'Sderot', '053-5916911', 'Anse Rohon');
insert into STATION (stationid, city, numberphone, manager)
values (325, 'Sderot', '053-5803250', 'Arlla Dewane');
insert into STATION (stationid, city, numberphone, manager)
values (326, 'Sderot', '053-3181062', 'Ode Wilee');
insert into STATION (stationid, city, numberphone, manager)
values (327, 'Sderot', '053-6501050', 'Mare Gaydon');
insert into STATION (stationid, city, numberphone, manager)
values (328, 'Sderot', '053-5058183', 'Rick Cery');
insert into STATION (stationid, city, numberphone, manager)
values (329, 'Ofakim', '053-8758176', 'Kaey Lisle');
insert into STATION (stationid, city, numberphone, manager)
values (330, 'Ofakim', '053-2493587', 'Skipp Macw');
insert into STATION (stationid, city, numberphone, manager)
values (331, 'Ofakim', '051-4269514', 'Kasper Byneth');
insert into STATION (stationid, city, numberphone, manager)
values (332, 'Ofakim', '051-6661259', 'Amble Hegden');
insert into STATION (stationid, city, numberphone, manager)
values (333, 'Ofakim', '051-5990086', 'Jilne Brall');
insert into STATION (stationid, city, numberphone, manager)
values (334, 'Arad', '660518-2977914', 'Bobna Gabel');
insert into STATION (stationid, city, numberphone, manager)
values (335, 'Arad', '051-3906724', 'Gie Rers');
insert into STATION (stationid, city, numberphone, manager)
values (336, 'Ramat Yishai', '051-2304923', 'Jacky Tery.');
insert into STATION (stationid, city, numberphone, manager)
values (337, 'Ramat Yishai', '051-9564973', 'Carlyle Gok');
insert into STATION (stationid, city, numberphone, manager)
values (338, 'Ramat Yishai', '051-2055616', 'Arlee Rogez');
insert into STATION (stationid, city, numberphone, manager)
values (339, 'Ramat Yishai', '051-6364443', 'Maurita Tutt');
insert into STATION (stationid, city, numberphone, manager)
values (340, 'Ramat Yishai', '051-8436665', 'Neal Masser');
insert into STATION (stationid, city, numberphone, manager)
values (341, 'Ramat Yishai', '051-3403025', 'Tamarra Leddie');
insert into STATION (stationid, city, numberphone, manager)
values (342, 'Ramat Yishai', '051-5152424', 'Laue Odge');
insert into STATION (stationid, city, numberphone, manager)
values (343, 'Ramat Yishai', '051-2611288', 'Joete Savile');
insert into STATION (stationid, city, numberphone, manager)
values (344, 'Ramat Yishai', '051-6846748', 'Brigit Emand');
insert into STATION (stationid, city, numberphone, manager)
values (345, 'Ramat Yishai', '051-5531359', 'Phena Anfusso');
insert into STATION (stationid, city, numberphone, manager)
values (346, 'Kiryat Shmona', '051-1824819', 'Haskell Juricz');
insert into STATION (stationid, city, numberphone, manager)
values (347, 'Kiryat Shmona', '051-2072720', 'Ethyl Nutten');
insert into STATION (stationid, city, numberphone, manager)
values (348, 'Kiryat Shmona', '051-3150120', 'Jessee Matko');
insert into STATION (stationid, city, numberphone, manager)
values (349, 'Kiryat Shmona', '051-8656799', 'Langston Dem');
insert into STATION (stationid, city, numberphone, manager)
values (350, 'Kiryat Shmona', '052-1486094', 'Chaty Mastie');
insert into STATION (stationid, city, numberphone, manager)
values (351, 'Kiryat Shmona', '052-5396500', 'Darrick Alin');
insert into STATION (stationid, city, numberphone, manager)
values (352, 'Kiryat Shmona', '052-5445637', 'Saie Ferrero');
insert into STATION (stationid, city, numberphone, manager)
values (353, 'Kiryat Shmona', '052-9223739', 'Sitte Barratt');
insert into STATION (stationid, city, numberphone, manager)
values (354, 'Kiryat Shmona', '052-9093219', 'Giorgio Gne');
insert into STATION (stationid, city, numberphone, manager)
values (355, 'Kiryat Shmona', '052-4609219', 'Brier Eibe');
insert into STATION (stationid, city, numberphone, manager)
values (356, 'Kiryat Shmona', '052-2624647', 'Bea Pfaffe');
insert into STATION (stationid, city, numberphone, manager)
values (357, 'Kiryat Shmona', '052-5919201', 'Joleen Ary');
insert into STATION (stationid, city, numberphone, manager)
values (358, 'Kiryat Shmona', '052-2320055', 'Randal Zavi');
insert into STATION (stationid, city, numberphone, manager)
values (359, 'Zichron Yaakov', '052-3264062', 'Binni Swen');
insert into STATION (stationid, city, numberphone, manager)
values (360, 'Zichron Yaakov', '052-7971894', 'Scottie Brett');
insert into STATION (stationid, city, numberphone, manager)
values (361, 'Binyamina', '052-3125582', 'Rria Koyev');
insert into STATION (stationid, city, numberphone, manager)
values (362, 'Binyamina', '052-7993981', 'Brenda Otto');
insert into STATION (stationid, city, numberphone, manager)
values (363, 'Binyamina', '052-3582804', 'Josi Cons');
insert into STATION (stationid, city, numberphone, manager)
values (364, 'Binyamina', '052-5099551', 'Leigha Tott');
insert into STATION (stationid, city, numberphone, manager)
values (365, 'Binyamina', '052-3962339', 'Shee Horth');
insert into STATION (stationid, city, numberphone, manager)
values (366, 'Binyamina', '052-5140867', 'Tris MacQer');
insert into STATION (stationid, city, numberphone, manager)
values (367, 'Binyamina', '052-7340419', 'Sancho Epton');
insert into STATION (stationid, city, numberphone, manager)
values (368, 'Binyamina', '052-4740825', 'Adria Jaze');
insert into STATION (stationid, city, numberphone, manager)
values (369, 'Binyamina', '052-4008722', 'Sarge Huguet');
insert into STATION (stationid, city, numberphone, manager)
values (370, 'Binyamina', '052-9024059', 'Lovell Treat');
insert into STATION (stationid, city, numberphone, manager)
values (371, 'Or Akiva', '052-5559267', 'Nickos Mer');
insert into STATION (stationid, city, numberphone, manager)
values (372, 'Or Akiva', '052-4241490', 'Benkt Twidell');
insert into STATION (stationid, city, numberphone, manager)
values (373, 'Or Akiva', '052-2881647', 'Vanna Torton');
insert into STATION (stationid, city, numberphone, manager)
values (374, 'Or Akiva', '052-2013605', 'Viv Toulson');
insert into STATION (stationid, city, numberphone, manager)
values (375, 'Shlomi', '057-2241940', 'Harley Reels');
insert into STATION (stationid, city, numberphone, manager)
values (376, 'Shlomi', '057-6996474', 'Sheree Fahom');
insert into STATION (stationid, city, numberphone, manager)
values (377, 'Shlomi', '057-6034086', 'Valee Fewkes');
insert into STATION (stationid, city, numberphone, manager)
values (378, 'Shlomi', '057-7414346', 'Reece Causbey');
insert into STATION (stationid, city, numberphone, manager)
values (379, 'Shlomi', '057-7343169', 'Willi Robaey');
insert into STATION (stationid, city, numberphone, manager)
values (380, 'Tel Sheva', '057-9286903', 'Michel Hoden');
insert into STATION (stationid, city, numberphone, manager)
values (381, 'Tel Sheva', '057-2086793', 'Kania Peow');
insert into STATION (stationid, city, numberphone, manager)
values (382, 'Tel Sheva', '057-5240027', 'Ren Whd');
insert into STATION (stationid, city, numberphone, manager)
values (383, 'Tel Sheva', '057-2507220', 'Darn Broi');
insert into STATION (stationid, city, numberphone, manager)
values (384, 'Tel Sheva', '057-5486312', 'Bldie Laff');
insert into STATION (stationid, city, numberphone, manager)
values (385, 'Tel Sheva', '057-8415622', 'Austin Shewin');
insert into STATION (stationid, city, numberphone, manager)
values (386, 'Tel Sheva', '057-1721576', 'Bride Monr');
insert into STATION (stationid, city, numberphone, manager)
values (387, 'Tel Sheva', '057-6924696', 'Em Veld');
insert into STATION (stationid, city, numberphone, manager)
values (388, 'Tel Sheva', '057-4723743', 'Wght Beany');
insert into STATION (stationid, city, numberphone, manager)
values (389, 'Tel Sheva', '057-5039946', 'Pippo Dickons');
insert into STATION (stationid, city, numberphone, manager)
values (390, 'Rahat', '057-1572180', 'Caus Nel');
insert into STATION (stationid, city, numberphone, manager)
values (391, 'Elad', '057-2452336', 'Nila Tanslie');
insert into STATION (stationid, city, numberphone, manager)
values (392, 'Elad', '057-6329235', 'Clus Stiloe');
insert into STATION (stationid, city, numberphone, manager)
values (393, 'Elad', '057-9689051', 'Catlin Mer');
insert into STATION (stationid, city, numberphone, manager)
values (394, 'Bnei Ayish', '057-5642025', 'Marylin Bey');
insert into STATION (stationid, city, numberphone, manager)
values (395, 'Gan Yavne', '057-4170566', 'Corny Elloy');
insert into STATION (stationid, city, numberphone, manager)
values (396, 'Tzur Yigal', '057-7611430', 'Briggs Leale');
insert into STATION (stationid, city, numberphone, manager)
values (397, 'Tzur Yigal', '057-6213314', 'Gracie Cracie');
insert into STATION (stationid, city, numberphone, manager)
values (398, 'Netivot', '057-6942920', 'Mayd Baynom');
insert into STATION (stationid, city, numberphone, manager)
values (399, 'Netivot', '057-3139158', 'Nedda Doill');
insert into STATION (stationid, city, numberphone, manager)
values (400, 'Netivot', '057-4780132', 'Mamie Nunes');
commit;
prompt 400 records loaded
prompt Loading DONATION...
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
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (11, to_date('13-01-2020', 'dd-mm-yyyy'), 'Y', 372, 349, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (12, to_date('09-09-2021', 'dd-mm-yyyy'), 'N', 429, 108, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (13, to_date('12-09-2020', 'dd-mm-yyyy'), 'N', 586, 223, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (14, to_date('21-04-2023', 'dd-mm-yyyy'), 'N', 394, 95, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (15, to_date('13-12-2021', 'dd-mm-yyyy'), 'N', 348, 72, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (16, to_date('07-06-2023', 'dd-mm-yyyy'), 'Y', 240, 156, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (17, to_date('16-01-2023', 'dd-mm-yyyy'), 'N', 633, 8, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (18, to_date('09-06-2021', 'dd-mm-yyyy'), 'N', 407, 356, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (19, to_date('23-04-2020', 'dd-mm-yyyy'), 'Y', 262, 194, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (20, to_date('01-10-2022', 'dd-mm-yyyy'), 'Y', 235, 150, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (21, to_date('14-12-2021', 'dd-mm-yyyy'), 'N', 245, 291, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (22, to_date('04-05-2023', 'dd-mm-yyyy'), 'Y', 291, 140, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (23, to_date('25-09-2023', 'dd-mm-yyyy'), 'Y', 662, 253, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (24, to_date('29-06-2020', 'dd-mm-yyyy'), 'Y', 320, 172, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (25, to_date('09-09-2021', 'dd-mm-yyyy'), 'Y', 430, 142, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (26, to_date('26-09-2022', 'dd-mm-yyyy'), 'N', 520, 21, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (27, to_date('30-11-2022', 'dd-mm-yyyy'), 'N', 255, 353, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (28, to_date('06-01-2022', 'dd-mm-yyyy'), 'Y', 335, 381, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (29, to_date('24-08-2020', 'dd-mm-yyyy'), 'N', 577, 188, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (30, to_date('18-05-2021', 'dd-mm-yyyy'), 'N', 525, 322, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (31, to_date('24-05-2021', 'dd-mm-yyyy'), 'N', 136, 202, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (32, to_date('22-10-2020', 'dd-mm-yyyy'), 'Y', 307, 58, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (33, to_date('05-12-2021', 'dd-mm-yyyy'), 'Y', 343, 144, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (34, to_date('23-08-2023', 'dd-mm-yyyy'), 'Y', 239, 153, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (35, to_date('23-10-2020', 'dd-mm-yyyy'), 'Y', 654, 86, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (36, to_date('02-09-2023', 'dd-mm-yyyy'), 'Y', 533, 260, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (37, to_date('19-04-2021', 'dd-mm-yyyy'), 'N', 160, 210, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (38, to_date('06-06-2023', 'dd-mm-yyyy'), 'Y', 409, 91, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (39, to_date('19-08-2023', 'dd-mm-yyyy'), 'Y', 184, 59, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (40, to_date('04-02-2021', 'dd-mm-yyyy'), 'N', 129, 78, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (41, to_date('29-11-2023', 'dd-mm-yyyy'), 'Y', 529, 55, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (42, to_date('21-06-2021', 'dd-mm-yyyy'), 'N', 221, 137, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (43, to_date('08-04-2021', 'dd-mm-yyyy'), 'Y', 250, 144, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (44, to_date('02-08-2023', 'dd-mm-yyyy'), 'Y', 455, 112, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (45, to_date('18-04-2022', 'dd-mm-yyyy'), 'Y', 125, 136, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (46, to_date('21-04-2020', 'dd-mm-yyyy'), 'Y', 661, 10, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (47, to_date('12-07-2020', 'dd-mm-yyyy'), 'N', 293, 74, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (48, to_date('13-07-2021', 'dd-mm-yyyy'), 'Y', 285, 362, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (49, to_date('07-01-2021', 'dd-mm-yyyy'), 'N', 535, 353, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (50, to_date('08-01-2021', 'dd-mm-yyyy'), 'N', 458, 230, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (51, to_date('04-05-2022', 'dd-mm-yyyy'), 'N', 561, 78, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (52, to_date('01-06-2023', 'dd-mm-yyyy'), 'N', 382, 3, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (53, to_date('12-06-2022', 'dd-mm-yyyy'), 'Y', 261, 359, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (54, to_date('18-01-2023', 'dd-mm-yyyy'), 'Y', 668, 231, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (55, to_date('03-09-2023', 'dd-mm-yyyy'), 'N', 275, 43, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (56, to_date('16-12-2023', 'dd-mm-yyyy'), 'Y', 401, 170, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (57, to_date('22-01-2021', 'dd-mm-yyyy'), 'N', 317, 248, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (58, to_date('08-02-2021', 'dd-mm-yyyy'), 'Y', 262, 285, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (59, to_date('11-08-2022', 'dd-mm-yyyy'), 'Y', 374, 75, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (60, to_date('07-12-2022', 'dd-mm-yyyy'), 'N', 178, 359, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (61, to_date('12-10-2022', 'dd-mm-yyyy'), 'N', 373, 40, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (62, to_date('25-07-2022', 'dd-mm-yyyy'), 'Y', 369, 79, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (63, to_date('07-07-2023', 'dd-mm-yyyy'), 'Y', 268, 106, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (64, to_date('06-05-2020', 'dd-mm-yyyy'), 'Y', 411, 52, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (65, to_date('06-09-2022', 'dd-mm-yyyy'), 'Y', 378, 310, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (66, to_date('29-04-2021', 'dd-mm-yyyy'), 'N', 449, 22, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (67, to_date('08-03-2020', 'dd-mm-yyyy'), 'Y', 360, 320, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (68, to_date('14-08-2022', 'dd-mm-yyyy'), 'N', 264, 247, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (69, to_date('09-08-2023', 'dd-mm-yyyy'), 'Y', 329, 321, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (70, to_date('07-07-2021', 'dd-mm-yyyy'), 'Y', 668, 30, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (71, to_date('31-12-2023', 'dd-mm-yyyy'), 'Y', 366, 260, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (72, to_date('08-07-2023', 'dd-mm-yyyy'), 'N', 142, 159, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (73, to_date('19-01-2023', 'dd-mm-yyyy'), 'Y', 561, 31, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (74, to_date('27-01-2021', 'dd-mm-yyyy'), 'N', 427, 107, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (75, to_date('07-12-2020', 'dd-mm-yyyy'), 'N', 225, 18, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (76, to_date('26-06-2020', 'dd-mm-yyyy'), 'Y', 232, 268, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (77, to_date('23-10-2020', 'dd-mm-yyyy'), 'N', 612, 67, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (78, to_date('27-06-2022', 'dd-mm-yyyy'), 'Y', 403, 331, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (79, to_date('04-06-2022', 'dd-mm-yyyy'), 'Y', 122, 266, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (80, to_date('29-01-2020', 'dd-mm-yyyy'), 'Y', 200, 192, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (81, to_date('17-10-2020', 'dd-mm-yyyy'), 'N', 520, 76, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (82, to_date('02-11-2022', 'dd-mm-yyyy'), 'N', 372, 271, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (83, to_date('28-12-2023', 'dd-mm-yyyy'), 'Y', 290, 92, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (84, to_date('04-03-2023', 'dd-mm-yyyy'), 'N', 287, 309, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (85, to_date('07-06-2021', 'dd-mm-yyyy'), 'Y', 347, 391, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (86, to_date('13-05-2020', 'dd-mm-yyyy'), 'N', 624, 374, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (87, to_date('25-07-2022', 'dd-mm-yyyy'), 'Y', 623, 56, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (88, to_date('28-08-2021', 'dd-mm-yyyy'), 'N', 325, 396, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (89, to_date('05-03-2022', 'dd-mm-yyyy'), 'Y', 192, 294, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (90, to_date('14-09-2023', 'dd-mm-yyyy'), 'N', 358, 121, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (91, to_date('24-06-2020', 'dd-mm-yyyy'), 'N', 612, 213, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (92, to_date('14-04-2023', 'dd-mm-yyyy'), 'N', 527, 246, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (93, to_date('09-06-2022', 'dd-mm-yyyy'), 'Y', 617, 17, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (94, to_date('02-01-2023', 'dd-mm-yyyy'), 'N', 519, 28, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (95, to_date('08-01-2021', 'dd-mm-yyyy'), 'N', 474, 123, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (96, to_date('10-05-2022', 'dd-mm-yyyy'), 'N', 594, 203, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (97, to_date('06-07-2022', 'dd-mm-yyyy'), 'Y', 151, 400, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (98, to_date('18-02-2023', 'dd-mm-yyyy'), 'Y', 213, 359, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (99, to_date('09-07-2021', 'dd-mm-yyyy'), 'N', 397, 317, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (100, to_date('20-12-2022', 'dd-mm-yyyy'), 'N', 653, 370, 16);
commit;
prompt 100 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (101, to_date('18-10-2020', 'dd-mm-yyyy'), 'Y', 455, 251, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (102, to_date('09-02-2020', 'dd-mm-yyyy'), 'N', 456, 64, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (103, to_date('14-11-2022', 'dd-mm-yyyy'), 'Y', 414, 204, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (104, to_date('16-06-2022', 'dd-mm-yyyy'), 'Y', 338, 214, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (105, to_date('16-11-2022', 'dd-mm-yyyy'), 'Y', 170, 87, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (106, to_date('27-12-2022', 'dd-mm-yyyy'), 'N', 110, 240, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (107, to_date('21-06-2023', 'dd-mm-yyyy'), 'Y', 174, 146, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (108, to_date('04-10-2023', 'dd-mm-yyyy'), 'Y', 673, 336, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (109, to_date('14-10-2022', 'dd-mm-yyyy'), 'Y', 325, 15, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (110, to_date('23-05-2020', 'dd-mm-yyyy'), 'Y', 689, 68, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (111, to_date('28-06-2022', 'dd-mm-yyyy'), 'N', 187, 177, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (112, to_date('21-05-2022', 'dd-mm-yyyy'), 'Y', 390, 317, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (113, to_date('02-01-2022', 'dd-mm-yyyy'), 'N', 649, 146, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (114, to_date('24-10-2023', 'dd-mm-yyyy'), 'N', 139, 122, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (115, to_date('27-05-2022', 'dd-mm-yyyy'), 'N', 589, 384, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (116, to_date('28-08-2022', 'dd-mm-yyyy'), 'Y', 455, 233, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (117, to_date('11-07-2020', 'dd-mm-yyyy'), 'Y', 117, 40, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (118, to_date('21-12-2020', 'dd-mm-yyyy'), 'Y', 326, 78, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (119, to_date('19-09-2021', 'dd-mm-yyyy'), 'N', 166, 91, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (120, to_date('04-12-2022', 'dd-mm-yyyy'), 'Y', 369, 319, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (121, to_date('30-06-2023', 'dd-mm-yyyy'), 'N', 450, 183, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (122, to_date('03-05-2021', 'dd-mm-yyyy'), 'Y', 426, 3, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (123, to_date('13-11-2021', 'dd-mm-yyyy'), 'N', 175, 243, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (124, to_date('19-06-2022', 'dd-mm-yyyy'), 'N', 196, 192, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (125, to_date('25-10-2023', 'dd-mm-yyyy'), 'Y', 691, 397, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (126, to_date('09-01-2021', 'dd-mm-yyyy'), 'N', 308, 84, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (127, to_date('09-03-2021', 'dd-mm-yyyy'), 'N', 291, 289, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (128, to_date('06-09-2023', 'dd-mm-yyyy'), 'N', 220, 312, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (129, to_date('20-03-2022', 'dd-mm-yyyy'), 'N', 228, 218, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (130, to_date('10-04-2023', 'dd-mm-yyyy'), 'Y', 550, 4, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (131, to_date('15-11-2021', 'dd-mm-yyyy'), 'Y', 393, 261, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (132, to_date('20-05-2020', 'dd-mm-yyyy'), 'N', 299, 95, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (133, to_date('25-02-2023', 'dd-mm-yyyy'), 'N', 566, 260, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (134, to_date('01-09-2023', 'dd-mm-yyyy'), 'Y', 249, 71, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (135, to_date('17-12-2020', 'dd-mm-yyyy'), 'Y', 216, 276, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (136, to_date('11-10-2023', 'dd-mm-yyyy'), 'Y', 352, 357, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (137, to_date('04-01-2022', 'dd-mm-yyyy'), 'N', 336, 73, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (138, to_date('25-04-2022', 'dd-mm-yyyy'), 'Y', 452, 343, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (139, to_date('16-02-2021', 'dd-mm-yyyy'), 'Y', 397, 332, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (140, to_date('02-11-2022', 'dd-mm-yyyy'), 'N', 245, 253, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (141, to_date('25-01-2020', 'dd-mm-yyyy'), 'N', 653, 360, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (142, to_date('15-02-2022', 'dd-mm-yyyy'), 'Y', 492, 320, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (143, to_date('24-05-2022', 'dd-mm-yyyy'), 'Y', 588, 99, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (144, to_date('30-10-2020', 'dd-mm-yyyy'), 'N', 229, 296, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (145, to_date('09-08-2020', 'dd-mm-yyyy'), 'Y', 516, 207, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (146, to_date('08-06-2021', 'dd-mm-yyyy'), 'N', 111, 47, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (147, to_date('15-07-2020', 'dd-mm-yyyy'), 'N', 100, 155, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (148, to_date('25-07-2022', 'dd-mm-yyyy'), 'Y', 131, 140, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (149, to_date('30-08-2020', 'dd-mm-yyyy'), 'Y', 478, 389, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (150, to_date('13-02-2022', 'dd-mm-yyyy'), 'N', 384, 166, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (151, to_date('03-04-2023', 'dd-mm-yyyy'), 'Y', 237, 100, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (152, to_date('26-02-2020', 'dd-mm-yyyy'), 'Y', 374, 89, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (153, to_date('21-10-2021', 'dd-mm-yyyy'), 'Y', 337, 322, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (154, to_date('25-05-2023', 'dd-mm-yyyy'), 'Y', 154, 40, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (155, to_date('10-12-2023', 'dd-mm-yyyy'), 'Y', 549, 116, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (156, to_date('10-12-2021', 'dd-mm-yyyy'), 'Y', 303, 124, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (157, to_date('02-06-2020', 'dd-mm-yyyy'), 'N', 696, 265, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (158, to_date('07-07-2020', 'dd-mm-yyyy'), 'N', 606, 77, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (159, to_date('28-01-2022', 'dd-mm-yyyy'), 'Y', 229, 301, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (160, to_date('25-03-2022', 'dd-mm-yyyy'), 'N', 301, 283, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (161, to_date('27-11-2022', 'dd-mm-yyyy'), 'Y', 599, 276, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (162, to_date('07-07-2020', 'dd-mm-yyyy'), 'Y', 333, 54, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (163, to_date('09-02-2020', 'dd-mm-yyyy'), 'Y', 413, 188, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (164, to_date('06-08-2022', 'dd-mm-yyyy'), 'Y', 132, 76, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (165, to_date('02-04-2020', 'dd-mm-yyyy'), 'N', 381, 12, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (166, to_date('24-03-2020', 'dd-mm-yyyy'), 'Y', 246, 57, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (167, to_date('19-10-2023', 'dd-mm-yyyy'), 'Y', 181, 213, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (168, to_date('27-05-2020', 'dd-mm-yyyy'), 'Y', 472, 181, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (169, to_date('24-05-2021', 'dd-mm-yyyy'), 'N', 534, 362, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (170, to_date('17-09-2020', 'dd-mm-yyyy'), 'Y', 401, 364, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (171, to_date('24-12-2021', 'dd-mm-yyyy'), 'Y', 619, 48, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (172, to_date('21-03-2021', 'dd-mm-yyyy'), 'Y', 656, 142, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (173, to_date('27-10-2021', 'dd-mm-yyyy'), 'N', 113, 292, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (174, to_date('12-05-2021', 'dd-mm-yyyy'), 'N', 601, 296, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (175, to_date('14-08-2022', 'dd-mm-yyyy'), 'Y', 584, 295, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (176, to_date('07-11-2020', 'dd-mm-yyyy'), 'Y', 569, 167, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (177, to_date('11-11-2020', 'dd-mm-yyyy'), 'Y', 147, 228, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (178, to_date('05-10-2021', 'dd-mm-yyyy'), 'N', 632, 170, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (179, to_date('01-03-2023', 'dd-mm-yyyy'), 'N', 645, 65, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (180, to_date('27-08-2023', 'dd-mm-yyyy'), 'Y', 426, 370, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (181, to_date('29-01-2022', 'dd-mm-yyyy'), 'N', 159, 290, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (182, to_date('12-08-2020', 'dd-mm-yyyy'), 'Y', 147, 68, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (183, to_date('07-02-2022', 'dd-mm-yyyy'), 'N', 170, 203, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (184, to_date('19-10-2020', 'dd-mm-yyyy'), 'N', 543, 145, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (185, to_date('13-03-2020', 'dd-mm-yyyy'), 'Y', 147, 25, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (186, to_date('25-10-2021', 'dd-mm-yyyy'), 'N', 309, 374, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (187, to_date('31-08-2023', 'dd-mm-yyyy'), 'Y', 423, 233, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (188, to_date('28-03-2021', 'dd-mm-yyyy'), 'Y', 132, 157, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (189, to_date('25-01-2023', 'dd-mm-yyyy'), 'N', 258, 323, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (190, to_date('05-12-2022', 'dd-mm-yyyy'), 'N', 126, 266, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (191, to_date('30-07-2020', 'dd-mm-yyyy'), 'Y', 650, 288, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (192, to_date('22-12-2020', 'dd-mm-yyyy'), 'Y', 417, 91, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (193, to_date('31-12-2021', 'dd-mm-yyyy'), 'Y', 272, 191, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (194, to_date('14-03-2022', 'dd-mm-yyyy'), 'Y', 487, 235, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (195, to_date('22-11-2020', 'dd-mm-yyyy'), 'N', 441, 385, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (196, to_date('24-05-2021', 'dd-mm-yyyy'), 'N', 390, 151, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (197, to_date('30-12-2020', 'dd-mm-yyyy'), 'Y', 474, 196, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (198, to_date('17-05-2021', 'dd-mm-yyyy'), 'Y', 285, 174, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (199, to_date('21-09-2021', 'dd-mm-yyyy'), 'Y', 251, 306, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (200, to_date('26-04-2020', 'dd-mm-yyyy'), 'N', 256, 355, 9);
commit;
prompt 200 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (201, to_date('10-04-2020', 'dd-mm-yyyy'), 'Y', 200, 211, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (202, to_date('30-05-2022', 'dd-mm-yyyy'), 'Y', 343, 354, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (203, to_date('24-11-2021', 'dd-mm-yyyy'), 'N', 451, 37, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (204, to_date('14-06-2020', 'dd-mm-yyyy'), 'N', 235, 304, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (205, to_date('11-07-2022', 'dd-mm-yyyy'), 'Y', 331, 215, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (206, to_date('29-04-2021', 'dd-mm-yyyy'), 'N', 626, 79, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (207, to_date('13-06-2022', 'dd-mm-yyyy'), 'N', 668, 159, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (208, to_date('13-12-2020', 'dd-mm-yyyy'), 'N', 294, 39, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (209, to_date('10-05-2023', 'dd-mm-yyyy'), 'N', 288, 75, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (210, to_date('27-05-2023', 'dd-mm-yyyy'), 'Y', 565, 103, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (211, to_date('09-11-2020', 'dd-mm-yyyy'), 'N', 665, 251, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (212, to_date('30-09-2022', 'dd-mm-yyyy'), 'N', 161, 40, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (213, to_date('29-04-2020', 'dd-mm-yyyy'), 'N', 562, 24, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (214, to_date('30-10-2020', 'dd-mm-yyyy'), 'Y', 474, 98, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (215, to_date('06-01-2022', 'dd-mm-yyyy'), 'Y', 457, 263, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (216, to_date('18-05-2023', 'dd-mm-yyyy'), 'N', 566, 393, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (217, to_date('30-01-2020', 'dd-mm-yyyy'), 'N', 487, 326, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (218, to_date('09-02-2023', 'dd-mm-yyyy'), 'N', 565, 359, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (219, to_date('29-10-2021', 'dd-mm-yyyy'), 'N', 244, 254, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (220, to_date('10-12-2021', 'dd-mm-yyyy'), 'Y', 672, 183, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (221, to_date('24-11-2023', 'dd-mm-yyyy'), 'Y', 320, 70, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (222, to_date('09-04-2023', 'dd-mm-yyyy'), 'Y', 389, 286, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (223, to_date('23-05-2020', 'dd-mm-yyyy'), 'N', 110, 334, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (224, to_date('12-12-2023', 'dd-mm-yyyy'), 'Y', 595, 203, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (225, to_date('26-03-2021', 'dd-mm-yyyy'), 'N', 355, 285, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (226, to_date('20-03-2020', 'dd-mm-yyyy'), 'Y', 513, 76, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (227, to_date('21-09-2022', 'dd-mm-yyyy'), 'Y', 374, 204, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (228, to_date('19-08-2020', 'dd-mm-yyyy'), 'N', 141, 121, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (229, to_date('05-08-2021', 'dd-mm-yyyy'), 'Y', 285, 71, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (230, to_date('08-04-2022', 'dd-mm-yyyy'), 'N', 641, 278, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (231, to_date('20-11-2021', 'dd-mm-yyyy'), 'N', 384, 202, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (232, to_date('29-07-2022', 'dd-mm-yyyy'), 'Y', 128, 237, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (233, to_date('19-03-2020', 'dd-mm-yyyy'), 'Y', 529, 166, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (234, to_date('10-03-2022', 'dd-mm-yyyy'), 'Y', 341, 396, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (235, to_date('30-07-2020', 'dd-mm-yyyy'), 'N', 165, 286, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (236, to_date('29-02-2020', 'dd-mm-yyyy'), 'N', 271, 19, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (237, to_date('18-12-2021', 'dd-mm-yyyy'), 'N', 672, 137, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (238, to_date('26-10-2022', 'dd-mm-yyyy'), 'Y', 398, 53, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (239, to_date('31-12-2023', 'dd-mm-yyyy'), 'Y', 463, 258, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (240, to_date('10-09-2020', 'dd-mm-yyyy'), 'N', 452, 131, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (241, to_date('19-12-2020', 'dd-mm-yyyy'), 'N', 558, 338, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (242, to_date('14-07-2021', 'dd-mm-yyyy'), 'Y', 570, 120, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (243, to_date('07-01-2022', 'dd-mm-yyyy'), 'N', 586, 271, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (244, to_date('23-09-2020', 'dd-mm-yyyy'), 'Y', 329, 270, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (245, to_date('12-04-2022', 'dd-mm-yyyy'), 'Y', 321, 82, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (246, to_date('13-09-2022', 'dd-mm-yyyy'), 'Y', 440, 229, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (247, to_date('19-07-2023', 'dd-mm-yyyy'), 'Y', 269, 310, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (248, to_date('18-06-2021', 'dd-mm-yyyy'), 'N', 497, 231, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (249, to_date('03-03-2021', 'dd-mm-yyyy'), 'Y', 503, 340, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (250, to_date('02-05-2020', 'dd-mm-yyyy'), 'N', 275, 200, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (251, to_date('09-01-2023', 'dd-mm-yyyy'), 'N', 541, 291, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (252, to_date('15-09-2023', 'dd-mm-yyyy'), 'Y', 451, 272, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (253, to_date('07-05-2020', 'dd-mm-yyyy'), 'N', 434, 233, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (254, to_date('15-02-2022', 'dd-mm-yyyy'), 'Y', 175, 210, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (255, to_date('12-01-2020', 'dd-mm-yyyy'), 'N', 521, 73, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (256, to_date('28-03-2020', 'dd-mm-yyyy'), 'Y', 516, 350, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (257, to_date('26-08-2022', 'dd-mm-yyyy'), 'N', 571, 390, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (258, to_date('10-01-2023', 'dd-mm-yyyy'), 'N', 461, 182, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (259, to_date('22-11-2021', 'dd-mm-yyyy'), 'N', 551, 40, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (260, to_date('22-03-2020', 'dd-mm-yyyy'), 'Y', 348, 185, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (261, to_date('27-07-2021', 'dd-mm-yyyy'), 'N', 515, 346, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (262, to_date('14-08-2021', 'dd-mm-yyyy'), 'Y', 552, 383, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (263, to_date('02-04-2020', 'dd-mm-yyyy'), 'Y', 351, 108, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (264, to_date('12-04-2021', 'dd-mm-yyyy'), 'Y', 665, 262, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (265, to_date('31-01-2021', 'dd-mm-yyyy'), 'Y', 613, 211, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (266, to_date('26-05-2021', 'dd-mm-yyyy'), 'Y', 503, 205, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (267, to_date('08-07-2021', 'dd-mm-yyyy'), 'Y', 680, 20, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (268, to_date('11-01-2022', 'dd-mm-yyyy'), 'Y', 153, 361, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (269, to_date('30-03-2021', 'dd-mm-yyyy'), 'N', 613, 65, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (270, to_date('11-03-2020', 'dd-mm-yyyy'), 'N', 562, 138, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (271, to_date('06-03-2020', 'dd-mm-yyyy'), 'N', 619, 310, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (272, to_date('14-09-2020', 'dd-mm-yyyy'), 'Y', 603, 307, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (273, to_date('27-11-2022', 'dd-mm-yyyy'), 'Y', 494, 287, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (274, to_date('25-11-2023', 'dd-mm-yyyy'), 'Y', 403, 118, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (275, to_date('07-11-2020', 'dd-mm-yyyy'), 'N', 411, 363, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (276, to_date('20-07-2022', 'dd-mm-yyyy'), 'Y', 443, 129, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (277, to_date('10-02-2022', 'dd-mm-yyyy'), 'Y', 553, 355, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (278, to_date('23-09-2021', 'dd-mm-yyyy'), 'N', 389, 257, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (279, to_date('24-01-2020', 'dd-mm-yyyy'), 'Y', 331, 127, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (280, to_date('15-09-2023', 'dd-mm-yyyy'), 'Y', 552, 134, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (281, to_date('30-06-2021', 'dd-mm-yyyy'), 'Y', 438, 101, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (282, to_date('17-02-2021', 'dd-mm-yyyy'), 'N', 302, 124, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (283, to_date('31-08-2023', 'dd-mm-yyyy'), 'Y', 621, 118, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (284, to_date('26-03-2020', 'dd-mm-yyyy'), 'N', 238, 283, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (285, to_date('07-03-2023', 'dd-mm-yyyy'), 'Y', 347, 311, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (286, to_date('16-08-2021', 'dd-mm-yyyy'), 'Y', 379, 12, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (287, to_date('24-10-2020', 'dd-mm-yyyy'), 'Y', 111, 319, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (288, to_date('06-01-2020', 'dd-mm-yyyy'), 'Y', 102, 357, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (289, to_date('12-08-2020', 'dd-mm-yyyy'), 'Y', 617, 242, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (290, to_date('25-08-2023', 'dd-mm-yyyy'), 'Y', 408, 147, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (291, to_date('08-07-2020', 'dd-mm-yyyy'), 'N', 663, 173, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (292, to_date('23-02-2020', 'dd-mm-yyyy'), 'Y', 488, 117, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (293, to_date('04-10-2023', 'dd-mm-yyyy'), 'Y', 328, 299, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (294, to_date('16-09-2021', 'dd-mm-yyyy'), 'N', 613, 222, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (295, to_date('06-08-2021', 'dd-mm-yyyy'), 'N', 437, 383, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (296, to_date('10-08-2021', 'dd-mm-yyyy'), 'N', 129, 345, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (297, to_date('28-01-2021', 'dd-mm-yyyy'), 'Y', 104, 232, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (298, to_date('15-12-2023', 'dd-mm-yyyy'), 'N', 387, 324, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (299, to_date('15-01-2020', 'dd-mm-yyyy'), 'N', 216, 158, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (300, to_date('17-10-2021', 'dd-mm-yyyy'), 'N', 117, 167, 2);
commit;
prompt 300 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (301, to_date('09-10-2022', 'dd-mm-yyyy'), 'Y', 655, 31, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (302, to_date('15-05-2021', 'dd-mm-yyyy'), 'N', 309, 162, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (303, to_date('21-09-2022', 'dd-mm-yyyy'), 'Y', 496, 390, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (304, to_date('02-09-2022', 'dd-mm-yyyy'), 'N', 571, 134, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (305, to_date('07-09-2022', 'dd-mm-yyyy'), 'Y', 586, 314, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (306, to_date('19-10-2022', 'dd-mm-yyyy'), 'Y', 486, 225, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (307, to_date('18-05-2021', 'dd-mm-yyyy'), 'N', 124, 214, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (308, to_date('19-03-2021', 'dd-mm-yyyy'), 'N', 592, 287, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (309, to_date('26-04-2021', 'dd-mm-yyyy'), 'Y', 382, 130, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (310, to_date('19-12-2020', 'dd-mm-yyyy'), 'Y', 564, 82, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (311, to_date('03-10-2021', 'dd-mm-yyyy'), 'Y', 600, 46, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (312, to_date('21-10-2021', 'dd-mm-yyyy'), 'Y', 316, 54, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (313, to_date('27-05-2021', 'dd-mm-yyyy'), 'Y', 546, 169, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (314, to_date('09-09-2023', 'dd-mm-yyyy'), 'Y', 318, 395, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (315, to_date('21-12-2023', 'dd-mm-yyyy'), 'Y', 569, 360, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (316, to_date('24-04-2023', 'dd-mm-yyyy'), 'Y', 350, 251, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (317, to_date('18-06-2020', 'dd-mm-yyyy'), 'N', 115, 233, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (318, to_date('22-06-2021', 'dd-mm-yyyy'), 'N', 360, 9, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (319, to_date('17-11-2022', 'dd-mm-yyyy'), 'Y', 131, 208, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (320, to_date('28-06-2022', 'dd-mm-yyyy'), 'N', 112, 127, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (321, to_date('17-10-2021', 'dd-mm-yyyy'), 'Y', 441, 282, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (322, to_date('01-09-2023', 'dd-mm-yyyy'), 'Y', 166, 222, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (323, to_date('11-07-2022', 'dd-mm-yyyy'), 'N', 281, 297, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (324, to_date('11-06-2020', 'dd-mm-yyyy'), 'N', 618, 70, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (325, to_date('22-04-2022', 'dd-mm-yyyy'), 'Y', 667, 234, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (326, to_date('18-05-2020', 'dd-mm-yyyy'), 'Y', 379, 56, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (327, to_date('06-07-2023', 'dd-mm-yyyy'), 'N', 529, 344, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (328, to_date('18-10-2023', 'dd-mm-yyyy'), 'N', 146, 286, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (329, to_date('09-09-2020', 'dd-mm-yyyy'), 'N', 116, 356, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (330, to_date('29-04-2020', 'dd-mm-yyyy'), 'N', 401, 131, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (331, to_date('08-04-2023', 'dd-mm-yyyy'), 'N', 419, 35, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (332, to_date('06-04-2021', 'dd-mm-yyyy'), 'N', 470, 58, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (333, to_date('12-04-2022', 'dd-mm-yyyy'), 'N', 502, 55, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (334, to_date('31-10-2023', 'dd-mm-yyyy'), 'N', 565, 305, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (335, to_date('04-03-2022', 'dd-mm-yyyy'), 'Y', 555, 128, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (336, to_date('07-05-2021', 'dd-mm-yyyy'), 'Y', 645, 49, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (337, to_date('18-02-2022', 'dd-mm-yyyy'), 'Y', 578, 317, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (338, to_date('06-02-2023', 'dd-mm-yyyy'), 'N', 311, 97, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (339, to_date('04-06-2021', 'dd-mm-yyyy'), 'N', 376, 171, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (340, to_date('17-10-2021', 'dd-mm-yyyy'), 'N', 687, 193, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (341, to_date('12-09-2020', 'dd-mm-yyyy'), 'N', 633, 114, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (342, to_date('16-01-2023', 'dd-mm-yyyy'), 'Y', 115, 148, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (343, to_date('14-08-2023', 'dd-mm-yyyy'), 'Y', 441, 181, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (344, to_date('12-07-2022', 'dd-mm-yyyy'), 'N', 413, 248, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (345, to_date('20-07-2023', 'dd-mm-yyyy'), 'N', 102, 368, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (346, to_date('06-10-2020', 'dd-mm-yyyy'), 'N', 607, 68, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (347, to_date('24-12-2023', 'dd-mm-yyyy'), 'N', 362, 97, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (348, to_date('07-10-2022', 'dd-mm-yyyy'), 'N', 459, 394, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (349, to_date('31-07-2021', 'dd-mm-yyyy'), 'Y', 583, 329, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (350, to_date('07-12-2022', 'dd-mm-yyyy'), 'N', 481, 35, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (351, to_date('05-03-2021', 'dd-mm-yyyy'), 'Y', 688, 49, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (352, to_date('12-12-2023', 'dd-mm-yyyy'), 'Y', 577, 37, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (353, to_date('03-03-2021', 'dd-mm-yyyy'), 'N', 640, 53, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (354, to_date('25-03-2021', 'dd-mm-yyyy'), 'Y', 683, 78, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (355, to_date('25-08-2021', 'dd-mm-yyyy'), 'Y', 370, 395, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (356, to_date('20-03-2021', 'dd-mm-yyyy'), 'Y', 617, 198, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (357, to_date('04-09-2022', 'dd-mm-yyyy'), 'N', 581, 257, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (358, to_date('12-01-2023', 'dd-mm-yyyy'), 'N', 444, 300, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (359, to_date('23-05-2020', 'dd-mm-yyyy'), 'N', 409, 264, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (360, to_date('21-02-2023', 'dd-mm-yyyy'), 'Y', 332, 164, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (361, to_date('25-09-2022', 'dd-mm-yyyy'), 'N', 245, 383, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (362, to_date('22-07-2023', 'dd-mm-yyyy'), 'Y', 105, 234, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (363, to_date('21-02-2022', 'dd-mm-yyyy'), 'Y', 517, 287, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (364, to_date('22-04-2020', 'dd-mm-yyyy'), 'N', 333, 58, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (365, to_date('20-10-2020', 'dd-mm-yyyy'), 'N', 655, 175, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (366, to_date('15-08-2022', 'dd-mm-yyyy'), 'N', 596, 272, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (367, to_date('19-11-2023', 'dd-mm-yyyy'), 'N', 569, 313, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (368, to_date('19-07-2020', 'dd-mm-yyyy'), 'Y', 576, 196, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (369, to_date('23-05-2023', 'dd-mm-yyyy'), 'N', 268, 92, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (370, to_date('24-03-2022', 'dd-mm-yyyy'), 'N', 243, 107, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (371, to_date('21-08-2020', 'dd-mm-yyyy'), 'N', 310, 26, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (372, to_date('04-06-2021', 'dd-mm-yyyy'), 'Y', 351, 66, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (373, to_date('17-05-2020', 'dd-mm-yyyy'), 'N', 635, 11, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (374, to_date('20-02-2022', 'dd-mm-yyyy'), 'Y', 200, 207, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (375, to_date('14-06-2021', 'dd-mm-yyyy'), 'N', 542, 362, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (376, to_date('16-09-2023', 'dd-mm-yyyy'), 'N', 395, 14, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (377, to_date('23-11-2020', 'dd-mm-yyyy'), 'Y', 477, 262, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (378, to_date('02-09-2023', 'dd-mm-yyyy'), 'N', 262, 373, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (379, to_date('15-07-2023', 'dd-mm-yyyy'), 'Y', 182, 74, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (380, to_date('04-07-2022', 'dd-mm-yyyy'), 'Y', 553, 310, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (381, to_date('22-03-2021', 'dd-mm-yyyy'), 'N', 616, 133, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (382, to_date('30-10-2020', 'dd-mm-yyyy'), 'N', 428, 269, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (383, to_date('19-06-2021', 'dd-mm-yyyy'), 'Y', 149, 125, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (384, to_date('24-09-2021', 'dd-mm-yyyy'), 'Y', 102, 172, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (385, to_date('17-01-2022', 'dd-mm-yyyy'), 'N', 172, 229, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (386, to_date('16-01-2023', 'dd-mm-yyyy'), 'N', 596, 106, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (387, to_date('10-06-2021', 'dd-mm-yyyy'), 'Y', 295, 294, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (388, to_date('19-08-2022', 'dd-mm-yyyy'), 'Y', 674, 201, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (389, to_date('22-08-2021', 'dd-mm-yyyy'), 'N', 120, 279, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (390, to_date('20-08-2022', 'dd-mm-yyyy'), 'N', 146, 266, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (391, to_date('18-06-2023', 'dd-mm-yyyy'), 'Y', 655, 175, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (392, to_date('01-01-2022', 'dd-mm-yyyy'), 'N', 102, 338, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (393, to_date('02-05-2020', 'dd-mm-yyyy'), 'N', 365, 221, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (394, to_date('28-03-2021', 'dd-mm-yyyy'), 'N', 202, 66, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (395, to_date('03-06-2023', 'dd-mm-yyyy'), 'N', 464, 361, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (396, to_date('09-11-2020', 'dd-mm-yyyy'), 'Y', 416, 354, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (397, to_date('10-09-2020', 'dd-mm-yyyy'), 'N', 127, 12, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (398, to_date('06-05-2022', 'dd-mm-yyyy'), 'Y', 410, 97, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (399, to_date('09-01-2020', 'dd-mm-yyyy'), 'Y', 417, 82, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (400, to_date('23-02-2021', 'dd-mm-yyyy'), 'Y', 206, 360, 11);
commit;
prompt 400 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (401, to_date('27-11-2020', 'dd-mm-yyyy'), 'N', 300, 158, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (402, to_date('03-03-2022', 'dd-mm-yyyy'), 'N', 391, 148, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (403, to_date('22-06-2020', 'dd-mm-yyyy'), 'Y', 415, 251, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (404, to_date('21-04-2021', 'dd-mm-yyyy'), 'Y', 322, 138, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (405, to_date('10-10-2023', 'dd-mm-yyyy'), 'Y', 497, 150, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (406, to_date('03-01-2020', 'dd-mm-yyyy'), 'N', 619, 157, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (407, to_date('20-11-2023', 'dd-mm-yyyy'), 'N', 322, 207, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (408, to_date('27-03-2022', 'dd-mm-yyyy'), 'N', 161, 171, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (409, to_date('24-09-2020', 'dd-mm-yyyy'), 'Y', 692, 308, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (410, to_date('17-04-2022', 'dd-mm-yyyy'), 'Y', 463, 358, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (411, to_date('20-04-2022', 'dd-mm-yyyy'), 'Y', 691, 293, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (412, to_date('27-06-2020', 'dd-mm-yyyy'), 'N', 285, 180, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (413, to_date('27-05-2023', 'dd-mm-yyyy'), 'N', 231, 386, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (414, to_date('21-07-2023', 'dd-mm-yyyy'), 'N', 307, 103, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (415, to_date('27-04-2020', 'dd-mm-yyyy'), 'Y', 202, 240, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (416, to_date('03-04-2022', 'dd-mm-yyyy'), 'N', 353, 257, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (417, to_date('09-01-2020', 'dd-mm-yyyy'), 'Y', 131, 152, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (418, to_date('18-05-2020', 'dd-mm-yyyy'), 'N', 318, 211, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (419, to_date('07-04-2023', 'dd-mm-yyyy'), 'Y', 496, 74, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (420, to_date('30-11-2020', 'dd-mm-yyyy'), 'Y', 295, 189, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (421, to_date('14-04-2023', 'dd-mm-yyyy'), 'N', 347, 14, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (422, to_date('19-09-2023', 'dd-mm-yyyy'), 'Y', 645, 218, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (423, to_date('28-09-2020', 'dd-mm-yyyy'), 'Y', 263, 258, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (424, to_date('22-10-2021', 'dd-mm-yyyy'), 'Y', 133, 251, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (425, to_date('04-12-2020', 'dd-mm-yyyy'), 'Y', 311, 281, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (426, to_date('15-07-2023', 'dd-mm-yyyy'), 'N', 564, 314, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (427, to_date('31-08-2021', 'dd-mm-yyyy'), 'Y', 154, 190, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (428, to_date('27-11-2022', 'dd-mm-yyyy'), 'N', 624, 77, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (429, to_date('13-08-2021', 'dd-mm-yyyy'), 'N', 220, 27, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (430, to_date('05-03-2021', 'dd-mm-yyyy'), 'N', 549, 158, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (431, to_date('26-07-2021', 'dd-mm-yyyy'), 'N', 681, 149, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (432, to_date('31-01-2021', 'dd-mm-yyyy'), 'Y', 343, 31, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (433, to_date('14-06-2021', 'dd-mm-yyyy'), 'Y', 694, 120, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (434, to_date('25-06-2021', 'dd-mm-yyyy'), 'N', 336, 395, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (435, to_date('15-03-2020', 'dd-mm-yyyy'), 'Y', 560, 347, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (436, to_date('09-09-2022', 'dd-mm-yyyy'), 'N', 371, 180, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (437, to_date('20-08-2021', 'dd-mm-yyyy'), 'Y', 213, 238, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (438, to_date('13-12-2021', 'dd-mm-yyyy'), 'Y', 425, 19, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (439, to_date('07-05-2020', 'dd-mm-yyyy'), 'Y', 524, 279, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (440, to_date('24-01-2022', 'dd-mm-yyyy'), 'N', 520, 188, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (441, to_date('24-08-2020', 'dd-mm-yyyy'), 'N', 214, 274, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (442, to_date('26-01-2021', 'dd-mm-yyyy'), 'Y', 679, 40, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (443, to_date('29-09-2023', 'dd-mm-yyyy'), 'N', 672, 393, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (444, to_date('27-09-2020', 'dd-mm-yyyy'), 'N', 219, 363, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (445, to_date('08-06-2021', 'dd-mm-yyyy'), 'N', 200, 238, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (446, to_date('17-01-2021', 'dd-mm-yyyy'), 'Y', 643, 66, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (447, to_date('17-02-2021', 'dd-mm-yyyy'), 'N', 477, 178, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (448, to_date('25-12-2020', 'dd-mm-yyyy'), 'Y', 381, 129, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (449, to_date('11-01-2023', 'dd-mm-yyyy'), 'N', 675, 295, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (450, to_date('26-01-2021', 'dd-mm-yyyy'), 'Y', 274, 187, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (451, to_date('18-04-2022', 'dd-mm-yyyy'), 'Y', 194, 86, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (452, to_date('11-05-2020', 'dd-mm-yyyy'), 'Y', 121, 239, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (453, to_date('02-01-2023', 'dd-mm-yyyy'), 'Y', 360, 200, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (454, to_date('14-05-2022', 'dd-mm-yyyy'), 'N', 367, 150, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (455, to_date('27-01-2021', 'dd-mm-yyyy'), 'N', 427, 52, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (456, to_date('15-01-2023', 'dd-mm-yyyy'), 'Y', 299, 22, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (457, to_date('07-04-2022', 'dd-mm-yyyy'), 'Y', 198, 282, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (458, to_date('04-03-2023', 'dd-mm-yyyy'), 'N', 447, 57, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (459, to_date('04-04-2023', 'dd-mm-yyyy'), 'Y', 486, 151, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (460, to_date('04-07-2020', 'dd-mm-yyyy'), 'Y', 360, 270, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (461, to_date('17-07-2020', 'dd-mm-yyyy'), 'Y', 242, 270, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (462, to_date('04-11-2022', 'dd-mm-yyyy'), 'N', 382, 344, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (463, to_date('25-04-2022', 'dd-mm-yyyy'), 'N', 376, 357, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (464, to_date('12-05-2023', 'dd-mm-yyyy'), 'Y', 107, 394, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (465, to_date('07-02-2020', 'dd-mm-yyyy'), 'N', 244, 301, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (466, to_date('12-04-2023', 'dd-mm-yyyy'), 'Y', 154, 161, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (467, to_date('27-11-2020', 'dd-mm-yyyy'), 'N', 691, 82, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (468, to_date('27-11-2022', 'dd-mm-yyyy'), 'N', 210, 369, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (469, to_date('07-01-2020', 'dd-mm-yyyy'), 'Y', 667, 207, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (470, to_date('05-11-2020', 'dd-mm-yyyy'), 'N', 238, 363, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (471, to_date('01-02-2021', 'dd-mm-yyyy'), 'Y', 123, 93, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (472, to_date('18-03-2022', 'dd-mm-yyyy'), 'N', 129, 233, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (473, to_date('18-07-2020', 'dd-mm-yyyy'), 'Y', 348, 26, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (474, to_date('06-01-2023', 'dd-mm-yyyy'), 'N', 274, 251, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (475, to_date('26-02-2023', 'dd-mm-yyyy'), 'Y', 588, 84, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (476, to_date('07-05-2021', 'dd-mm-yyyy'), 'N', 522, 204, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (477, to_date('15-12-2021', 'dd-mm-yyyy'), 'N', 169, 35, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (478, to_date('31-10-2020', 'dd-mm-yyyy'), 'Y', 225, 38, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (479, to_date('03-02-2022', 'dd-mm-yyyy'), 'Y', 138, 65, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (480, to_date('13-06-2022', 'dd-mm-yyyy'), 'N', 292, 93, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (481, to_date('17-04-2023', 'dd-mm-yyyy'), 'N', 416, 232, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (482, to_date('07-07-2021', 'dd-mm-yyyy'), 'Y', 599, 158, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (483, to_date('09-07-2023', 'dd-mm-yyyy'), 'N', 177, 126, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (484, to_date('25-04-2021', 'dd-mm-yyyy'), 'N', 122, 14, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (485, to_date('07-07-2023', 'dd-mm-yyyy'), 'Y', 274, 153, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (486, to_date('30-03-2022', 'dd-mm-yyyy'), 'Y', 558, 183, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (487, to_date('09-02-2022', 'dd-mm-yyyy'), 'Y', 353, 69, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (488, to_date('31-03-2021', 'dd-mm-yyyy'), 'N', 559, 61, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (489, to_date('28-05-2020', 'dd-mm-yyyy'), 'N', 100, 44, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (490, to_date('09-06-2023', 'dd-mm-yyyy'), 'N', 679, 44, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (491, to_date('20-05-2022', 'dd-mm-yyyy'), 'N', 316, 282, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (492, to_date('14-10-2021', 'dd-mm-yyyy'), 'N', 516, 381, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (493, to_date('08-10-2023', 'dd-mm-yyyy'), 'Y', 513, 390, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (494, to_date('22-08-2020', 'dd-mm-yyyy'), 'Y', 193, 84, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (495, to_date('12-11-2022', 'dd-mm-yyyy'), 'N', 419, 123, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (496, to_date('16-01-2020', 'dd-mm-yyyy'), 'Y', 456, 280, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (497, to_date('30-03-2020', 'dd-mm-yyyy'), 'N', 390, 127, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (498, to_date('27-03-2023', 'dd-mm-yyyy'), 'Y', 291, 260, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (499, to_date('23-06-2021', 'dd-mm-yyyy'), 'Y', 134, 295, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (500, to_date('02-05-2023', 'dd-mm-yyyy'), 'Y', 368, 55, 19);
commit;
prompt 500 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (501, to_date('13-04-2020', 'dd-mm-yyyy'), 'Y', 264, 193, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (502, to_date('16-02-2021', 'dd-mm-yyyy'), 'Y', 153, 264, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (503, to_date('27-02-2021', 'dd-mm-yyyy'), 'Y', 528, 135, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (504, to_date('03-10-2020', 'dd-mm-yyyy'), 'Y', 266, 353, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (505, to_date('25-08-2022', 'dd-mm-yyyy'), 'Y', 572, 355, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (506, to_date('08-09-2021', 'dd-mm-yyyy'), 'N', 199, 225, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (507, to_date('17-08-2023', 'dd-mm-yyyy'), 'Y', 207, 342, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (508, to_date('19-06-2022', 'dd-mm-yyyy'), 'Y', 399, 22, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (509, to_date('27-11-2020', 'dd-mm-yyyy'), 'Y', 535, 156, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (510, to_date('26-12-2023', 'dd-mm-yyyy'), 'N', 106, 214, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (511, to_date('19-03-2020', 'dd-mm-yyyy'), 'Y', 656, 9, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (512, to_date('01-04-2020', 'dd-mm-yyyy'), 'N', 438, 147, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (513, to_date('13-05-2021', 'dd-mm-yyyy'), 'N', 390, 244, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (514, to_date('02-09-2022', 'dd-mm-yyyy'), 'N', 538, 158, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (515, to_date('27-09-2021', 'dd-mm-yyyy'), 'Y', 314, 241, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (516, to_date('14-03-2020', 'dd-mm-yyyy'), 'Y', 208, 369, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (517, to_date('31-10-2022', 'dd-mm-yyyy'), 'Y', 322, 216, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (518, to_date('23-07-2022', 'dd-mm-yyyy'), 'Y', 530, 171, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (519, to_date('23-04-2022', 'dd-mm-yyyy'), 'N', 371, 158, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (520, to_date('15-01-2023', 'dd-mm-yyyy'), 'N', 653, 259, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (521, to_date('22-09-2021', 'dd-mm-yyyy'), 'Y', 373, 316, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (522, to_date('05-03-2022', 'dd-mm-yyyy'), 'Y', 191, 241, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (523, to_date('19-01-2021', 'dd-mm-yyyy'), 'N', 345, 276, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (524, to_date('30-11-2020', 'dd-mm-yyyy'), 'Y', 187, 153, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (525, to_date('21-11-2022', 'dd-mm-yyyy'), 'N', 643, 48, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (526, to_date('05-06-2021', 'dd-mm-yyyy'), 'N', 277, 353, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (527, to_date('22-08-2022', 'dd-mm-yyyy'), 'Y', 634, 11, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (528, to_date('02-04-2020', 'dd-mm-yyyy'), 'N', 414, 227, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (529, to_date('01-08-2021', 'dd-mm-yyyy'), 'Y', 508, 132, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (530, to_date('04-08-2021', 'dd-mm-yyyy'), 'Y', 609, 139, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (531, to_date('16-08-2022', 'dd-mm-yyyy'), 'Y', 183, 48, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (532, to_date('02-06-2021', 'dd-mm-yyyy'), 'N', 134, 190, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (533, to_date('11-02-2023', 'dd-mm-yyyy'), 'N', 201, 132, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (534, to_date('18-10-2022', 'dd-mm-yyyy'), 'Y', 431, 147, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (535, to_date('07-06-2020', 'dd-mm-yyyy'), 'N', 492, 230, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (536, to_date('04-11-2022', 'dd-mm-yyyy'), 'N', 290, 66, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (537, to_date('26-06-2023', 'dd-mm-yyyy'), 'N', 625, 134, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (538, to_date('21-03-2021', 'dd-mm-yyyy'), 'N', 186, 39, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (539, to_date('26-01-2020', 'dd-mm-yyyy'), 'Y', 379, 177, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (540, to_date('19-04-2022', 'dd-mm-yyyy'), 'Y', 251, 334, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (541, to_date('20-07-2023', 'dd-mm-yyyy'), 'Y', 178, 150, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (542, to_date('19-02-2021', 'dd-mm-yyyy'), 'Y', 255, 5, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (543, to_date('29-04-2023', 'dd-mm-yyyy'), 'N', 649, 42, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (544, to_date('16-01-2021', 'dd-mm-yyyy'), 'Y', 218, 355, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (545, to_date('06-02-2022', 'dd-mm-yyyy'), 'Y', 666, 115, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (546, to_date('20-01-2022', 'dd-mm-yyyy'), 'Y', 244, 43, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (547, to_date('25-07-2021', 'dd-mm-yyyy'), 'Y', 361, 343, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (548, to_date('29-06-2021', 'dd-mm-yyyy'), 'Y', 221, 116, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (549, to_date('18-04-2022', 'dd-mm-yyyy'), 'N', 564, 132, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (550, to_date('03-02-2022', 'dd-mm-yyyy'), 'N', 355, 95, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (551, to_date('15-12-2020', 'dd-mm-yyyy'), 'Y', 342, 323, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (552, to_date('04-02-2022', 'dd-mm-yyyy'), 'Y', 387, 369, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (553, to_date('30-11-2022', 'dd-mm-yyyy'), 'Y', 153, 318, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (554, to_date('20-10-2023', 'dd-mm-yyyy'), 'N', 227, 231, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (555, to_date('28-01-2021', 'dd-mm-yyyy'), 'N', 351, 283, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (556, to_date('22-02-2022', 'dd-mm-yyyy'), 'N', 664, 281, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (557, to_date('26-10-2022', 'dd-mm-yyyy'), 'Y', 550, 133, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (558, to_date('15-08-2021', 'dd-mm-yyyy'), 'Y', 287, 27, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (559, to_date('14-11-2023', 'dd-mm-yyyy'), 'Y', 181, 157, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (560, to_date('09-03-2022', 'dd-mm-yyyy'), 'Y', 533, 41, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (561, to_date('19-02-2020', 'dd-mm-yyyy'), 'N', 207, 355, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (562, to_date('25-02-2023', 'dd-mm-yyyy'), 'Y', 662, 276, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (563, to_date('11-11-2022', 'dd-mm-yyyy'), 'N', 531, 303, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (564, to_date('04-09-2022', 'dd-mm-yyyy'), 'Y', 487, 64, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (565, to_date('02-07-2020', 'dd-mm-yyyy'), 'Y', 586, 174, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (566, to_date('29-05-2021', 'dd-mm-yyyy'), 'N', 698, 162, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (567, to_date('07-08-2023', 'dd-mm-yyyy'), 'N', 682, 369, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (568, to_date('03-09-2020', 'dd-mm-yyyy'), 'Y', 221, 398, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (569, to_date('24-11-2021', 'dd-mm-yyyy'), 'Y', 499, 357, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (570, to_date('22-04-2020', 'dd-mm-yyyy'), 'Y', 582, 222, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (571, to_date('17-03-2023', 'dd-mm-yyyy'), 'Y', 674, 267, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (572, to_date('15-02-2021', 'dd-mm-yyyy'), 'N', 599, 215, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (573, to_date('13-06-2020', 'dd-mm-yyyy'), 'Y', 447, 395, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (574, to_date('29-06-2020', 'dd-mm-yyyy'), 'Y', 537, 388, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (575, to_date('20-01-2022', 'dd-mm-yyyy'), 'Y', 550, 181, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (576, to_date('20-07-2020', 'dd-mm-yyyy'), 'Y', 443, 66, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (577, to_date('03-09-2022', 'dd-mm-yyyy'), 'N', 650, 338, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (578, to_date('03-10-2021', 'dd-mm-yyyy'), 'Y', 461, 323, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (579, to_date('04-06-2021', 'dd-mm-yyyy'), 'Y', 560, 200, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (580, to_date('24-09-2021', 'dd-mm-yyyy'), 'Y', 535, 61, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (581, to_date('22-07-2022', 'dd-mm-yyyy'), 'N', 279, 249, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (582, to_date('09-03-2023', 'dd-mm-yyyy'), 'Y', 261, 79, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (583, to_date('19-02-2022', 'dd-mm-yyyy'), 'N', 152, 334, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (584, to_date('22-02-2023', 'dd-mm-yyyy'), 'N', 327, 40, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (585, to_date('19-12-2022', 'dd-mm-yyyy'), 'Y', 324, 200, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (586, to_date('16-04-2023', 'dd-mm-yyyy'), 'Y', 571, 39, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (587, to_date('01-02-2020', 'dd-mm-yyyy'), 'N', 292, 77, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (588, to_date('12-10-2023', 'dd-mm-yyyy'), 'N', 278, 37, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (589, to_date('14-10-2021', 'dd-mm-yyyy'), 'Y', 350, 302, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (590, to_date('17-03-2023', 'dd-mm-yyyy'), 'Y', 600, 347, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (591, to_date('04-08-2023', 'dd-mm-yyyy'), 'N', 128, 231, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (592, to_date('31-01-2021', 'dd-mm-yyyy'), 'Y', 501, 28, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (593, to_date('23-03-2020', 'dd-mm-yyyy'), 'Y', 497, 342, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (594, to_date('12-04-2021', 'dd-mm-yyyy'), 'N', 619, 182, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (595, to_date('11-07-2022', 'dd-mm-yyyy'), 'N', 186, 235, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (596, to_date('03-09-2020', 'dd-mm-yyyy'), 'Y', 638, 166, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (597, to_date('01-10-2023', 'dd-mm-yyyy'), 'Y', 452, 268, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (598, to_date('01-02-2020', 'dd-mm-yyyy'), 'N', 157, 192, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (599, to_date('22-02-2020', 'dd-mm-yyyy'), 'Y', 481, 296, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (600, to_date('07-07-2021', 'dd-mm-yyyy'), 'Y', 152, 220, 12);
commit;
prompt 600 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (601, to_date('16-01-2023', 'dd-mm-yyyy'), 'Y', 535, 121, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (602, to_date('15-03-2020', 'dd-mm-yyyy'), 'N', 554, 97, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (603, to_date('29-07-2023', 'dd-mm-yyyy'), 'Y', 542, 150, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (604, to_date('14-04-2021', 'dd-mm-yyyy'), 'N', 461, 135, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (605, to_date('30-06-2023', 'dd-mm-yyyy'), 'N', 502, 64, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (606, to_date('26-10-2023', 'dd-mm-yyyy'), 'Y', 216, 242, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (607, to_date('09-11-2021', 'dd-mm-yyyy'), 'N', 241, 368, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (608, to_date('21-07-2023', 'dd-mm-yyyy'), 'Y', 688, 332, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (609, to_date('26-07-2020', 'dd-mm-yyyy'), 'N', 674, 113, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (610, to_date('01-06-2020', 'dd-mm-yyyy'), 'Y', 224, 101, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (611, to_date('21-07-2021', 'dd-mm-yyyy'), 'Y', 157, 232, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (612, to_date('10-07-2021', 'dd-mm-yyyy'), 'N', 269, 209, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (613, to_date('28-07-2023', 'dd-mm-yyyy'), 'Y', 369, 324, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (614, to_date('29-09-2023', 'dd-mm-yyyy'), 'Y', 637, 372, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (615, to_date('01-10-2022', 'dd-mm-yyyy'), 'Y', 322, 115, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (616, to_date('27-12-2021', 'dd-mm-yyyy'), 'N', 113, 14, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (617, to_date('13-03-2023', 'dd-mm-yyyy'), 'Y', 566, 210, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (618, to_date('04-03-2022', 'dd-mm-yyyy'), 'N', 662, 142, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (619, to_date('09-07-2023', 'dd-mm-yyyy'), 'Y', 620, 3, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (620, to_date('10-03-2022', 'dd-mm-yyyy'), 'Y', 557, 93, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (621, to_date('30-04-2023', 'dd-mm-yyyy'), 'Y', 562, 243, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (622, to_date('22-09-2021', 'dd-mm-yyyy'), 'N', 561, 49, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (623, to_date('30-08-2021', 'dd-mm-yyyy'), 'N', 229, 274, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (624, to_date('09-04-2021', 'dd-mm-yyyy'), 'N', 502, 158, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (625, to_date('01-07-2022', 'dd-mm-yyyy'), 'N', 121, 343, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (626, to_date('25-11-2021', 'dd-mm-yyyy'), 'N', 356, 395, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (627, to_date('04-10-2023', 'dd-mm-yyyy'), 'N', 123, 98, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (628, to_date('17-01-2021', 'dd-mm-yyyy'), 'N', 209, 258, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (629, to_date('22-06-2023', 'dd-mm-yyyy'), 'N', 219, 176, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (630, to_date('08-07-2021', 'dd-mm-yyyy'), 'Y', 333, 247, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (631, to_date('19-05-2020', 'dd-mm-yyyy'), 'Y', 670, 313, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (632, to_date('13-09-2023', 'dd-mm-yyyy'), 'Y', 270, 307, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (633, to_date('22-05-2022', 'dd-mm-yyyy'), 'N', 633, 230, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (634, to_date('22-09-2020', 'dd-mm-yyyy'), 'N', 445, 251, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (635, to_date('07-07-2023', 'dd-mm-yyyy'), 'Y', 517, 212, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (636, to_date('05-03-2023', 'dd-mm-yyyy'), 'Y', 342, 344, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (637, to_date('15-11-2021', 'dd-mm-yyyy'), 'Y', 451, 362, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (638, to_date('07-06-2022', 'dd-mm-yyyy'), 'Y', 206, 390, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (639, to_date('29-12-2022', 'dd-mm-yyyy'), 'Y', 551, 127, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (640, to_date('22-11-2023', 'dd-mm-yyyy'), 'Y', 165, 251, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (641, to_date('30-07-2021', 'dd-mm-yyyy'), 'N', 407, 143, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (642, to_date('31-03-2021', 'dd-mm-yyyy'), 'N', 544, 356, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (643, to_date('01-01-2020', 'dd-mm-yyyy'), 'Y', 378, 319, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (644, to_date('12-07-2021', 'dd-mm-yyyy'), 'N', 265, 111, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (645, to_date('11-08-2020', 'dd-mm-yyyy'), 'Y', 357, 318, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (646, to_date('26-03-2021', 'dd-mm-yyyy'), 'Y', 514, 144, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (647, to_date('07-07-2020', 'dd-mm-yyyy'), 'Y', 244, 146, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (648, to_date('27-06-2021', 'dd-mm-yyyy'), 'N', 412, 93, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (649, to_date('25-03-2023', 'dd-mm-yyyy'), 'N', 500, 307, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (650, to_date('21-07-2020', 'dd-mm-yyyy'), 'N', 280, 210, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (651, to_date('19-08-2020', 'dd-mm-yyyy'), 'N', 190, 305, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (652, to_date('20-10-2023', 'dd-mm-yyyy'), 'N', 267, 75, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (653, to_date('17-04-2020', 'dd-mm-yyyy'), 'N', 629, 39, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (654, to_date('14-04-2022', 'dd-mm-yyyy'), 'N', 568, 243, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (655, to_date('02-10-2020', 'dd-mm-yyyy'), 'N', 609, 279, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (656, to_date('13-02-2020', 'dd-mm-yyyy'), 'Y', 429, 75, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (657, to_date('25-11-2023', 'dd-mm-yyyy'), 'N', 329, 118, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (658, to_date('05-07-2023', 'dd-mm-yyyy'), 'N', 659, 84, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (659, to_date('07-07-2022', 'dd-mm-yyyy'), 'Y', 633, 3, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (660, to_date('29-06-2021', 'dd-mm-yyyy'), 'N', 618, 304, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (661, to_date('08-08-2021', 'dd-mm-yyyy'), 'N', 303, 261, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (662, to_date('12-12-2023', 'dd-mm-yyyy'), 'N', 497, 70, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (663, to_date('07-06-2023', 'dd-mm-yyyy'), 'N', 148, 74, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (664, to_date('14-08-2020', 'dd-mm-yyyy'), 'Y', 252, 111, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (665, to_date('19-09-2021', 'dd-mm-yyyy'), 'Y', 142, 394, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (666, to_date('04-04-2020', 'dd-mm-yyyy'), 'Y', 233, 75, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (667, to_date('11-03-2021', 'dd-mm-yyyy'), 'N', 209, 98, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (668, to_date('03-04-2021', 'dd-mm-yyyy'), 'N', 570, 65, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (669, to_date('04-02-2022', 'dd-mm-yyyy'), 'Y', 266, 55, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (670, to_date('24-03-2021', 'dd-mm-yyyy'), 'N', 686, 385, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (671, to_date('14-07-2020', 'dd-mm-yyyy'), 'Y', 259, 129, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (672, to_date('24-06-2020', 'dd-mm-yyyy'), 'Y', 634, 224, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (673, to_date('25-10-2023', 'dd-mm-yyyy'), 'N', 445, 241, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (674, to_date('07-01-2020', 'dd-mm-yyyy'), 'N', 148, 257, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (675, to_date('20-08-2020', 'dd-mm-yyyy'), 'Y', 270, 199, 11);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (676, to_date('23-06-2022', 'dd-mm-yyyy'), 'N', 382, 124, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (677, to_date('07-04-2020', 'dd-mm-yyyy'), 'N', 469, 400, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (678, to_date('05-09-2020', 'dd-mm-yyyy'), 'N', 357, 309, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (679, to_date('15-12-2021', 'dd-mm-yyyy'), 'Y', 538, 262, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (680, to_date('25-07-2023', 'dd-mm-yyyy'), 'Y', 556, 371, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (681, to_date('01-01-2021', 'dd-mm-yyyy'), 'Y', 100, 152, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (682, to_date('04-02-2021', 'dd-mm-yyyy'), 'Y', 253, 371, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (683, to_date('28-06-2020', 'dd-mm-yyyy'), 'N', 418, 173, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (684, to_date('09-02-2021', 'dd-mm-yyyy'), 'Y', 214, 216, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (685, to_date('07-11-2022', 'dd-mm-yyyy'), 'Y', 395, 202, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (686, to_date('22-07-2023', 'dd-mm-yyyy'), 'Y', 284, 328, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (687, to_date('06-05-2022', 'dd-mm-yyyy'), 'N', 202, 198, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (688, to_date('25-01-2020', 'dd-mm-yyyy'), 'Y', 596, 336, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (689, to_date('13-09-2021', 'dd-mm-yyyy'), 'Y', 344, 130, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (690, to_date('24-02-2021', 'dd-mm-yyyy'), 'N', 505, 265, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (691, to_date('26-07-2020', 'dd-mm-yyyy'), 'N', 109, 317, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (692, to_date('08-10-2023', 'dd-mm-yyyy'), 'Y', 507, 379, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (693, to_date('20-05-2023', 'dd-mm-yyyy'), 'Y', 143, 295, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (694, to_date('08-03-2021', 'dd-mm-yyyy'), 'Y', 421, 350, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (695, to_date('23-03-2021', 'dd-mm-yyyy'), 'N', 321, 206, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (696, to_date('22-09-2020', 'dd-mm-yyyy'), 'N', 430, 164, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (697, to_date('14-02-2021', 'dd-mm-yyyy'), 'Y', 433, 23, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (698, to_date('27-09-2023', 'dd-mm-yyyy'), 'Y', 118, 222, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (699, to_date('29-07-2022', 'dd-mm-yyyy'), 'N', 474, 318, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (700, to_date('22-01-2020', 'dd-mm-yyyy'), 'N', 281, 328, 16);
commit;
prompt 700 records committed...
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (701, to_date('25-12-2023', 'dd-mm-yyyy'), 'N', 281, 364, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (702, to_date('27-08-2022', 'dd-mm-yyyy'), 'Y', 209, 110, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (703, to_date('14-05-2020', 'dd-mm-yyyy'), 'Y', 285, 202, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (704, to_date('14-04-2021', 'dd-mm-yyyy'), 'N', 347, 329, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (705, to_date('12-09-2021', 'dd-mm-yyyy'), 'N', 398, 122, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (706, to_date('23-01-2021', 'dd-mm-yyyy'), 'Y', 402, 26, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (707, to_date('16-02-2021', 'dd-mm-yyyy'), 'N', 262, 257, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (708, to_date('27-02-2021', 'dd-mm-yyyy'), 'N', 476, 180, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (709, to_date('07-06-2020', 'dd-mm-yyyy'), 'Y', 512, 143, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (710, to_date('05-09-2022', 'dd-mm-yyyy'), 'Y', 675, 309, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (711, to_date('31-05-2022', 'dd-mm-yyyy'), 'N', 378, 49, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (712, to_date('15-03-2021', 'dd-mm-yyyy'), 'N', 133, 14, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (713, to_date('06-10-2020', 'dd-mm-yyyy'), 'Y', 683, 316, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (714, to_date('06-01-2021', 'dd-mm-yyyy'), 'N', 503, 375, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (715, to_date('22-12-2023', 'dd-mm-yyyy'), 'N', 318, 34, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (716, to_date('03-09-2020', 'dd-mm-yyyy'), 'N', 521, 77, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (717, to_date('23-06-2022', 'dd-mm-yyyy'), 'N', 207, 12, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (718, to_date('07-10-2021', 'dd-mm-yyyy'), 'N', 129, 55, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (719, to_date('21-09-2022', 'dd-mm-yyyy'), 'Y', 102, 333, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (720, to_date('12-08-2020', 'dd-mm-yyyy'), 'N', 428, 343, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (721, to_date('23-06-2021', 'dd-mm-yyyy'), 'Y', 511, 349, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (722, to_date('12-06-2022', 'dd-mm-yyyy'), 'Y', 163, 159, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (723, to_date('30-06-2021', 'dd-mm-yyyy'), 'Y', 121, 44, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (724, to_date('12-09-2021', 'dd-mm-yyyy'), 'N', 611, 88, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (725, to_date('12-05-2021', 'dd-mm-yyyy'), 'Y', 159, 255, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (726, to_date('09-08-2022', 'dd-mm-yyyy'), 'Y', 304, 279, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (727, to_date('05-07-2022', 'dd-mm-yyyy'), 'N', 547, 264, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (728, to_date('16-07-2023', 'dd-mm-yyyy'), 'N', 104, 74, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (729, to_date('03-01-2023', 'dd-mm-yyyy'), 'N', 246, 251, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (730, to_date('04-09-2022', 'dd-mm-yyyy'), 'N', 636, 146, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (731, to_date('14-06-2021', 'dd-mm-yyyy'), 'Y', 149, 221, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (732, to_date('01-03-2022', 'dd-mm-yyyy'), 'Y', 629, 307, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (733, to_date('30-08-2020', 'dd-mm-yyyy'), 'Y', 394, 72, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (734, to_date('22-09-2022', 'dd-mm-yyyy'), 'N', 163, 182, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (735, to_date('12-03-2023', 'dd-mm-yyyy'), 'Y', 382, 129, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (736, to_date('06-05-2023', 'dd-mm-yyyy'), 'Y', 321, 325, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (737, to_date('18-12-2021', 'dd-mm-yyyy'), 'N', 193, 211, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (738, to_date('12-04-2021', 'dd-mm-yyyy'), 'N', 228, 124, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (739, to_date('19-12-2020', 'dd-mm-yyyy'), 'Y', 682, 345, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (740, to_date('06-06-2022', 'dd-mm-yyyy'), 'Y', 594, 190, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (741, to_date('27-04-2022', 'dd-mm-yyyy'), 'Y', 675, 129, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (742, to_date('20-05-2023', 'dd-mm-yyyy'), 'Y', 119, 115, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (743, to_date('14-01-2022', 'dd-mm-yyyy'), 'N', 463, 67, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (744, to_date('16-06-2022', 'dd-mm-yyyy'), 'N', 228, 85, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (745, to_date('28-01-2021', 'dd-mm-yyyy'), 'N', 338, 272, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (746, to_date('10-02-2020', 'dd-mm-yyyy'), 'Y', 143, 1, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (747, to_date('08-10-2023', 'dd-mm-yyyy'), 'N', 172, 395, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (748, to_date('10-02-2023', 'dd-mm-yyyy'), 'N', 671, 331, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (749, to_date('14-12-2023', 'dd-mm-yyyy'), 'Y', 105, 393, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (750, to_date('18-09-2022', 'dd-mm-yyyy'), 'N', 375, 320, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (751, to_date('30-12-2020', 'dd-mm-yyyy'), 'N', 107, 149, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (752, to_date('30-04-2022', 'dd-mm-yyyy'), 'N', 445, 102, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (753, to_date('12-02-2021', 'dd-mm-yyyy'), 'Y', 325, 253, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (754, to_date('28-07-2023', 'dd-mm-yyyy'), 'Y', 675, 30, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (755, to_date('11-09-2022', 'dd-mm-yyyy'), 'Y', 348, 76, 16);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (756, to_date('01-03-2021', 'dd-mm-yyyy'), 'Y', 289, 286, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (757, to_date('31-05-2023', 'dd-mm-yyyy'), 'N', 298, 326, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (758, to_date('21-02-2021', 'dd-mm-yyyy'), 'N', 166, 103, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (759, to_date('02-11-2020', 'dd-mm-yyyy'), 'N', 496, 381, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (760, to_date('20-08-2023', 'dd-mm-yyyy'), 'N', 330, 153, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (761, to_date('03-02-2020', 'dd-mm-yyyy'), 'Y', 262, 297, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (762, to_date('19-02-2023', 'dd-mm-yyyy'), 'N', 258, 149, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (763, to_date('02-06-2023', 'dd-mm-yyyy'), 'Y', 202, 22, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (764, to_date('23-03-2020', 'dd-mm-yyyy'), 'N', 301, 184, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (765, to_date('02-08-2022', 'dd-mm-yyyy'), 'N', 380, 6, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (766, to_date('06-01-2023', 'dd-mm-yyyy'), 'N', 307, 344, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (767, to_date('09-07-2020', 'dd-mm-yyyy'), 'N', 406, 46, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (768, to_date('29-09-2020', 'dd-mm-yyyy'), 'Y', 167, 47, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (769, to_date('29-08-2023', 'dd-mm-yyyy'), 'Y', 552, 32, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (770, to_date('14-02-2022', 'dd-mm-yyyy'), 'Y', 554, 17, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (771, to_date('14-06-2021', 'dd-mm-yyyy'), 'Y', 258, 165, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (772, to_date('16-03-2023', 'dd-mm-yyyy'), 'Y', 226, 43, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (773, to_date('14-06-2022', 'dd-mm-yyyy'), 'N', 330, 344, 6);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (774, to_date('03-07-2022', 'dd-mm-yyyy'), 'N', 444, 233, 4);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (775, to_date('18-10-2021', 'dd-mm-yyyy'), 'Y', 121, 221, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (776, to_date('07-06-2022', 'dd-mm-yyyy'), 'N', 534, 320, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (777, to_date('25-10-2022', 'dd-mm-yyyy'), 'N', 688, 103, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (778, to_date('20-09-2020', 'dd-mm-yyyy'), 'N', 563, 275, 8);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (779, to_date('20-05-2020', 'dd-mm-yyyy'), 'N', 527, 181, 20);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (780, to_date('07-02-2023', 'dd-mm-yyyy'), 'N', 664, 52, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (781, to_date('20-05-2021', 'dd-mm-yyyy'), 'N', 340, 248, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (782, to_date('03-10-2021', 'dd-mm-yyyy'), 'N', 568, 318, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (783, to_date('31-01-2023', 'dd-mm-yyyy'), 'Y', 356, 265, 9);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (784, to_date('01-11-2022', 'dd-mm-yyyy'), 'Y', 599, 89, 2);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (785, to_date('29-10-2022', 'dd-mm-yyyy'), 'Y', 337, 20, 18);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (786, to_date('06-04-2021', 'dd-mm-yyyy'), 'N', 202, 393, 7);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (787, to_date('16-05-2023', 'dd-mm-yyyy'), 'N', 668, 343, 5);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (788, to_date('11-02-2020', 'dd-mm-yyyy'), 'N', 112, 88, 13);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (789, to_date('15-09-2020', 'dd-mm-yyyy'), 'N', 341, 93, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (790, to_date('18-04-2021', 'dd-mm-yyyy'), 'N', 530, 187, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (791, to_date('04-08-2022', 'dd-mm-yyyy'), 'Y', 266, 32, 15);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (792, to_date('29-08-2022', 'dd-mm-yyyy'), 'N', 545, 159, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (793, to_date('28-05-2023', 'dd-mm-yyyy'), 'Y', 616, 296, 3);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (794, to_date('30-09-2021', 'dd-mm-yyyy'), 'N', 294, 160, 19);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (795, to_date('19-11-2021', 'dd-mm-yyyy'), 'Y', 689, 103, 14);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (796, to_date('15-12-2020', 'dd-mm-yyyy'), 'N', 318, 310, 1);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (797, to_date('03-07-2021', 'dd-mm-yyyy'), 'N', 620, 179, 12);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (798, to_date('31-08-2022', 'dd-mm-yyyy'), 'N', 265, 275, 10);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (799, to_date('04-09-2022', 'dd-mm-yyyy'), 'N', 224, 60, 17);
insert into DONATION (donationid, donationdate, valid, donorid, stationid, bankid)
values (800, to_date('26-08-2020', 'dd-mm-yyyy'), 'Y', 170, 234, 11);
commit;
prompt 800 records loaded
prompt Loading ORDER_...
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
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (533, 'y', to_date('05-06-2021', 'dd-mm-yyyy'), 5, 6, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (534, 'n', to_date('25-05-2021', 'dd-mm-yyyy'), 8, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (535, 'y', to_date('10-12-2023', 'dd-mm-yyyy'), 5, 5, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (536, 'n', to_date('31-08-2022', 'dd-mm-yyyy'), 15, 4, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (537, 'y', to_date('23-02-2021', 'dd-mm-yyyy'), 7, 8, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (538, 'y', to_date('30-01-2021', 'dd-mm-yyyy'), 18, 8, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (539, 'y', to_date('26-02-2023', 'dd-mm-yyyy'), 24, 2, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (540, 'n', to_date('02-04-2022', 'dd-mm-yyyy'), 13, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (541, 'y', to_date('16-06-2022', 'dd-mm-yyyy'), 26, 6, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (542, 'y', to_date('04-04-2021', 'dd-mm-yyyy'), 23, 2, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (543, 'y', to_date('06-12-2022', 'dd-mm-yyyy'), 25, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (544, 'n', to_date('21-07-2022', 'dd-mm-yyyy'), 16, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (545, 'y', to_date('23-12-2022', 'dd-mm-yyyy'), 24, 2, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (546, 'y', to_date('06-01-2023', 'dd-mm-yyyy'), 30, 2, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (547, 'n', to_date('13-05-2020', 'dd-mm-yyyy'), 20, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (548, 'n', to_date('03-11-2020', 'dd-mm-yyyy'), 27, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (549, 'y', to_date('05-05-2020', 'dd-mm-yyyy'), 2, 4, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (550, 'y', to_date('24-10-2021', 'dd-mm-yyyy'), 6, 1, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (551, 'y', to_date('17-10-2022', 'dd-mm-yyyy'), 19, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (552, 'n', to_date('13-10-2023', 'dd-mm-yyyy'), 15, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (553, 'n', to_date('23-05-2023', 'dd-mm-yyyy'), 20, 7, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (554, 'n', to_date('28-01-2023', 'dd-mm-yyyy'), 6, 1, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (555, 'n', to_date('04-10-2021', 'dd-mm-yyyy'), 3, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (556, 'y', to_date('14-11-2022', 'dd-mm-yyyy'), 14, 1, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (557, 'y', to_date('06-03-2022', 'dd-mm-yyyy'), 26, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (558, 'n', to_date('08-04-2021', 'dd-mm-yyyy'), 6, 4, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (559, 'y', to_date('13-03-2023', 'dd-mm-yyyy'), 9, 4, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (560, 'y', to_date('15-11-2022', 'dd-mm-yyyy'), 1, 3, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (561, 'y', to_date('30-12-2021', 'dd-mm-yyyy'), 18, 6, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (562, 'n', to_date('25-09-2021', 'dd-mm-yyyy'), 12, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (563, 'n', to_date('29-03-2021', 'dd-mm-yyyy'), 13, 4, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (564, 'n', to_date('18-03-2023', 'dd-mm-yyyy'), 22, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (565, 'y', to_date('19-09-2023', 'dd-mm-yyyy'), 1, 8, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (566, 'y', to_date('12-05-2020', 'dd-mm-yyyy'), 9, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (567, 'n', to_date('06-05-2020', 'dd-mm-yyyy'), 12, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (568, 'n', to_date('16-12-2021', 'dd-mm-yyyy'), 8, 6, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (569, 'y', to_date('11-10-2020', 'dd-mm-yyyy'), 18, 4, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (570, 'y', to_date('08-04-2022', 'dd-mm-yyyy'), 30, 4, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (571, 'y', to_date('05-08-2020', 'dd-mm-yyyy'), 14, 6, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (572, 'y', to_date('14-04-2021', 'dd-mm-yyyy'), 9, 3, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (573, 'n', to_date('22-09-2021', 'dd-mm-yyyy'), 24, 2, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (574, 'y', to_date('03-09-2023', 'dd-mm-yyyy'), 15, 2, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (575, 'n', to_date('14-06-2021', 'dd-mm-yyyy'), 2, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (576, 'y', to_date('12-06-2021', 'dd-mm-yyyy'), 25, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (577, 'n', to_date('16-09-2023', 'dd-mm-yyyy'), 13, 1, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (578, 'n', to_date('27-08-2021', 'dd-mm-yyyy'), 29, 3, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (579, 'y', to_date('15-12-2022', 'dd-mm-yyyy'), 7, 2, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (580, 'n', to_date('19-09-2020', 'dd-mm-yyyy'), 10, 7, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (581, 'y', to_date('15-01-2021', 'dd-mm-yyyy'), 10, 2, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (582, 'n', to_date('23-11-2021', 'dd-mm-yyyy'), 6, 3, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (583, 'n', to_date('01-10-2022', 'dd-mm-yyyy'), 2, 1, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (584, 'n', to_date('27-02-2021', 'dd-mm-yyyy'), 9, 7, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (585, 'y', to_date('06-10-2023', 'dd-mm-yyyy'), 29, 1, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (586, 'y', to_date('05-10-2022', 'dd-mm-yyyy'), 24, 4, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (587, 'y', to_date('14-11-2022', 'dd-mm-yyyy'), 22, 6, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (588, 'y', to_date('17-10-2022', 'dd-mm-yyyy'), 17, 6, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (589, 'y', to_date('18-09-2021', 'dd-mm-yyyy'), 15, 5, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (590, 'y', to_date('20-02-2021', 'dd-mm-yyyy'), 4, 5, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (591, 'y', to_date('29-09-2020', 'dd-mm-yyyy'), 30, 3, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (592, 'n', to_date('10-08-2022', 'dd-mm-yyyy'), 14, 8, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (593, 'y', to_date('05-05-2021', 'dd-mm-yyyy'), 9, 2, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (594, 'n', to_date('08-11-2023', 'dd-mm-yyyy'), 26, 3, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (595, 'y', to_date('01-04-2022', 'dd-mm-yyyy'), 16, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (596, 'n', to_date('22-01-2021', 'dd-mm-yyyy'), 2, 3, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (597, 'n', to_date('08-11-2022', 'dd-mm-yyyy'), 26, 3, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (598, 'n', to_date('28-10-2023', 'dd-mm-yyyy'), 10, 7, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (599, 'y', to_date('14-09-2023', 'dd-mm-yyyy'), 5, 8, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (600, 'y', to_date('07-06-2021', 'dd-mm-yyyy'), 24, 4, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (264, 'n', to_date('12-01-2022', 'dd-mm-yyyy'), 2, 1, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (265, 'y', to_date('13-04-2022', 'dd-mm-yyyy'), 11, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (266, 'n', to_date('16-05-2020', 'dd-mm-yyyy'), 29, 4, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (267, 'y', to_date('05-08-2023', 'dd-mm-yyyy'), 13, 3, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (268, 'n', to_date('19-05-2021', 'dd-mm-yyyy'), 11, 6, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (269, 'n', to_date('22-01-2021', 'dd-mm-yyyy'), 3, 3, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (270, 'y', to_date('26-11-2023', 'dd-mm-yyyy'), 18, 8, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (271, 'y', to_date('07-02-2021', 'dd-mm-yyyy'), 10, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (272, 'n', to_date('03-03-2022', 'dd-mm-yyyy'), 20, 2, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (273, 'n', to_date('06-01-2022', 'dd-mm-yyyy'), 25, 8, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (274, 'y', to_date('22-09-2022', 'dd-mm-yyyy'), 24, 5, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (275, 'y', to_date('08-09-2020', 'dd-mm-yyyy'), 28, 3, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (276, 'y', to_date('27-02-2022', 'dd-mm-yyyy'), 24, 1, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (277, 'y', to_date('16-02-2023', 'dd-mm-yyyy'), 7, 8, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (278, 'y', to_date('13-02-2022', 'dd-mm-yyyy'), 21, 1, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (279, 'n', to_date('18-05-2022', 'dd-mm-yyyy'), 23, 8, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (280, 'n', to_date('15-12-2020', 'dd-mm-yyyy'), 20, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (281, 'y', to_date('30-12-2022', 'dd-mm-yyyy'), 21, 5, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (282, 'n', to_date('27-11-2022', 'dd-mm-yyyy'), 27, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (283, 'y', to_date('28-09-2023', 'dd-mm-yyyy'), 28, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (284, 'y', to_date('11-12-2023', 'dd-mm-yyyy'), 26, 4, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (285, 'n', to_date('27-07-2021', 'dd-mm-yyyy'), 17, 8, 9);
commit;
prompt 100 records committed...
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (286, 'y', to_date('27-04-2021', 'dd-mm-yyyy'), 9, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (287, 'y', to_date('22-03-2022', 'dd-mm-yyyy'), 27, 1, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (288, 'y', to_date('14-07-2020', 'dd-mm-yyyy'), 22, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (289, 'n', to_date('22-10-2021', 'dd-mm-yyyy'), 15, 4, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (290, 'y', to_date('08-07-2022', 'dd-mm-yyyy'), 12, 3, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (291, 'n', to_date('19-11-2020', 'dd-mm-yyyy'), 28, 2, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (292, 'y', to_date('07-11-2023', 'dd-mm-yyyy'), 19, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (293, 'y', to_date('08-01-2021', 'dd-mm-yyyy'), 26, 2, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (294, 'n', to_date('27-02-2023', 'dd-mm-yyyy'), 16, 8, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (295, 'y', to_date('23-04-2021', 'dd-mm-yyyy'), 8, 7, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (296, 'n', to_date('01-05-2021', 'dd-mm-yyyy'), 4, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (297, 'y', to_date('01-11-2021', 'dd-mm-yyyy'), 30, 8, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (298, 'n', to_date('17-03-2022', 'dd-mm-yyyy'), 14, 2, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (299, 'y', to_date('25-02-2021', 'dd-mm-yyyy'), 10, 1, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (300, 'y', to_date('30-07-2020', 'dd-mm-yyyy'), 1, 3, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (301, 'n', to_date('27-12-2023', 'dd-mm-yyyy'), 30, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (302, 'n', to_date('15-11-2020', 'dd-mm-yyyy'), 9, 6, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (303, 'n', to_date('11-12-2023', 'dd-mm-yyyy'), 27, 2, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (304, 'y', to_date('11-06-2023', 'dd-mm-yyyy'), 10, 6, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (305, 'y', to_date('03-06-2021', 'dd-mm-yyyy'), 6, 8, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (306, 'n', to_date('08-04-2021', 'dd-mm-yyyy'), 19, 4, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (307, 'y', to_date('29-10-2021', 'dd-mm-yyyy'), 5, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (308, 'y', to_date('11-10-2022', 'dd-mm-yyyy'), 13, 3, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (309, 'n', to_date('09-10-2022', 'dd-mm-yyyy'), 1, 7, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (310, 'n', to_date('22-04-2023', 'dd-mm-yyyy'), 4, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (311, 'n', to_date('10-12-2022', 'dd-mm-yyyy'), 23, 6, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (312, 'n', to_date('19-10-2021', 'dd-mm-yyyy'), 22, 5, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (313, 'y', to_date('05-06-2022', 'dd-mm-yyyy'), 29, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (314, 'n', to_date('09-11-2023', 'dd-mm-yyyy'), 14, 2, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (315, 'y', to_date('14-09-2023', 'dd-mm-yyyy'), 23, 4, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (316, 'n', to_date('13-11-2021', 'dd-mm-yyyy'), 18, 1, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (317, 'y', to_date('05-11-2022', 'dd-mm-yyyy'), 1, 2, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (318, 'n', to_date('10-03-2023', 'dd-mm-yyyy'), 28, 4, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (319, 'n', to_date('10-06-2021', 'dd-mm-yyyy'), 14, 6, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (320, 'y', to_date('04-11-2020', 'dd-mm-yyyy'), 12, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (321, 'y', to_date('05-07-2022', 'dd-mm-yyyy'), 15, 4, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (322, 'y', to_date('23-07-2022', 'dd-mm-yyyy'), 2, 6, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (323, 'n', to_date('29-11-2020', 'dd-mm-yyyy'), 30, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (324, 'y', to_date('13-01-2021', 'dd-mm-yyyy'), 30, 2, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (325, 'n', to_date('24-07-2020', 'dd-mm-yyyy'), 19, 6, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (326, 'n', to_date('15-06-2023', 'dd-mm-yyyy'), 22, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (327, 'y', to_date('28-11-2021', 'dd-mm-yyyy'), 5, 7, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (328, 'y', to_date('27-12-2020', 'dd-mm-yyyy'), 23, 4, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (329, 'y', to_date('26-06-2020', 'dd-mm-yyyy'), 19, 2, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (330, 'y', to_date('29-07-2021', 'dd-mm-yyyy'), 19, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (331, 'y', to_date('27-12-2023', 'dd-mm-yyyy'), 17, 3, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (332, 'y', to_date('11-05-2021', 'dd-mm-yyyy'), 4, 2, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (333, 'y', to_date('18-04-2023', 'dd-mm-yyyy'), 20, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (334, 'y', to_date('29-06-2022', 'dd-mm-yyyy'), 23, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (335, 'n', to_date('29-09-2022', 'dd-mm-yyyy'), 5, 3, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (336, 'n', to_date('28-11-2020', 'dd-mm-yyyy'), 20, 5, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (337, 'n', to_date('29-09-2023', 'dd-mm-yyyy'), 27, 8, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (338, 'y', to_date('01-08-2022', 'dd-mm-yyyy'), 8, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (339, 'n', to_date('16-10-2020', 'dd-mm-yyyy'), 28, 6, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (340, 'n', to_date('29-09-2023', 'dd-mm-yyyy'), 3, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (341, 'n', to_date('14-12-2023', 'dd-mm-yyyy'), 6, 5, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (342, 'n', to_date('25-09-2020', 'dd-mm-yyyy'), 11, 6, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (343, 'n', to_date('25-05-2022', 'dd-mm-yyyy'), 10, 4, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (344, 'n', to_date('17-12-2020', 'dd-mm-yyyy'), 2, 3, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (345, 'y', to_date('10-01-2021', 'dd-mm-yyyy'), 16, 8, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (346, 'n', to_date('10-11-2020', 'dd-mm-yyyy'), 20, 3, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (347, 'n', to_date('16-01-2022', 'dd-mm-yyyy'), 7, 8, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (348, 'y', to_date('05-01-2021', 'dd-mm-yyyy'), 22, 6, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (349, 'n', to_date('03-08-2021', 'dd-mm-yyyy'), 26, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (350, 'y', to_date('19-11-2022', 'dd-mm-yyyy'), 28, 1, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (351, 'n', to_date('10-10-2023', 'dd-mm-yyyy'), 5, 5, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (352, 'y', to_date('11-06-2020', 'dd-mm-yyyy'), 11, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (353, 'n', to_date('05-05-2023', 'dd-mm-yyyy'), 6, 3, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (354, 'n', to_date('12-10-2022', 'dd-mm-yyyy'), 29, 8, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (355, 'n', to_date('18-09-2022', 'dd-mm-yyyy'), 20, 7, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (356, 'y', to_date('23-06-2020', 'dd-mm-yyyy'), 13, 8, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (357, 'y', to_date('15-01-2022', 'dd-mm-yyyy'), 14, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (358, 'n', to_date('12-02-2021', 'dd-mm-yyyy'), 5, 5, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (359, 'n', to_date('24-06-2020', 'dd-mm-yyyy'), 2, 4, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (360, 'y', to_date('22-04-2023', 'dd-mm-yyyy'), 29, 2, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (361, 'y', to_date('11-07-2022', 'dd-mm-yyyy'), 14, 5, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (362, 'n', to_date('27-03-2022', 'dd-mm-yyyy'), 16, 3, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (363, 'y', to_date('04-05-2022', 'dd-mm-yyyy'), 7, 3, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (364, 'y', to_date('23-08-2023', 'dd-mm-yyyy'), 16, 3, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (365, 'y', to_date('23-04-2022', 'dd-mm-yyyy'), 27, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (366, 'n', to_date('10-08-2021', 'dd-mm-yyyy'), 4, 7, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (367, 'n', to_date('07-09-2023', 'dd-mm-yyyy'), 28, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (368, 'y', to_date('05-01-2023', 'dd-mm-yyyy'), 29, 7, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (369, 'y', to_date('04-08-2021', 'dd-mm-yyyy'), 5, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (370, 'n', to_date('30-05-2020', 'dd-mm-yyyy'), 3, 7, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (371, 'n', to_date('19-07-2023', 'dd-mm-yyyy'), 23, 5, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (372, 'n', to_date('22-09-2021', 'dd-mm-yyyy'), 4, 5, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (373, 'y', to_date('03-09-2022', 'dd-mm-yyyy'), 19, 6, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (374, 'n', to_date('08-09-2022', 'dd-mm-yyyy'), 16, 1, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (375, 'n', to_date('26-02-2023', 'dd-mm-yyyy'), 2, 2, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (376, 'y', to_date('28-07-2021', 'dd-mm-yyyy'), 24, 1, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (377, 'y', to_date('13-02-2023', 'dd-mm-yyyy'), 19, 1, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (378, 'n', to_date('11-11-2022', 'dd-mm-yyyy'), 17, 3, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (379, 'y', to_date('24-06-2023', 'dd-mm-yyyy'), 4, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (380, 'n', to_date('03-09-2021', 'dd-mm-yyyy'), 17, 1, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (381, 'n', to_date('12-07-2022', 'dd-mm-yyyy'), 27, 8, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (382, 'y', to_date('27-08-2021', 'dd-mm-yyyy'), 28, 6, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (383, 'y', to_date('24-11-2021', 'dd-mm-yyyy'), 12, 4, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (384, 'y', to_date('09-05-2020', 'dd-mm-yyyy'), 26, 4, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (385, 'n', to_date('15-05-2023', 'dd-mm-yyyy'), 21, 6, 8);
commit;
prompt 200 records committed...
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (386, 'y', to_date('13-03-2021', 'dd-mm-yyyy'), 6, 4, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (387, 'y', to_date('18-10-2023', 'dd-mm-yyyy'), 27, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (388, 'y', to_date('21-12-2021', 'dd-mm-yyyy'), 16, 4, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (389, 'n', to_date('13-12-2021', 'dd-mm-yyyy'), 29, 7, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (390, 'n', to_date('26-11-2020', 'dd-mm-yyyy'), 6, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (391, 'n', to_date('10-05-2023', 'dd-mm-yyyy'), 27, 4, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (392, 'n', to_date('23-01-2023', 'dd-mm-yyyy'), 17, 8, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (393, 'n', to_date('17-02-2023', 'dd-mm-yyyy'), 10, 8, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (394, 'n', to_date('24-10-2021', 'dd-mm-yyyy'), 22, 5, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (395, 'n', to_date('20-07-2022', 'dd-mm-yyyy'), 10, 1, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (396, 'n', to_date('07-08-2022', 'dd-mm-yyyy'), 14, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (397, 'n', to_date('31-08-2021', 'dd-mm-yyyy'), 1, 4, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (398, 'y', to_date('12-05-2022', 'dd-mm-yyyy'), 27, 2, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (399, 'n', to_date('16-06-2022', 'dd-mm-yyyy'), 21, 8, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (400, 'n', to_date('06-07-2021', 'dd-mm-yyyy'), 28, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (401, 'n', to_date('25-04-2022', 'dd-mm-yyyy'), 13, 3, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (402, 'n', to_date('19-07-2022', 'dd-mm-yyyy'), 16, 3, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (403, 'n', to_date('20-12-2020', 'dd-mm-yyyy'), 18, 5, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (404, 'y', to_date('24-06-2021', 'dd-mm-yyyy'), 26, 6, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (405, 'n', to_date('01-06-2021', 'dd-mm-yyyy'), 2, 8, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (406, 'n', to_date('23-03-2021', 'dd-mm-yyyy'), 20, 5, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (407, 'n', to_date('21-08-2022', 'dd-mm-yyyy'), 26, 3, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (408, 'n', to_date('30-11-2022', 'dd-mm-yyyy'), 24, 6, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (409, 'y', to_date('30-11-2023', 'dd-mm-yyyy'), 5, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (410, 'y', to_date('03-09-2021', 'dd-mm-yyyy'), 25, 1, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (411, 'n', to_date('24-02-2023', 'dd-mm-yyyy'), 6, 5, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (412, 'n', to_date('23-01-2023', 'dd-mm-yyyy'), 28, 5, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (413, 'y', to_date('11-05-2020', 'dd-mm-yyyy'), 8, 1, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (414, 'y', to_date('10-01-2021', 'dd-mm-yyyy'), 25, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (415, 'n', to_date('11-09-2023', 'dd-mm-yyyy'), 8, 6, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (416, 'n', to_date('04-04-2023', 'dd-mm-yyyy'), 13, 5, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (417, 'y', to_date('16-09-2021', 'dd-mm-yyyy'), 4, 8, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (418, 'y', to_date('13-07-2022', 'dd-mm-yyyy'), 5, 7, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (419, 'y', to_date('05-04-2021', 'dd-mm-yyyy'), 5, 5, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (420, 'y', to_date('22-05-2022', 'dd-mm-yyyy'), 27, 7, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (421, 'y', to_date('03-04-2023', 'dd-mm-yyyy'), 16, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (422, 'n', to_date('10-05-2022', 'dd-mm-yyyy'), 2, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (423, 'y', to_date('18-11-2020', 'dd-mm-yyyy'), 29, 7, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (424, 'y', to_date('19-03-2022', 'dd-mm-yyyy'), 2, 7, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (425, 'y', to_date('17-01-2023', 'dd-mm-yyyy'), 18, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (426, 'n', to_date('23-10-2022', 'dd-mm-yyyy'), 17, 4, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (427, 'n', to_date('24-05-2021', 'dd-mm-yyyy'), 26, 3, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (428, 'n', to_date('24-04-2023', 'dd-mm-yyyy'), 22, 4, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (429, 'y', to_date('21-12-2022', 'dd-mm-yyyy'), 18, 1, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (430, 'y', to_date('05-11-2021', 'dd-mm-yyyy'), 29, 3, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (431, 'n', to_date('09-08-2022', 'dd-mm-yyyy'), 20, 7, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (432, 'y', to_date('05-11-2020', 'dd-mm-yyyy'), 15, 8, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (433, 'y', to_date('23-04-2022', 'dd-mm-yyyy'), 5, 6, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (434, 'y', to_date('20-06-2021', 'dd-mm-yyyy'), 8, 4, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (435, 'n', to_date('22-11-2021', 'dd-mm-yyyy'), 24, 7, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (436, 'n', to_date('01-03-2021', 'dd-mm-yyyy'), 20, 2, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (437, 'y', to_date('18-10-2021', 'dd-mm-yyyy'), 4, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (438, 'n', to_date('14-07-2021', 'dd-mm-yyyy'), 21, 2, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (439, 'n', to_date('16-08-2020', 'dd-mm-yyyy'), 25, 8, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (440, 'y', to_date('08-06-2020', 'dd-mm-yyyy'), 22, 7, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (441, 'n', to_date('05-07-2020', 'dd-mm-yyyy'), 14, 7, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (442, 'y', to_date('24-04-2021', 'dd-mm-yyyy'), 26, 5, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (443, 'y', to_date('17-04-2021', 'dd-mm-yyyy'), 6, 6, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (444, 'y', to_date('17-04-2023', 'dd-mm-yyyy'), 4, 2, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (445, 'y', to_date('07-10-2021', 'dd-mm-yyyy'), 15, 2, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (446, 'n', to_date('30-10-2022', 'dd-mm-yyyy'), 1, 6, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (447, 'n', to_date('14-11-2022', 'dd-mm-yyyy'), 17, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (448, 'n', to_date('28-06-2022', 'dd-mm-yyyy'), 27, 4, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (449, 'n', to_date('18-03-2021', 'dd-mm-yyyy'), 24, 5, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (450, 'y', to_date('16-07-2023', 'dd-mm-yyyy'), 7, 8, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (451, 'y', to_date('26-10-2022', 'dd-mm-yyyy'), 9, 3, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (452, 'n', to_date('07-01-2023', 'dd-mm-yyyy'), 5, 8, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (453, 'y', to_date('22-09-2020', 'dd-mm-yyyy'), 13, 4, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (454, 'y', to_date('19-06-2023', 'dd-mm-yyyy'), 28, 3, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (455, 'n', to_date('07-06-2020', 'dd-mm-yyyy'), 19, 6, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (456, 'y', to_date('17-07-2022', 'dd-mm-yyyy'), 22, 6, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (457, 'y', to_date('24-03-2021', 'dd-mm-yyyy'), 8, 7, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (458, 'n', to_date('05-08-2021', 'dd-mm-yyyy'), 29, 8, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (459, 'n', to_date('30-09-2020', 'dd-mm-yyyy'), 22, 5, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (460, 'y', to_date('07-06-2022', 'dd-mm-yyyy'), 20, 6, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (461, 'n', to_date('19-06-2021', 'dd-mm-yyyy'), 14, 1, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (462, 'y', to_date('06-02-2021', 'dd-mm-yyyy'), 19, 1, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (463, 'y', to_date('08-11-2020', 'dd-mm-yyyy'), 22, 8, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (464, 'y', to_date('08-06-2023', 'dd-mm-yyyy'), 24, 7, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (465, 'y', to_date('12-09-2021', 'dd-mm-yyyy'), 26, 1, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (466, 'y', to_date('15-09-2023', 'dd-mm-yyyy'), 1, 4, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (467, 'n', to_date('24-09-2023', 'dd-mm-yyyy'), 7, 2, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (468, 'n', to_date('10-05-2023', 'dd-mm-yyyy'), 29, 3, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (469, 'n', to_date('29-11-2020', 'dd-mm-yyyy'), 6, 8, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (470, 'y', to_date('03-08-2023', 'dd-mm-yyyy'), 16, 6, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (471, 'n', to_date('29-11-2022', 'dd-mm-yyyy'), 5, 4, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (472, 'y', to_date('01-06-2020', 'dd-mm-yyyy'), 3, 2, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (473, 'y', to_date('25-11-2022', 'dd-mm-yyyy'), 18, 2, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (474, 'n', to_date('02-05-2023', 'dd-mm-yyyy'), 19, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (475, 'y', to_date('04-04-2023', 'dd-mm-yyyy'), 22, 2, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (476, 'y', to_date('24-01-2023', 'dd-mm-yyyy'), 29, 4, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (477, 'n', to_date('26-05-2023', 'dd-mm-yyyy'), 11, 2, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (478, 'n', to_date('28-10-2021', 'dd-mm-yyyy'), 8, 3, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (479, 'y', to_date('28-12-2020', 'dd-mm-yyyy'), 26, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (480, 'n', to_date('24-05-2020', 'dd-mm-yyyy'), 10, 7, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (481, 'y', to_date('08-02-2021', 'dd-mm-yyyy'), 30, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (482, 'y', to_date('03-05-2020', 'dd-mm-yyyy'), 2, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (483, 'n', to_date('04-02-2021', 'dd-mm-yyyy'), 20, 5, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (484, 'y', to_date('20-03-2022', 'dd-mm-yyyy'), 29, 1, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (485, 'y', to_date('14-12-2022', 'dd-mm-yyyy'), 23, 2, 16);
commit;
prompt 300 records committed...
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (486, 'n', to_date('04-09-2020', 'dd-mm-yyyy'), 25, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (487, 'n', to_date('21-09-2020', 'dd-mm-yyyy'), 17, 8, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (488, 'y', to_date('25-12-2021', 'dd-mm-yyyy'), 21, 3, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (489, 'n', to_date('15-03-2022', 'dd-mm-yyyy'), 24, 4, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (490, 'y', to_date('27-01-2023', 'dd-mm-yyyy'), 13, 8, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (491, 'n', to_date('03-12-2023', 'dd-mm-yyyy'), 26, 3, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (492, 'y', to_date('15-11-2022', 'dd-mm-yyyy'), 4, 1, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (493, 'n', to_date('15-09-2020', 'dd-mm-yyyy'), 27, 3, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (494, 'n', to_date('19-06-2021', 'dd-mm-yyyy'), 19, 3, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (495, 'y', to_date('12-10-2021', 'dd-mm-yyyy'), 16, 8, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (496, 'n', to_date('11-05-2022', 'dd-mm-yyyy'), 9, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (497, 'n', to_date('30-08-2020', 'dd-mm-yyyy'), 6, 5, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (498, 'y', to_date('23-06-2020', 'dd-mm-yyyy'), 22, 2, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (499, 'y', to_date('02-07-2023', 'dd-mm-yyyy'), 8, 2, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (500, 'y', to_date('15-05-2020', 'dd-mm-yyyy'), 4, 3, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (501, 'n', to_date('02-05-2022', 'dd-mm-yyyy'), 16, 7, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (502, 'y', to_date('19-02-2022', 'dd-mm-yyyy'), 25, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (503, 'n', to_date('18-12-2022', 'dd-mm-yyyy'), 12, 7, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (504, 'y', to_date('17-08-2021', 'dd-mm-yyyy'), 1, 8, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (505, 'n', to_date('19-12-2020', 'dd-mm-yyyy'), 4, 1, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (506, 'n', to_date('28-02-2023', 'dd-mm-yyyy'), 24, 8, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (507, 'y', to_date('20-02-2021', 'dd-mm-yyyy'), 12, 2, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (508, 'n', to_date('27-12-2021', 'dd-mm-yyyy'), 23, 3, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (509, 'y', to_date('15-11-2022', 'dd-mm-yyyy'), 30, 5, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (510, 'y', to_date('29-05-2020', 'dd-mm-yyyy'), 20, 4, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (511, 'n', to_date('25-10-2023', 'dd-mm-yyyy'), 9, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (512, 'y', to_date('22-12-2020', 'dd-mm-yyyy'), 30, 6, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (513, 'n', to_date('09-09-2020', 'dd-mm-yyyy'), 5, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (514, 'n', to_date('06-02-2023', 'dd-mm-yyyy'), 11, 2, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (515, 'y', to_date('01-01-2023', 'dd-mm-yyyy'), 2, 2, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (516, 'y', to_date('06-10-2022', 'dd-mm-yyyy'), 30, 2, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (517, 'y', to_date('24-12-2022', 'dd-mm-yyyy'), 12, 8, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (518, 'n', to_date('26-07-2023', 'dd-mm-yyyy'), 19, 7, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (519, 'n', to_date('26-10-2022', 'dd-mm-yyyy'), 16, 5, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (520, 'n', to_date('22-12-2021', 'dd-mm-yyyy'), 22, 1, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (521, 'n', to_date('18-05-2021', 'dd-mm-yyyy'), 12, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (522, 'y', to_date('08-05-2022', 'dd-mm-yyyy'), 7, 2, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (176, 'n', to_date('16-05-2020', 'dd-mm-yyyy'), 17, 6, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (177, 'n', to_date('15-08-2020', 'dd-mm-yyyy'), 16, 2, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (178, 'y', to_date('15-06-2023', 'dd-mm-yyyy'), 22, 2, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (179, 'n', to_date('07-01-2023', 'dd-mm-yyyy'), 8, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (180, 'y', to_date('23-10-2022', 'dd-mm-yyyy'), 26, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (181, 'n', to_date('20-10-2023', 'dd-mm-yyyy'), 28, 6, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (182, 'n', to_date('14-01-2022', 'dd-mm-yyyy'), 19, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (183, 'n', to_date('23-06-2021', 'dd-mm-yyyy'), 10, 3, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (184, 'n', to_date('08-03-2022', 'dd-mm-yyyy'), 29, 3, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (185, 'n', to_date('26-03-2023', 'dd-mm-yyyy'), 18, 8, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (186, 'n', to_date('21-12-2023', 'dd-mm-yyyy'), 22, 6, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (187, 'n', to_date('17-07-2021', 'dd-mm-yyyy'), 19, 2, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (188, 'y', to_date('08-11-2021', 'dd-mm-yyyy'), 9, 7, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (189, 'n', to_date('16-03-2021', 'dd-mm-yyyy'), 7, 5, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (190, 'y', to_date('11-11-2023', 'dd-mm-yyyy'), 28, 3, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (191, 'y', to_date('08-06-2021', 'dd-mm-yyyy'), 16, 5, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (192, 'y', to_date('24-09-2022', 'dd-mm-yyyy'), 24, 6, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (193, 'y', to_date('23-05-2023', 'dd-mm-yyyy'), 23, 7, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (194, 'y', to_date('14-11-2022', 'dd-mm-yyyy'), 3, 6, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (195, 'y', to_date('18-01-2021', 'dd-mm-yyyy'), 14, 7, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (196, 'y', to_date('15-05-2022', 'dd-mm-yyyy'), 5, 3, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (197, 'n', to_date('20-03-2023', 'dd-mm-yyyy'), 17, 8, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (198, 'n', to_date('23-09-2023', 'dd-mm-yyyy'), 3, 7, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (199, 'n', to_date('14-03-2023', 'dd-mm-yyyy'), 6, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (200, 'n', to_date('22-10-2021', 'dd-mm-yyyy'), 17, 1, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (201, 'n', to_date('30-09-2023', 'dd-mm-yyyy'), 2, 2, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (202, 'n', to_date('11-04-2022', 'dd-mm-yyyy'), 8, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (203, 'y', to_date('22-10-2020', 'dd-mm-yyyy'), 5, 3, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (204, 'y', to_date('31-07-2022', 'dd-mm-yyyy'), 2, 5, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (205, 'n', to_date('11-08-2021', 'dd-mm-yyyy'), 13, 1, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (206, 'n', to_date('02-08-2022', 'dd-mm-yyyy'), 26, 6, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (207, 'y', to_date('06-07-2021', 'dd-mm-yyyy'), 18, 1, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (208, 'y', to_date('01-02-2023', 'dd-mm-yyyy'), 30, 1, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (209, 'n', to_date('04-06-2021', 'dd-mm-yyyy'), 3, 5, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (210, 'n', to_date('22-10-2022', 'dd-mm-yyyy'), 25, 3, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (211, 'y', to_date('29-09-2022', 'dd-mm-yyyy'), 10, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (212, 'y', to_date('26-08-2020', 'dd-mm-yyyy'), 10, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (213, 'n', to_date('17-10-2021', 'dd-mm-yyyy'), 1, 5, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (214, 'n', to_date('19-08-2022', 'dd-mm-yyyy'), 26, 1, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (215, 'y', to_date('07-09-2023', 'dd-mm-yyyy'), 21, 3, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (216, 'y', to_date('14-11-2022', 'dd-mm-yyyy'), 15, 5, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (217, 'y', to_date('27-02-2021', 'dd-mm-yyyy'), 25, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (218, 'y', to_date('26-05-2023', 'dd-mm-yyyy'), 15, 1, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (219, 'y', to_date('15-12-2021', 'dd-mm-yyyy'), 24, 6, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (220, 'n', to_date('14-06-2021', 'dd-mm-yyyy'), 7, 2, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (221, 'y', to_date('16-01-2023', 'dd-mm-yyyy'), 5, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (222, 'n', to_date('09-03-2022', 'dd-mm-yyyy'), 27, 7, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (223, 'y', to_date('12-12-2020', 'dd-mm-yyyy'), 3, 1, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (224, 'n', to_date('04-01-2022', 'dd-mm-yyyy'), 16, 1, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (225, 'y', to_date('02-03-2021', 'dd-mm-yyyy'), 16, 1, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (226, 'n', to_date('06-06-2020', 'dd-mm-yyyy'), 22, 7, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (227, 'y', to_date('17-02-2023', 'dd-mm-yyyy'), 30, 8, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (228, 'y', to_date('13-06-2022', 'dd-mm-yyyy'), 23, 3, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (229, 'y', to_date('28-10-2022', 'dd-mm-yyyy'), 11, 4, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (230, 'y', to_date('30-11-2020', 'dd-mm-yyyy'), 26, 1, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (231, 'n', to_date('02-06-2022', 'dd-mm-yyyy'), 9, 4, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (232, 'n', to_date('16-08-2020', 'dd-mm-yyyy'), 12, 4, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (233, 'n', to_date('02-02-2023', 'dd-mm-yyyy'), 3, 5, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (234, 'n', to_date('05-11-2020', 'dd-mm-yyyy'), 24, 3, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (235, 'n', to_date('28-06-2020', 'dd-mm-yyyy'), 23, 6, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (236, 'y', to_date('30-09-2022', 'dd-mm-yyyy'), 29, 4, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (237, 'y', to_date('05-03-2023', 'dd-mm-yyyy'), 10, 2, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (238, 'y', to_date('04-09-2020', 'dd-mm-yyyy'), 27, 8, 16);
commit;
prompt 400 records committed...
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (239, 'y', to_date('27-03-2023', 'dd-mm-yyyy'), 11, 2, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (240, 'n', to_date('23-04-2021', 'dd-mm-yyyy'), 15, 7, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (241, 'y', to_date('17-12-2021', 'dd-mm-yyyy'), 15, 1, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (242, 'y', to_date('28-07-2021', 'dd-mm-yyyy'), 16, 4, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (243, 'n', to_date('10-01-2022', 'dd-mm-yyyy'), 5, 3, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (244, 'n', to_date('16-04-2022', 'dd-mm-yyyy'), 26, 6, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (245, 'y', to_date('26-10-2020', 'dd-mm-yyyy'), 19, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (246, 'y', to_date('07-01-2022', 'dd-mm-yyyy'), 22, 8, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (247, 'n', to_date('21-08-2020', 'dd-mm-yyyy'), 25, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (248, 'n', to_date('21-06-2022', 'dd-mm-yyyy'), 13, 4, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (249, 'n', to_date('23-12-2023', 'dd-mm-yyyy'), 1, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (250, 'n', to_date('06-04-2021', 'dd-mm-yyyy'), 15, 4, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (251, 'n', to_date('21-07-2022', 'dd-mm-yyyy'), 28, 4, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (252, 'n', to_date('09-03-2022', 'dd-mm-yyyy'), 25, 6, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (253, 'n', to_date('04-05-2021', 'dd-mm-yyyy'), 30, 4, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (254, 'y', to_date('28-08-2023', 'dd-mm-yyyy'), 27, 2, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (255, 'y', to_date('10-12-2022', 'dd-mm-yyyy'), 23, 1, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (256, 'y', to_date('28-10-2023', 'dd-mm-yyyy'), 11, 8, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (257, 'n', to_date('26-03-2022', 'dd-mm-yyyy'), 5, 5, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (258, 'n', to_date('05-05-2020', 'dd-mm-yyyy'), 28, 2, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (259, 'y', to_date('22-01-2021', 'dd-mm-yyyy'), 29, 4, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (260, 'y', to_date('14-07-2022', 'dd-mm-yyyy'), 22, 1, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (261, 'n', to_date('27-05-2022', 'dd-mm-yyyy'), 13, 6, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (1, 'y', to_date('15-02-2022', 'dd-mm-yyyy'), 11, 8, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (2, 'n', to_date('26-09-2023', 'dd-mm-yyyy'), 21, 3, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (3, 'y', to_date('30-11-2023', 'dd-mm-yyyy'), 14, 7, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (4, 'y', to_date('28-05-2021', 'dd-mm-yyyy'), 16, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (5, 'n', to_date('01-10-2023', 'dd-mm-yyyy'), 20, 1, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (6, 'n', to_date('23-10-2023', 'dd-mm-yyyy'), 30, 1, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (7, 'n', to_date('08-07-2023', 'dd-mm-yyyy'), 19, 2, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (8, 'y', to_date('29-10-2023', 'dd-mm-yyyy'), 3, 8, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (9, 'y', to_date('06-08-2021', 'dd-mm-yyyy'), 23, 5, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (10, 'n', to_date('28-05-2020', 'dd-mm-yyyy'), 7, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (11, 'y', to_date('29-12-2020', 'dd-mm-yyyy'), 24, 4, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (12, 'y', to_date('05-07-2020', 'dd-mm-yyyy'), 11, 4, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (13, 'n', to_date('09-01-2021', 'dd-mm-yyyy'), 30, 7, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (14, 'y', to_date('17-08-2023', 'dd-mm-yyyy'), 16, 6, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (15, 'n', to_date('19-06-2022', 'dd-mm-yyyy'), 29, 4, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (16, 'n', to_date('13-11-2022', 'dd-mm-yyyy'), 16, 8, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (17, 'n', to_date('23-09-2020', 'dd-mm-yyyy'), 3, 6, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (18, 'n', to_date('03-10-2023', 'dd-mm-yyyy'), 18, 1, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (19, 'y', to_date('27-05-2021', 'dd-mm-yyyy'), 12, 8, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (20, 'y', to_date('21-12-2021', 'dd-mm-yyyy'), 2, 2, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (21, 'y', to_date('17-05-2020', 'dd-mm-yyyy'), 23, 4, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (22, 'y', to_date('22-07-2023', 'dd-mm-yyyy'), 27, 8, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (23, 'n', to_date('18-09-2023', 'dd-mm-yyyy'), 11, 5, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (24, 'y', to_date('16-08-2020', 'dd-mm-yyyy'), 30, 4, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (25, 'y', to_date('11-08-2022', 'dd-mm-yyyy'), 21, 5, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (26, 'y', to_date('29-11-2021', 'dd-mm-yyyy'), 5, 1, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (27, 'n', to_date('18-08-2023', 'dd-mm-yyyy'), 6, 3, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (28, 'y', to_date('14-04-2023', 'dd-mm-yyyy'), 13, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (29, 'n', to_date('23-07-2022', 'dd-mm-yyyy'), 12, 6, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (30, 'y', to_date('31-07-2023', 'dd-mm-yyyy'), 19, 1, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (31, 'y', to_date('24-04-2022', 'dd-mm-yyyy'), 3, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (32, 'y', to_date('08-05-2022', 'dd-mm-yyyy'), 14, 1, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (33, 'y', to_date('06-12-2023', 'dd-mm-yyyy'), 7, 7, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (34, 'n', to_date('05-03-2022', 'dd-mm-yyyy'), 26, 5, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (35, 'n', to_date('21-07-2020', 'dd-mm-yyyy'), 3, 7, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (36, 'n', to_date('14-11-2023', 'dd-mm-yyyy'), 18, 2, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (37, 'n', to_date('18-10-2022', 'dd-mm-yyyy'), 22, 2, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (38, 'y', to_date('28-12-2021', 'dd-mm-yyyy'), 8, 7, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (39, 'n', to_date('03-08-2020', 'dd-mm-yyyy'), 30, 7, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (40, 'y', to_date('25-10-2020', 'dd-mm-yyyy'), 21, 7, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (41, 'n', to_date('27-12-2021', 'dd-mm-yyyy'), 6, 2, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (42, 'y', to_date('13-12-2021', 'dd-mm-yyyy'), 11, 5, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (43, 'y', to_date('10-08-2021', 'dd-mm-yyyy'), 3, 3, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (44, 'y', to_date('23-04-2021', 'dd-mm-yyyy'), 30, 3, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (45, 'n', to_date('02-09-2022', 'dd-mm-yyyy'), 14, 3, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (46, 'n', to_date('27-09-2021', 'dd-mm-yyyy'), 28, 6, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (47, 'n', to_date('25-10-2023', 'dd-mm-yyyy'), 11, 5, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (48, 'y', to_date('13-05-2023', 'dd-mm-yyyy'), 3, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (49, 'n', to_date('14-03-2021', 'dd-mm-yyyy'), 26, 2, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (50, 'y', to_date('04-01-2023', 'dd-mm-yyyy'), 20, 5, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (51, 'y', to_date('12-10-2023', 'dd-mm-yyyy'), 24, 3, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (52, 'y', to_date('10-05-2023', 'dd-mm-yyyy'), 25, 4, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (53, 'y', to_date('17-01-2022', 'dd-mm-yyyy'), 27, 6, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (54, 'y', to_date('06-06-2021', 'dd-mm-yyyy'), 7, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (55, 'y', to_date('01-06-2021', 'dd-mm-yyyy'), 18, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (56, 'n', to_date('20-05-2021', 'dd-mm-yyyy'), 5, 7, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (57, 'n', to_date('21-04-2023', 'dd-mm-yyyy'), 27, 7, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (58, 'n', to_date('22-01-2023', 'dd-mm-yyyy'), 16, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (59, 'n', to_date('18-03-2023', 'dd-mm-yyyy'), 7, 3, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (60, 'n', to_date('03-10-2020', 'dd-mm-yyyy'), 26, 4, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (61, 'n', to_date('05-06-2020', 'dd-mm-yyyy'), 30, 7, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (62, 'y', to_date('16-12-2023', 'dd-mm-yyyy'), 26, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (63, 'n', to_date('17-06-2023', 'dd-mm-yyyy'), 20, 8, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (64, 'n', to_date('12-05-2023', 'dd-mm-yyyy'), 16, 8, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (65, 'n', to_date('24-04-2023', 'dd-mm-yyyy'), 27, 1, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (66, 'n', to_date('18-04-2021', 'dd-mm-yyyy'), 1, 4, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (67, 'n', to_date('17-05-2023', 'dd-mm-yyyy'), 29, 1, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (68, 'y', to_date('11-08-2023', 'dd-mm-yyyy'), 1, 1, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (69, 'n', to_date('06-05-2020', 'dd-mm-yyyy'), 25, 5, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (70, 'n', to_date('22-06-2022', 'dd-mm-yyyy'), 19, 6, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (71, 'y', to_date('26-12-2023', 'dd-mm-yyyy'), 10, 1, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (72, 'y', to_date('17-12-2022', 'dd-mm-yyyy'), 13, 6, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (73, 'y', to_date('19-03-2022', 'dd-mm-yyyy'), 19, 8, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (74, 'y', to_date('07-04-2023', 'dd-mm-yyyy'), 7, 5, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (75, 'y', to_date('09-06-2021', 'dd-mm-yyyy'), 15, 5, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (76, 'n', to_date('08-10-2021', 'dd-mm-yyyy'), 16, 3, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (77, 'y', to_date('31-10-2021', 'dd-mm-yyyy'), 6, 4, 5);
commit;
prompt 500 records committed...
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (78, 'n', to_date('30-04-2022', 'dd-mm-yyyy'), 5, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (79, 'n', to_date('07-04-2023', 'dd-mm-yyyy'), 12, 7, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (80, 'n', to_date('07-05-2023', 'dd-mm-yyyy'), 24, 4, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (81, 'n', to_date('16-05-2023', 'dd-mm-yyyy'), 8, 5, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (82, 'y', to_date('12-01-2023', 'dd-mm-yyyy'), 25, 5, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (83, 'n', to_date('24-07-2020', 'dd-mm-yyyy'), 3, 6, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (84, 'y', to_date('05-07-2023', 'dd-mm-yyyy'), 14, 8, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (85, 'y', to_date('10-08-2022', 'dd-mm-yyyy'), 23, 6, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (86, 'n', to_date('20-12-2021', 'dd-mm-yyyy'), 3, 2, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (87, 'y', to_date('13-12-2020', 'dd-mm-yyyy'), 11, 5, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (88, 'y', to_date('09-04-2022', 'dd-mm-yyyy'), 2, 4, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (89, 'y', to_date('02-09-2023', 'dd-mm-yyyy'), 1, 2, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (90, 'y', to_date('08-05-2021', 'dd-mm-yyyy'), 30, 8, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (91, 'n', to_date('23-05-2020', 'dd-mm-yyyy'), 26, 3, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (92, 'n', to_date('22-11-2021', 'dd-mm-yyyy'), 1, 8, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (93, 'y', to_date('03-05-2020', 'dd-mm-yyyy'), 7, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (94, 'y', to_date('05-07-2022', 'dd-mm-yyyy'), 29, 5, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (95, 'n', to_date('17-06-2020', 'dd-mm-yyyy'), 14, 1, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (96, 'n', to_date('23-12-2023', 'dd-mm-yyyy'), 10, 6, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (97, 'n', to_date('19-05-2021', 'dd-mm-yyyy'), 8, 4, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (98, 'n', to_date('11-02-2021', 'dd-mm-yyyy'), 4, 7, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (99, 'n', to_date('27-06-2022', 'dd-mm-yyyy'), 28, 8, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (100, 'n', to_date('19-01-2021', 'dd-mm-yyyy'), 10, 1, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (101, 'y', to_date('16-08-2020', 'dd-mm-yyyy'), 3, 7, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (102, 'n', to_date('07-12-2021', 'dd-mm-yyyy'), 12, 8, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (103, 'n', to_date('22-07-2022', 'dd-mm-yyyy'), 25, 7, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (104, 'y', to_date('01-12-2022', 'dd-mm-yyyy'), 4, 4, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (105, 'n', to_date('06-06-2022', 'dd-mm-yyyy'), 21, 6, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (106, 'y', to_date('22-02-2022', 'dd-mm-yyyy'), 21, 3, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (107, 'n', to_date('10-04-2021', 'dd-mm-yyyy'), 13, 1, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (108, 'n', to_date('13-03-2023', 'dd-mm-yyyy'), 17, 8, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (109, 'n', to_date('19-05-2021', 'dd-mm-yyyy'), 15, 3, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (110, 'y', to_date('14-04-2023', 'dd-mm-yyyy'), 5, 3, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (111, 'n', to_date('12-11-2022', 'dd-mm-yyyy'), 6, 7, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (112, 'n', to_date('21-08-2021', 'dd-mm-yyyy'), 26, 3, 16);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (113, 'y', to_date('25-01-2023', 'dd-mm-yyyy'), 29, 8, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (114, 'n', to_date('12-08-2022', 'dd-mm-yyyy'), 9, 5, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (115, 'y', to_date('02-12-2020', 'dd-mm-yyyy'), 5, 2, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (116, 'y', to_date('24-06-2020', 'dd-mm-yyyy'), 6, 8, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (117, 'y', to_date('09-04-2021', 'dd-mm-yyyy'), 20, 1, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (118, 'y', to_date('30-10-2023', 'dd-mm-yyyy'), 16, 7, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (119, 'y', to_date('08-08-2020', 'dd-mm-yyyy'), 22, 8, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (120, 'n', to_date('14-06-2020', 'dd-mm-yyyy'), 21, 7, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (121, 'n', to_date('29-11-2023', 'dd-mm-yyyy'), 24, 5, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (122, 'y', to_date('11-06-2023', 'dd-mm-yyyy'), 16, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (123, 'y', to_date('03-02-2023', 'dd-mm-yyyy'), 7, 2, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (124, 'n', to_date('09-01-2021', 'dd-mm-yyyy'), 5, 3, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (125, 'n', to_date('22-11-2022', 'dd-mm-yyyy'), 8, 5, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (126, 'n', to_date('09-11-2021', 'dd-mm-yyyy'), 12, 6, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (127, 'y', to_date('17-11-2023', 'dd-mm-yyyy'), 8, 6, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (128, 'n', to_date('05-12-2022', 'dd-mm-yyyy'), 30, 4, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (129, 'y', to_date('29-05-2020', 'dd-mm-yyyy'), 24, 2, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (130, 'y', to_date('10-01-2021', 'dd-mm-yyyy'), 6, 1, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (131, 'n', to_date('10-04-2022', 'dd-mm-yyyy'), 13, 1, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (132, 'y', to_date('13-01-2021', 'dd-mm-yyyy'), 29, 1, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (133, 'n', to_date('03-05-2023', 'dd-mm-yyyy'), 14, 6, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (134, 'n', to_date('30-10-2022', 'dd-mm-yyyy'), 26, 8, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (135, 'y', to_date('08-03-2022', 'dd-mm-yyyy'), 27, 8, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (136, 'y', to_date('09-07-2020', 'dd-mm-yyyy'), 15, 6, 8);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (137, 'y', to_date('12-01-2021', 'dd-mm-yyyy'), 15, 3, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (138, 'n', to_date('08-04-2021', 'dd-mm-yyyy'), 10, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (139, 'y', to_date('02-05-2023', 'dd-mm-yyyy'), 8, 7, 7);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (140, 'y', to_date('15-02-2022', 'dd-mm-yyyy'), 9, 4, 15);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (141, 'y', to_date('27-06-2021', 'dd-mm-yyyy'), 29, 2, 12);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (142, 'n', to_date('14-10-2022', 'dd-mm-yyyy'), 11, 6, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (143, 'y', to_date('08-07-2021', 'dd-mm-yyyy'), 20, 8, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (144, 'n', to_date('19-05-2022', 'dd-mm-yyyy'), 26, 6, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (145, 'y', to_date('03-07-2023', 'dd-mm-yyyy'), 24, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (146, 'y', to_date('30-07-2023', 'dd-mm-yyyy'), 13, 7, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (147, 'y', to_date('14-08-2022', 'dd-mm-yyyy'), 9, 3, 6);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (148, 'n', to_date('27-05-2020', 'dd-mm-yyyy'), 8, 2, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (149, 'n', to_date('23-09-2023', 'dd-mm-yyyy'), 22, 2, 3);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (150, 'n', to_date('09-06-2020', 'dd-mm-yyyy'), 13, 2, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (151, 'n', to_date('02-01-2021', 'dd-mm-yyyy'), 27, 5, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (152, 'y', to_date('06-12-2023', 'dd-mm-yyyy'), 24, 1, 5);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (153, 'n', to_date('09-06-2022', 'dd-mm-yyyy'), 12, 7, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (154, 'y', to_date('08-07-2022', 'dd-mm-yyyy'), 21, 5, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (155, 'y', to_date('29-04-2022', 'dd-mm-yyyy'), 14, 4, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (156, 'n', to_date('27-05-2022', 'dd-mm-yyyy'), 25, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (157, 'n', to_date('01-05-2022', 'dd-mm-yyyy'), 19, 6, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (158, 'n', to_date('30-03-2021', 'dd-mm-yyyy'), 29, 1, 14);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (159, 'n', to_date('13-10-2022', 'dd-mm-yyyy'), 17, 8, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (160, 'n', to_date('09-08-2020', 'dd-mm-yyyy'), 28, 4, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (161, 'n', to_date('24-09-2022', 'dd-mm-yyyy'), 3, 1, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (162, 'n', to_date('17-06-2023', 'dd-mm-yyyy'), 13, 7, 2);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (163, 'y', to_date('18-01-2023', 'dd-mm-yyyy'), 5, 3, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (164, 'n', to_date('23-10-2021', 'dd-mm-yyyy'), 12, 7, 17);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (165, 'y', to_date('26-08-2023', 'dd-mm-yyyy'), 22, 1, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (166, 'y', to_date('01-06-2022', 'dd-mm-yyyy'), 2, 6, 1);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (167, 'y', to_date('06-10-2023', 'dd-mm-yyyy'), 2, 1, 19);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (168, 'n', to_date('08-10-2022', 'dd-mm-yyyy'), 28, 7, 4);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (169, 'y', to_date('21-12-2021', 'dd-mm-yyyy'), 26, 2, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (170, 'n', to_date('03-11-2020', 'dd-mm-yyyy'), 8, 2, 18);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (171, 'n', to_date('05-12-2023', 'dd-mm-yyyy'), 13, 4, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (172, 'y', to_date('09-05-2021', 'dd-mm-yyyy'), 12, 5, 9);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (173, 'y', to_date('21-04-2023', 'dd-mm-yyyy'), 15, 3, 20);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (174, 'y', to_date('20-12-2022', 'dd-mm-yyyy'), 16, 1, 10);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (175, 'y', to_date('24-04-2022', 'dd-mm-yyyy'), 11, 7, 11);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (262, 'n', to_date('05-04-2021', 'dd-mm-yyyy'), 3, 7, 13);
insert into ORDER_ (orderid, done, orderdate, amount, bloodid, bankid)
values (263, 'y', to_date('09-01-2022', 'dd-mm-yyyy'), 15, 3, 3);
commit;
prompt 600 records loaded
prompt Enabling foreign key constraints for DONOR...
alter table DONOR enable constraint SYS_C007161;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C007178;
alter table DONATION enable constraint SYS_C007179;
alter table DONATION enable constraint SYS_C007180;
prompt Enabling foreign key constraints for ORDER_...
alter table ORDER_ enable constraint SYS_C007169;
alter table ORDER_ enable constraint SYS_C007170;
prompt Enabling triggers for BLOOD...
alter table BLOOD enable all triggers;
prompt Enabling triggers for BLOODBANK...
alter table BLOODBANK enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for STATION...
alter table STATION enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for ORDER_...
alter table ORDER_ enable all triggers;
set feedback on
set define on
prompt Done.
