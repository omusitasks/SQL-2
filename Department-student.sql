create database project;
-- drop database project
use project;

CREATE TABLE DEPARTMENT

(DEPTid int,

DNAME varchar(100),

LOCATION varchar(100),

 

CONSTRAINT DEPARTMENT_DEPTID_pk PRIMARY KEY (DEPTid));

CREATE TABLE STUDENT

(snum int,

sname varchar(12),

MAJOR varchar(12),

DEPT_ID int,

slevel varchar(12),

AGE int,

CONSTRAINT STUDENT_SNUM_pk PRIMARY KEY (SNUM),

FOREIGN KEY (DEPT_ID)
        REFERENCES DEPARTMENT(DEPTid)
        ON DELETE CASCADE

);

--

CREATE TABLE CLASS

(CNAME varchar(12),

MEETS_AT time,

ROOM varchar(10),

FID int,

CONSTRAINT CLASS_CNAME_pk PRIMARY KEY (CNAME));

--

 

CREATE TABLE ENROLLED

(SNUM int,

CNAME varchar(12));

--

CREATE TABLE FACULTY

(FID int,

FNAME varchar(40),

DEPT_ID int,

CONSTRAINT FACULTY_FID_pk PRIMARY KEY (FID));

--


insert into  DEPARTMENT values (1,'Computer Sciences','West Lafayette');

insert into  DEPARTMENT values (2,'Management','West Lafayette');

insert into  DEPARTMENT values (3,'Medical Education','Purdue Calumet');

insert into  DEPARTMENT values (4,'Education','Purdue North Central');

insert into  DEPARTMENT values (5,'Pharmacal Sciences','Indianapolis');







insert into  STUDENT values (0418,'S.Jack','Math',2,'SO',17);

insert into  STUDENT values (0671,'A.Smith','English',2,'FR',20);

insert into  STUDENT values (1234,'T.Banks','ME',3,'SR',19);

insert into  STUDENT values (3726,'M.Lee','Physics',4,'SO',21);

insert into  STUDENT values (4829,'J.Bale','Chemistry',5,'JR',22);

insert into  STUDENT values (5765,'L.Lim','CS',1,'SR',19);

insert into  STUDENT values (0019,'D.Sharon','History', 4,'FR',20);

insert into  STUDENT values (7357,'G.Johnson','Math', 4,'JR',19);

insert into  STUDENT values (8016,'E.Cho','History',2,'JR',19);



 

insert into  FACULTY values (101,'S.Layton',4);

insert into  FACULTY values (102,'B.Jungles',1);

insert into  FACULTY values (103,'N.Guzaldo',3);

insert into  FACULTY values (104,'S.Boling',2);

insert into  FACULTY values (105,'G.Mason',1);

insert into  FACULTY values (106,'S.Zwink',2);

insert into  FACULTY values (107,'Y.Walton',1);

insert into  FACULTY values (108,'I.Teach',2);

insert into  FACULTY values (109,'C.Jason',3);


 

insert into  CLASS values ('ENG400',cast('08:30' as time),'U003',107);

insert into  CLASS values ('ENG320', cast('09:30' as time),'R128',107);

insert into  CLASS values ('COM100', cast('11:30' as time),'L108',107);

insert into  CLASS values ('ME308', cast('10:30' as time),'R128',109);

insert into  CLASS values ('CS448', cast('09:30' as time),'U003',106);

insert into  CLASS values ('HIS210', cast('01:30' as time),'L108',104);

insert into  CLASS values ('MATH275', cast('02:30' as time),'L108',108);

insert into  CLASS values ('STAT110', cast('04:30' as time),'R128',108);

insert into  CLASS values ('PHYS100', cast('04:30' as time),'U003',105);


 

insert into  ENROLLED values (1234,'ENG400');

insert into  ENROLLED values (8016,'ENG400');

insert into  ENROLLED values (0418,'CS448');

insert into  ENROLLED values (1234,'COM100');

insert into  ENROLLED values (0671,'ENG400');

insert into  ENROLLED values (1234,'HIS210');

insert into  ENROLLED values (3726,'MATH275');

insert into  ENROLLED values (5765,'PHYS100');