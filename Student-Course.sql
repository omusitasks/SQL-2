
CREATE DATABASE mydatabase1;
USE mydatabase1;

CREATE TABLE PassengerDetails(
       PassportNo INT NOT NULL,
       FirstName char(15) NOT NULL,
	   MiddleName char(15) NOT NULL,
       LastName char(15) NOT NULL,
       IssuingCompany char(30) NOT NULL,
       ApartmentStreet char(15) NOT NULL,
       City char(15) NOT NULL,
       State char(15) NOT NULL,
       Zip char(15) NOT NULL,
       Country Char(15)  NOT NULL,
	   Contact char(15) NOT NULL,
       EmergencyContact char(15) NOT NULL,

       PRIMARY KEY (PassportNo)
);

-- insert into PassengerDetails table
INSERT INTO PassengerDetails VALUES(100, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(101, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(102, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(103, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(104, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(105, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(106, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(107, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(108, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');
INSERT INTO PassengerDetails VALUES(109, 'Li', 'Muna', 'Ma','Apex', 'Thiomi', 'Cairo','Egpyt','10201','Egpyt','44,067,0832','44,067,0832');


CREATE TABLE Passenger(
  PassengerID INT NOT NULL,
  PassportNo INT NOT NULL,
  PRIMARY KEY (`PassengerID`),

FOREIGN KEY (PassportNo)
        REFERENCES PassengerDetails(PassportNo)
        ON DELETE CASCADE
) ENGINE=INNODB;

-- insert into Passenger table
INSERT INTO Passenger VALUES(110, '107');
INSERT INTO Passenger VALUES(111, '101');
INSERT INTO Passenger VALUES(112, '100');
INSERT INTO Passenger VALUES(113, '103');
INSERT INTO Passenger VALUES(114, '105');
INSERT INTO Passenger VALUES(115, '102');
INSERT INTO Passenger VALUES(116, '104');
INSERT INTO Passenger VALUES(117, '108');
INSERT INTO Passenger VALUES(118, '109');
INSERT INTO Passenger VALUES(119, '106');


CREATE TABLE Flight(
  FlightID INT NOT NULL,
  FlightType char(30)  NOT NULL,
  Airline char(30) NOT NULL,
  PRIMARY KEY (`FlightID`)
);

-- insert into Flight table
INSERT INTO Flight VALUES(120, 'Kw','QR');
INSERT INTO Flight VALUES(121, 'Pm','RO');
INSERT INTO Flight VALUES(122, 'Lk','RO');
INSERT INTO Flight VALUES(123, 'Pm','QR');
INSERT INTO Flight VALUES(124, 'Kw','QR');
INSERT INTO Flight VALUES(125, 'Kw','RO');
INSERT INTO Flight VALUES(126, 'Kw','RO');
INSERT INTO Flight VALUES(127, 'Pm','RO');
INSERT INTO Flight VALUES(128, 'Pm','QR');
INSERT INTO Flight VALUES(129, 'Pm','QR');


CREATE TABLE Schedules(
  SheduleID INT NOT NULL,
  FlightID INT NOT NULL,
  Departure date NOT NULL,
  Arrival date NULL,
  FoodPreference char(30) NOT NULL,
  PRIMARY KEY (`SheduleID`),
FOREIGN KEY (FlightID)
        REFERENCES Flight(FlightID)
        ON DELETE CASCADE
) ENGINE=INNODB;

-- insert into Schedules table 
INSERT INTO Schedules VALUES(130,120,'12-01-2021','13-01-2021','Fish');
INSERT INTO Schedules VALUES(131, 121,'12-01-2021','13-01-2021','Smoke');
INSERT INTO Schedules VALUES(132, 122,'12-01-2021','13-01-2021','Fish');
INSERT INTO Schedules VALUES(133, 123, '12-01-2021','13-01-2021','Fish');
INSERT INTO Schedules VALUES(134, 124,'12-01-2021','13-01-2021','Pizza');
INSERT INTO Schedules VALUES(135, 125,'12-01-2021','13-01-2021','Pizza');
INSERT INTO Schedules VALUES(136, 126,'12-01-2021','13-01-2021','Rice');
INSERT INTO Schedules VALUES(137, 127,'12-01-2021','13-01-2021','Poak');
INSERT INTO Schedules VALUES(138, 128,'12-01-2021','13-01-2021','Meat');
INSERT INTO Schedules VALUES(139, 129,'12-01-2021','13-01-2021','Chicken');


CREATE TABLE Ticket(
  TicketNo INT NOT NULL,
  PassengerID INT NOT NULL,
  SheduleID INT  NOT NULL,
  SeatNo INT NOT NULL,
  Class Char(10) NULL,
  FoodPreference char(30) NOT NULL,
  PRIMARY KEY (`TicketNo`),
FOREIGN KEY (PassengerID)
        REFERENCES Passenger(PassengerID)
        ON DELETE CASCADE,
FOREIGN KEY (SheduleID)
        REFERENCES Schedules(SheduleID)
        ON DELETE CASCADE
) ENGINE=INNODB;

-- insert into Ticket table 
INSERT INTO Ticket VALUES(140,110, 130,120,'21','lower','Fish');
INSERT INTO Ticket VALUES(141,111, 131, 121,'12','lower','Smoke');
INSERT INTO Ticket VALUES(142,112, 132, 122,'10','middle','Fish');
INSERT INTO Ticket VALUES(143,113, 133, 123, '11','middle','Fish');
INSERT INTO Ticket VALUES(144,113, 134, 124,'22','lower','Pizza');
INSERT INTO Ticket VALUES(145,114, 135, 125,'30','lower','Pizza');
INSERT INTO Ticket VALUES(146,117, 136, 126,'31','middle','Rice');
INSERT INTO Ticket VALUES(147,119, 137, 127,'09','high','Poak');
INSERT INTO Ticket VALUES(148,116, 138, 128,'15','middle','Meat');
INSERT INTO Ticket VALUES(149,113, 139, 129,'18','high','Chicken');


CREATE TABLE FoodMenu(
  FoodMenuID INT NOT NULL,
  Starters INT  NOT NULL,
  MainCourse char(30)  NOT NULL,
  Deserts char(30)  NOT NULL,
  snacks char(30)  NOT NULL,
  FoodProvider char(30)  NOT NULL,
  PRIMARY KEY (`FoodMenuID`)
);

-- insert into FoodMenu table 
INSERT INTO FoodMenu VALUES(150,'hye', 'cs','Sahara','cakes','Fish');
INSERT INTO FoodMenu VALUES(151,'hey', 'cs', 'Kilsha','pks','Smoke');
INSERT INTO FoodMenu VALUES(152,'wew', 'Is', 'Sahara','uyt','Fish');
INSERT INTO FoodMenu VALUES(153,'dw', 'IS', 'Kilsha', 'jau','Fish');
INSERT INTO FoodMenu VALUES(154,'we', 'IS', 'Kilsha','ad','Pizza');
INSERT INTO FoodMenu VALUES(155,'we', 'WEB', 'Kilsha','las','Pizza');
INSERT INTO FoodMenu VALUES(156,'we', 'CS', 'Kilsha','mid','Rice');
INSERT INTO FoodMenu VALUES(157,'hye', 'CS', 'Sahara','hi','Poak');
INSERT INTO FoodMenu VALUES(158,'we', 'CS', 'Sahara','mi','Meat');
INSERT INTO FoodMenu VALUES(159,'fr', 'CS', 'Sahara','hi','Chicken');


CREATE TABLE FoodMenuID(
  FoodMenuID INT NOT NULL,
  TicketNo INT  NOT NULL,
  PRIMARY KEY (`FoodMenuID`, `TicketNo`),
  CONSTRAINT `FoodMenu_Ticket_fk`
        FOREIGN KEY `Ticket_fk` (`TicketNo`) REFERENCES `Ticket` (`TicketNo`)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FoodMenuID_FoodMenu_fk`
        FOREIGN KEY `FoodMenu_fk` (`FoodMenuID`) REFERENCES `FoodMenu` (`FoodMenuID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- insert into FoodMenuID table 
INSERT INTO FoodMenuID VALUES(160,140);
INSERT INTO FoodMenuID VALUES(161,141);
INSERT INTO FoodMenuID VALUES(162,142);
INSERT INTO FoodMenuID VALUES(163,142);
INSERT INTO FoodMenuID VALUES(164,142);
INSERT INTO FoodMenuID VALUES(165,143);
INSERT INTO FoodMenuID VALUES(166,145);
INSERT INTO FoodMenuID VALUES(167,146);
INSERT INTO FoodMenuID VALUES(168,140);
INSERT INTO FoodMenuID VALUES(169,148);


CREATE TABLE SPCategory(
  SPCategoryID INT NOT NULL,
  Descriptions char(30)  NOT NULL,
  ServicesIncluded char(30)  NOT NULL,
  PRIMARY KEY (`SPCategoryID`)
);

-- insert into SPCategory table 
INSERT INTO SPCategory VALUES(170,'lower','Fish');
INSERT INTO SPCategory VALUES(171,'lower','Fish');
INSERT INTO SPCategory VALUES(172,'lower','Fish');
INSERT INTO SPCategory VALUES(173,'lower','Fish');
INSERT INTO SPCategory VALUES(174,'lower','Fish');
INSERT INTO SPCategory VALUES(175,'lower','Fish');
INSERT INTO SPCategory VALUES(176,'lower','Fish');
INSERT INTO SPCategory VALUES(177,'lower','Fish');
INSERT INTO SPCategory VALUES(178,'lower','Fish');
INSERT INTO SPCategory VALUES(179,'lower','Fish');


CREATE TABLE SPCategoryID(
  SPCategoryID INT NOT NULL,
  TicketNo INT  NOT NULL,
  PRIMARY KEY (`SPCategoryID`, `TicketNo`),
  CONSTRAINT `SPCategoryID_Ticket_fk`
        FOREIGN KEY `Ticket_fk` (`TicketNo`) REFERENCES `Ticket` (`TicketNo`)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPCategoryID_SPCategoryID_fk`
        FOREIGN KEY `SPCategory_fk` (`SPCategoryID`) REFERENCES `SPCategory` (`SPCategoryID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- insert into SPCategoryID table 
INSERT INTO SPCategoryID VALUES(180,140);
INSERT INTO SPCategoryID VALUES(181,143);
INSERT INTO SPCategoryID VALUES(182,140);
INSERT INTO SPCategoryID VALUES(183,146);
INSERT INTO SPCategoryID VALUES(184,146);
INSERT INTO SPCategoryID VALUES(185,146);
INSERT INTO SPCategoryID VALUES(186,146);
INSERT INTO SPCategoryID VALUES(187,148);
INSERT INTO SPCategoryID VALUES(188,148);
INSERT INTO SPCategoryID VALUES(189,148);


CREATE TABLE Feedback(
  FeedbackID INT NOT NULL,
  TicketNo INT  NOT NULL,
  Descriptions char(30)  NOT NULL,
  Rating char(30)  NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  CONSTRAINT `Feedback_Ticket_fk`
        FOREIGN KEY `Ticket_fk` (`TicketNo`) REFERENCES `Ticket` (`TicketNo`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- insert into Feedback table 
INSERT INTO Feedback VALUES(190,140,'lower services',5);
INSERT INTO Feedback VALUES(191,143,'lower services',4);
INSERT INTO Feedback VALUES(192,140,'lower services',4);
INSERT INTO Feedback VALUES(193,146,'greater services',2);
INSERT INTO Feedback VALUES(194,146,'greater services',2);
INSERT INTO Feedback VALUES(195,146,'greater services',2);
INSERT INTO Feedback VALUES(196,146,'greater services',2);
INSERT INTO Feedback VALUES(197,149,'trying to service',1);
INSERT INTO Feedback VALUES(198,149,'trying to service',1);
INSERT INTO Feedback VALUES(199,149,'trying to service',1);


CREATE TABLE EntertainmentApp(
  EntertainmentAppID INT NOT NULL,
  TypeofApp char(30)  NOT NULL,
  AppName char(15)  NOT NULL,
  details char(30)  NOT NULL,
  PRIMARY KEY (`EntertainmentAppID`)
);

CREATE TABLE EntertainmentAppID(
  EntertainmentAppID INT NOT NULL,
  TicketNo INT NOT NULL,
  PRIMARY KEY (`EntertainmentAppID`, `TicketNo`),
  CONSTRAINT `EntertainmentAppID_Ticket_fk`
        FOREIGN KEY `Ticket_fk` (`TicketNo`) REFERENCES `Ticket` (`TicketNo`)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EntertainmentAppID_EntertainmentApp_fk`
        FOREIGN KEY `EntertainmentApp_fk` (`EntertainmentAppID`) REFERENCES `EntertainmentApp` (`EntertainmentAppID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE FlightWifi(
  WifiID INT NOT NULL,
  FlightID INT NOT NULL,
  Brand char(30)  NOT NULL,
  Password_wifi char(30) NOT NULL,
  PRIMARY KEY (`WifiID`),
  CONSTRAINT `FlightID _FlightWifi_fk`
        FOREIGN KEY `Flight_fk` (`FlightID`) REFERENCES `Flight` (`FlightID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE LiveFlightMovement(
  LiveFlightMovementID INT NOT NULL,
  FlightID INT NOT NULL,
  Timestamps timestamp  NOT NULL,
  Latitude char(30) NOT NULL,
  Longitude char(30) NOT NULL,
  HighestTemperature float NOT NULL,
  LowestTemperature float NOT NULL,
  Sunrise char(10) NOT NULL,
  Sunset char(10) NOT NULL,
  PRIMARY KEY (`LiveFlightMovementID`),
  CONSTRAINT `FlightID _LiveFlightMovement_fk`
        FOREIGN KEY `Flight_fk` (`FlightID`) REFERENCES `Flight` (`FlightID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Restroom(
  RestroomID INT NOT NULL,
  FlightID INT NOT NULL,
  Location char(30) NOT NULL,
  Availability char(30) NOT NULL,
  Timestamps timestamp  NOT NULL,
  RestroomNO INT NOT NULL,
  PRIMARY KEY (`RestroomID`),
  CONSTRAINT `FlightID _Restroom_fk`
        FOREIGN KEY `Flight_fk` (`FlightID`) REFERENCES `Flight` (`FlightID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Airport(
  AirportID INT NOT NULL,
  AirportName char(30) NOT NULL,
  Country char(30) NOT NULL,
  City char(30) NOT NULL,
  State char(30) NOT NULL,
  Zip char(30) NOT NULL,
  PRIMARY KEY (`AirportID`)
);

CREATE TABLE SchedAirport(
  SheduleID INT NOT NULL,
  AirportID INT NOT NULL,
  SourceDestination char(30) NOT NULL,
  PRIMARY KEY (`SheduleID`,`AirportID`),
  CONSTRAINT `ScheduleID_SchedAirport_fk`
        FOREIGN KEY `Schedule_fk` (`SheduleID`) REFERENCES `Schedules` (`SheduleID`)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AirportID_SchedAirport_fk`
        FOREIGN KEY `Airport_fk` (`AirportID`) REFERENCES `Airport` (`AirportID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ServicesAtAirport(
  ServiceID INT NOT NULL,
  AirportID INT NOT NULL,
  Nameofservice char(30) NOT NULL,
  Typeofservice char(30) NOT NULL,
  Contact char(30) NOT NULL,
  Availability char(30) NOT NULL,
  Location char(30) NOT NULL,
  PRIMARY KEY (`ServiceID`),
  CONSTRAINT `AirportID_ServicesAtAirport_fk`
        FOREIGN KEY `Airport_fk` (`AirportID`) REFERENCES `Airport` (`AirportID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AirportServices(
  ServiceID INT NOT NULL,
  AirportID INT NOT NULL,
  PRIMARY KEY (`ServiceID`,`AirportID`),
  CONSTRAINT `ServiceID_AirportServices_fk`
        FOREIGN KEY `Service_fk` (`ServiceID`) REFERENCES `ServicesAtAirport` (`ServiceID`)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AirportID_AirportServices_fk`
        FOREIGN KEY `Airport_fk` (`AirportID`) REFERENCES `Airport` (`AirportID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Staff(
  StaffID INT NOT NULL,
  FullName char(30) NOT NULL,
  LastName char(30) NOT NULL,
  Designation char(30) NOT NULL,
  Airline char(30) NOT NULL,
  PRIMARY KEY (`StaffID`)
);

CREATE TABLE ScheduleStaff(
  SheduleID INT NOT NULL,
  StaffID INT NOT NULL,
  PRIMARY KEY (`SheduleID`,`StaffID`),
  CONSTRAINT `ScheduleID_ScheduleStaff_fk`
        FOREIGN KEY `Schedule_fk` (`SheduleID`) REFERENCES `Schedules` (`SheduleID`)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StaffID_ScheduleStaff_fk`
        FOREIGN KEY `Staff_fk` (`StaffID`) REFERENCES `Staff` (`StaffID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);


       
       
       
-- Insertion process
 
