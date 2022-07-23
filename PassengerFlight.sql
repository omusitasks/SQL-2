
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
  Departure char(15) NOT NULL,
  Arrival char(15)  NULL,
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
INSERT INTO Ticket VALUES(140,110, 130,'21','lower','Fish');
INSERT INTO Ticket VALUES(141,111, 131, '12','lower','Smoke');
INSERT INTO Ticket VALUES(142,112, 132,'10','middle','Fish');
INSERT INTO Ticket VALUES(143,113, 133, '11','middle','Fish');
INSERT INTO Ticket VALUES(144,115, 134,'22','lower','Pizza');
INSERT INTO Ticket VALUES(145,114, 135,'30','lower','Pizza');
INSERT INTO Ticket VALUES(146,117, 136, '31','middle','Rice');
INSERT INTO Ticket VALUES(147,119, 137,'09','high','Poak');
INSERT INTO Ticket VALUES(148,116, 138, '15','middle','Meat');
INSERT INTO Ticket VALUES(149,118, 139,'18','high','Chicken');


CREATE TABLE FoodMenu(
  FoodMenuID INT NOT NULL,
  Starters char(30) NOT NULL,
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
INSERT INTO FoodMenuID VALUES(163,143);
INSERT INTO FoodMenuID VALUES(164,144);
INSERT INTO FoodMenuID VALUES(165,145);
INSERT INTO FoodMenuID VALUES(166,146);
INSERT INTO FoodMenuID VALUES(167,147);
INSERT INTO FoodMenuID VALUES(168,148);
INSERT INTO FoodMenuID VALUES(169,149);


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
INSERT INTO SPCategoryID VALUES(182,141);
INSERT INTO SPCategoryID VALUES(183,146);
INSERT INTO SPCategoryID VALUES(184,145);
INSERT INTO SPCategoryID VALUES(185,144);
INSERT INTO SPCategoryID VALUES(186,142);
INSERT INTO SPCategoryID VALUES(187,148);
INSERT INTO SPCategoryID VALUES(188,141);
INSERT INTO SPCategoryID VALUES(189,147);


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

-- insert into EntertainmentApp table 
INSERT INTO EntertainmentApp VALUES(090,'web','sahay','for streaming');
INSERT INTO EntertainmentApp VALUES(091,'ios','yog','for streaming');
INSERT INTO EntertainmentApp VALUES(092,'android','lol','for streaming');
INSERT INTO EntertainmentApp VALUES(093,'android','help','for pic');
INSERT INTO EntertainmentApp VALUES(094,'ios','swash','for video editing');
INSERT INTO EntertainmentApp VALUES(095,'ios','swash','playing');
INSERT INTO EntertainmentApp VALUES(096,'ios','swash','for streaming');
INSERT INTO EntertainmentApp VALUES(097,'ios','helpg','playing');
INSERT INTO EntertainmentApp VALUES(098,'android','helpg','playing');
INSERT INTO EntertainmentApp VALUES(099,'android','helpg','playing');


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

-- insert into EntertainmentAppID table 
INSERT INTO EntertainmentAppID VALUES(090,146);
INSERT INTO EntertainmentAppID VALUES(091,145);
INSERT INTO EntertainmentAppID VALUES(092,147);
INSERT INTO EntertainmentAppID VALUES(093,140);
INSERT INTO EntertainmentAppID VALUES(094,149);
INSERT INTO EntertainmentAppID VALUES(095,141);
INSERT INTO EntertainmentAppID VALUES(096,142);
INSERT INTO EntertainmentAppID VALUES(097,143);
INSERT INTO EntertainmentAppID VALUES(098,148);
INSERT INTO EntertainmentAppID VALUES(099,148);


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

-- insert into FlightWifi table 
INSERT INTO FlightWifi VALUES(080,126,'Cisco','gftfguhu');
INSERT INTO FlightWifi VALUES(081,125,'Cisco','oipjopkj');
INSERT INTO FlightWifi VALUES(082,127,'Cisco','gftfguhu');
INSERT INTO FlightWifi VALUES(083,120,'Cisco','giojiojopkp');
INSERT INTO FlightWifi VALUES(084,128,'Telkom','jhoihui');
INSERT INTO FlightWifi VALUES(085,121,'Telkom','gftfguhu');
INSERT INTO FlightWifi VALUES(086,122,'Telkom','gpojopkhp');
INSERT INTO FlightWifi VALUES(087,123,'Airtel','giojpojp');
INSERT INTO FlightWifi VALUES(088,128,'Airtel','giojpojp');
INSERT INTO FlightWifi VALUES(089,128,'Airtel','gftfguhu');


CREATE TABLE LiveFlightMovement(
  LiveFlightMovementID INT NOT NULL,
  FlightID INT NOT NULL,
  Timestamps char(15)  NOT NULL,
  Latitude float NOT NULL,
  Longitude float NOT NULL,
  HighestTemperature float NOT NULL,
  LowestTemperature float NOT NULL,
  Sunrise char(10) NOT NULL,
  Sunset char(10) NOT NULL,
  PRIMARY KEY (`LiveFlightMovementID`),
  CONSTRAINT `FlightID _LiveFlightMovement_fk`
        FOREIGN KEY `Flight_fk` (`FlightID`) REFERENCES `Flight` (`FlightID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- insert into LiveFlightMovement table 
INSERT INTO LiveFlightMovement VALUES(060,126,23.22,120.8,'13-01-2021',8.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(061,125,44.8,78.9,'13-01-2021',8.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(062,126,23.98,8.90,'13-01-2021',8.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(063,120,78.99,78.32,'13-01-2021',10.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(062,126,78.33,45.89,'13-01-2021',22.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(065,121,3.22,23.67,'13-01-2021',10.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(066,122,21.09,34.52,'13-01-2021',10.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(067,123,89.27,45.23,'13-01-2021',10.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(068,126,9.87,13.56,'13-01-2021',11.0,34.0,'east','west');
INSERT INTO LiveFlightMovement VALUES(069,128,82.00,23.22,'13-01-2021',10.0,34.0,'east','west');

CREATE TABLE Restroom(
  RestroomID INT NOT NULL,
  FlightID INT NOT NULL,
  Location char(30) NOT NULL,
  Availability char(30) NOT NULL,
  Timestamps  char(30)  NOT NULL,
  RestroomNO INT NOT NULL,
  PRIMARY KEY (`RestroomID`),
  CONSTRAINT `FlightID _Restroom_fk`
        FOREIGN KEY `Flight_fk` (`FlightID`) REFERENCES `Flight` (`FlightID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- insert into Restroom table 

INSERT INTO Restroom VALUES(070,126,'Cisco','weekdays','13-01-2021',8);
INSERT INTO Restroom VALUES(071,125,'Canada','weekdays','13-01-2021',78);
INSERT INTO Restroom VALUES(072,127,'Egypt','weekdays','13-01-2021',23);
INSERT INTO Restroom VALUES(073,120,'Nairobi','weekends','13-01-2021',12);
INSERT INTO Restroom VALUES(072,127,'Uk','weekends','13-01-2021',22);
INSERT INTO Restroom VALUES(075,121,'Mexico','weekends','13-01-2021',34);
INSERT INTO Restroom VALUES(076,122,'Asia','weekdays','13-01-2021',54);
INSERT INTO Restroom VALUES(077,123,'India','weekdays','13-01-2021',56);
INSERT INTO Restroom VALUES(078,127,'Cairo','weekdays','13-01-2021',76);
INSERT INTO Restroom VALUES(079,128,'Nigeria','weekends','13-01-2021',98);

CREATE TABLE Airport(
  AirportID INT NOT NULL,
  AirportName char(30) NOT NULL,
  Country char(30) NOT NULL,
  City char(30) NOT NULL,
  State char(30) NOT NULL,
  Zip char(30) NOT NULL,
  PRIMARY KEY (`AirportID`)
);

-- insert into Airport table
INSERT INTO Airport VALUES(060,'Thiomi', 'UK','Egpyt','10101','10101');
INSERT INTO Airport VALUES(061,'Wilson', 'uK','Egpyt','10101','20101');
INSERT INTO Airport VALUES(062,'Kenyatta', 'Kenya','Egpyt','10101','30101');
INSERT INTO Airport VALUES(063,'Uk', 'Kenya','Egpyt','10101','40101');
INSERT INTO Airport VALUES(064,'Ciro', 'Egypt','Egpyt','10101','50101');
INSERT INTO Airport VALUES(065,'Thiomi', 'Egypt','Egpyt','10101','60101');
INSERT INTO Airport VALUES(066,'Thiomi', 'Cote','Nigeria','10101','70101');
INSERT INTO Airport VALUES(067,'Wilson', 'Cape town','South Africa','10101','80101');
INSERT INTO Airport VALUES(068,'Mark', 'Sahayog','India','10101','50101');
INSERT INTO Airport VALUES(069,'Mark', 'Mexico','Mexico','10101','90101');


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

-- insert into SchedAirport table
INSERT INTO SchedAirport VALUES(060,130, 'UK');
INSERT INTO SchedAirport VALUES(061,139, 'uK');
INSERT INTO SchedAirport VALUES(062,138, 'Kenya');
INSERT INTO SchedAirport VALUES(063,135, 'Kenya');
INSERT INTO SchedAirport VALUES(064,136, 'Egypt');
INSERT INTO SchedAirport VALUES(065,134, 'Egypt');
INSERT INTO SchedAirport VALUES(066,132, 'Cote');
INSERT INTO SchedAirport VALUES(067,133, 'Cape town');
INSERT INTO SchedAirport VALUES(068,137, 'Sahayog');
INSERT INTO SchedAirport VALUES(069,131, 'Mexico');

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

-- insert into ServicesAtAirport table
INSERT INTO ServicesAtAirport VALUES(050,060,'ferrying','transportation','908-789-6578','weekdays', 'UK');
INSERT INTO ServicesAtAirport VALUES(051,069,'ferrying','transportation', '768-789-6578','weekdays', 'uK');
INSERT INTO ServicesAtAirport VALUES(052,068,'ferrying', 'transportation','345-789-6578','weekdays', 'Kenya');
INSERT INTO ServicesAtAirport VALUES(053,065,'ferrying','transportation','123-789-6578','weekdays', 'Kenya');
INSERT INTO ServicesAtAirport VALUES(054,065,'ferrying', 'transportation','542-789-6578','weekends', 'Egypt');
INSERT INTO ServicesAtAirport VALUES(055,060,'ferrying','transportation','809-789-6578', 'weekends', 'Egypt');
INSERT INTO ServicesAtAirport VALUES(056,060, 'ferrying','transportation','564-789-6578','weekends', 'Cote');
INSERT INTO ServicesAtAirport VALUES(057,069,'ferrying', 'transportation','786-789-6578','weekdays', 'Cape town');
INSERT INTO ServicesAtAirport VALUES(058,067, 'ferrying','transportation','435-789-6578','weekdays', 'Sahayog');
INSERT INTO ServicesAtAirport VALUES(059,067, 'ferrying','transportation','324-789-6578','weekdays', 'Mexico');


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

-- insert into AirportServices table
INSERT INTO AirportServices VALUES(050,060);
INSERT INTO AirportServices VALUES(051,069);
INSERT INTO AirportServices VALUES(052,068);
INSERT INTO AirportServices VALUES(053,065);
INSERT INTO AirportServices VALUES(054,065);
INSERT INTO AirportServices VALUES(055,060);
INSERT INTO AirportServices VALUES(056,060);
INSERT INTO AirportServices VALUES(057,069);
INSERT INTO AirportServices VALUES(058,067);
INSERT INTO AirportServices VALUES(059,067);

CREATE TABLE Staff(
  StaffID INT NOT NULL,
  FullName char(30) NOT NULL,
  LastName char(30) NOT NULL,
  Designation char(30) NOT NULL,
  Airline char(30) NOT NULL,
  PRIMARY KEY (`StaffID`)
);

-- insert into Staff table
INSERT INTO Staff VALUES(050,"John mark",'mark','ji','Ket');
INSERT INTO Staff VALUES(051,'Jennifer kim','kim','ji','Ket');
INSERT INTO Staff VALUES(052,'Caren nyam','nyam','ji','Ket');
INSERT INTO Staff VALUES(053,'Joe smith','smith','ji','Ket');
INSERT INTO Staff VALUES(054,'John smith','smith','ji','Ket');
INSERT INTO Staff VALUES(055,'Bony wayne','smith','ji','Ket');
INSERT INTO Staff VALUES(056,'Look man','smith','ji','Ket');
INSERT INTO Staff VALUES(057,'Willys mark','smith','ji','Ket');
INSERT INTO Staff VALUES(058,'Kelvin solid','smith','ji','Ket');
INSERT INTO Staff VALUES(059,'Wayne mark','smith','ji','Ket');

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

-- insert into ScheduleStaff table
INSERT INTO ScheduleStaff VALUES(050,130);
INSERT INTO ScheduleStaff VALUES(051, 131);
INSERT INTO ScheduleStaff VALUES(052,133);
INSERT INTO ScheduleStaff VALUES(053,132);
INSERT INTO ScheduleStaff VALUES(054,134);
INSERT INTO ScheduleStaff VALUES(055,135);
INSERT INTO ScheduleStaff VALUES(056,137);
INSERT INTO ScheduleStaff VALUES(057,138);
INSERT INTO ScheduleStaff VALUES(058,139);
INSERT INTO ScheduleStaff VALUES(059,136);

       

 
