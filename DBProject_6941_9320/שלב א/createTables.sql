CREATE TABLE Station
(
  stationID NUMERIC(3) NOT NULL,
  city VARCHAR(15),
  numberPhone VARCHAR(15),
  manager VARCHAR(15),
  PRIMARY KEY (stationID)
);

CREATE TABLE Blood
(
  bloodType VARCHAR(15),
  sign VARCHAR(15),
  bloodID NUMERIC(3) NOT NULL,
  PRIMARY KEY (bloodID)
);

CREATE TABLE BloodBank
(
  bankID NUMERIC(3) NOT NULL,
  manager VARCHAR(15),
  numberPhone VARCHAR(15),
  city VARCHAR(15),
  PRIMARY KEY (bankID)
);

CREATE TABLE Donor
(
  donorID NUMERIC(3) NOT NULL,
  fullName VARCHAR(15),
  dateOfBirth DATE ,
  gender VARCHAR(15),
  weight NUMERIC(4,2),
  numberPhone VARCHAR(15),
  bloodID NUMERIC(3),
  PRIMARY KEY (donorID),
  FOREIGN KEY (bloodID) REFERENCES Blood(bloodID)
);

CREATE TABLE Order_
(
  orderID NUMERIC(3) NOT NULL,
  done VARCHAR(15),
  orderDate DATE ,
  amount NUMERIC(3),
  bloodID NUMERIC(3),
  bankID NUMERIC(3),
  PRIMARY KEY (orderID),
  FOREIGN KEY (bloodID) REFERENCES Blood(bloodID),
  FOREIGN KEY (bankID) REFERENCES BloodBank(bankID)
);

CREATE TABLE Donation
(
  donationID NUMERIC(3) NOT NULL,
  donationDate DATE,
  valid VARCHAR(15),
  donorID NUMERIC(3),
  stationID NUMERIC(3),
  bankID NUMERIC(3),
  PRIMARY KEY (donationID),
  FOREIGN KEY (donorID) REFERENCES Donor(donorID),
  FOREIGN KEY (stationID) REFERENCES Station(stationID),
  FOREIGN KEY (bankID) REFERENCES BloodBank(bankID)
);

