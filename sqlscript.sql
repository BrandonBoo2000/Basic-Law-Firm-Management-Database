REM   Script: Law Firm Management
REM   Hi

create table Client( 
    Client_id number not null constraint client_pk primary key, 
    Client_name varchar2(50) not null, 
    Client_ic number not null, 
    Client_home_address varchar2(200) not null, 
    Client_contact number not null, 
    Client_email varchar2(100) not null 
);

create table Employee( 
    Employee_id number not null constraint employee_pk primary key, 
    Employee_name varchar2(50) not null, 
    Employee_ic number not null, 
    Employee_home_address varchar2(200) not null, 
    Employee_contact number not null, 
    Employee_email varchar2(100) not null, 
    Employee_salary number not null ,
    Employee_position varchar2(50) not null
);

create table Legal_Research( 
    Reference_id number not null constraint legal_research_pk primary key, 
    Reference_name varchar2(100) not null, 
    Reference_date varchar2(30) not null 
);

create table Case( 
    Case_id number not null constraint case_pk primary key, 
    Client_id number not null, 
    foreign key (Client_id) references Client(Client_id) 
);

create table PDPN( 
    Pdpn_id number not null constraint pdpn_pk primary key, 
    Case_id number not null, 
    foreign key (Case_id) references Case(Case_id) 
);

create table Case_Description( 
    Case_id number not null constraint case_description_pk primary key, 
    Case_type varchar(20) not null, 
    Case_desc varchar2(500) not null, 
    foreign key (Case_id) references Case(Case_id) 
);

create table Case_Supporting_File( 
    Doc_id number not null constraint case_supporting_file_pk primary key, 
    Case_id number not null, 
    Doc_type varchar2(25) not null, 
    Doc_status varchar2(25) not null, 
    foreign key (Case_id) references Case(Case_id) 
);

create table LIC( 
    Case_id number not null constraint lic_pk primary key, 
    Employee_id number not null, 
    foreign key (Case_id) references Case(Case_id), 
    foreign key (Employee_id) references Employee(Employee_id) 
);

create table case_activity_log( 
    Meet_id number not null constraint case_activity_log_pk primary key, 
    Case_id number not null, 
    Meet_date date not null, 
    Meet_time varchar2(20) not null, 
    Meet_venue varchar2(50) not null, 
    foreign key (Case_id) references LIC(Case_id) 
);

create table Invoice( 
    Invoice_no number not null constraint invoice_pk primary key, 
    Employee_id number not null, 
    Case_id number not null, 
    Invoice_date date not null, 
    Amount number not null, 
    foreign key (Employee_id) references Employee(Employee_id), 
    foreign key (Case_id) references Case(Case_id) 
);

create table Receipt( 
    Receipt_no number not null constraint receipt_pk primary key, 
    Employee_id number not null, 
    Case_id number not null, 
    Receipt_date date not null, 
    Amount number not null, 
    foreign key (Employee_id) references Employee(Employee_id), 
    foreign key (Case_id) references Case(Case_id) 
);

create table Account( 
    Employee_id number not null constraint account_pk primary key, 
    Bank_acc number not null, 
    Bank_name varchar2(100) not null, 
    foreign key (Employee_id) references Employee(Employee_id) 
);

create table Case_Research(
    Case_id number not null references Case_Description(Case_id),
    Reference_id number not null references Legal_Research(Reference_id),
    primary key(Case_id,Reference_id)
);


-- Insert Data
/* CLIENT */
INSERT INTO Client 
VALUES (0001,'Malik',940825013425,'22 Jln Nipah 14 Taman Daya,81100,JB,Johor',60153326545, 'malik@gmail.com'); 

INSERT INTO Client 
VALUES (0002,'Chong',910304105327,'8 Jln Hulu Batu 7 Hulu Ampang,68000, Klang, Selangor',60163387676, 'chong91@gmail.com'); 

INSERT INTO Client 
VALUES (0003,'Sarah',911229086124,'No. 71 Jalan Pasar,3000,Ipoh,Perak',60139945734, 'sarah@gmail.com'); 

INSERT INTO Client 
VALUES (0004,'Joseph',930527052114,' No. 351 Taman Yoon Fook,70450,Seremban,Negeri Sembilan',60199597732, 'joseph46@gmail.com'); 

INSERT INTO Client 
VALUES (0005,'Raju',950212135227,'Jalan Haji Taha,93400,Kuching,Sarawak',60187756242, 'raju@gmail.com'); 

/* EMPLOYEE*/
insert into employee
values (0010,'Natasha',890424114552,'No 15,Taman Permint,23000,Dungun,Teregganu',60123654472,'natasha@gmail.com',8000,'lawyer');

insert into employee
values (0011,'Mark',850721106377,'70 Jln Ss15/4B Ss15 Petaling Jaya,47500,Petaling Jaya,Selangor',60199547768,'mark@gmail.com',10000,'lawyer');

insert into employee 
values (0012,'Zhang Chen',930823072735,'155 Lbh Carnarvon Georgetown,10100,Gerogetown,Penang',60137988246,'zhangchen@gmail.com',7800,'lawyer');

insert into employee 
values (0013,'Alia',880406102464,'Taipan, Usj,47620,Subang Jaya,Selangor',60158334956,'aliazahirah@gmail.com',6000,'clerk');

insert into employee 
values (0014,'Raj Kumar',940128129223,'Plaza Kingfisher, Kuala Inanam,88450,KK,Sabah',60139348852,'rajkumar@gmail.com',5000,'admin');

/* LEGAL_RESEARCH */
insert into legal_research
values (0001,'Introduction to Basic Legal Citation','2020-01-20');

insert into legal_research
values (0002,'Legal Research Methods: Principles and Practicalities','2020-02-15');

insert into legal_research
values (0003,'Legal Analysis: The Fundamental Skill','2020-02-22');

insert into legal_research
values (0004,'Fundamentals of legal research','2020-06-16');

insert into legal_research
values (0005,'Finding the Law Bob Berring','2020-09-13');


/* CASE */
insert into Case
values (0020,0001);

insert into Case
values (0021,0002);

insert into Case
values (0022,0003);

insert into Case
values (0023,0004);

insert into Case
values (0024,0005);

insert into Case
values (0025,0003);

insert into Case
values (0026,0004);

insert into Case
values (0027,0005);

insert into Case
values (0028,0005);


/* PDPN */
insert into pdpn
values (1001,20);

insert into pdpn
values (1002,21);

insert into pdpn
values (1003,22);

insert into pdpn
values (1004,23);

insert into pdpn
values (1005,24);

insert into pdpn
values (1006,25);

insert into pdpn
values (1007,26);

insert into pdpn
values (1008,27);

insert into pdpn
values (1009,28);

/* CASE_DESCRIPTION */
insert into Case_Description
values(20,'criminal','A 41-year-old man has been detained in connection with the murder of a man in front of a shop at a public housing project in Cheras.');

insert into Case_Description
values(21,'family','Her husband took a mistress and lived with her in Singapore.He then resign his old membership in Selangor and became a member of club in Singapore.Her family was neglected');

insert into Case_Description
values(22,'animal rights','The pregnant cat was stuffed into the dryer by three men who then switched on the machine before leaving the cat to die in the machine.The cat was found with severe burns on its body.');

insert into Case_Description
values(23,'child abuse','Death of 15-month-old baby, who was allegedly beaten to death by his mother’s boyfriend.');

insert into Case_Description
values(24,'bribe','A housewife conspiring with her husband in a bribery case involving RM1 million.');

insert into Case_Description
values(25,'drunken driving','An allegedly drunk 64-year-old motorist arrested for trying to mow down a policeman at a road block near Queensbay Mall');

insert into Case_Description
values(26,'sexual assault','Rape a girl under 16 years of age without her consent');

insert into Case_Description
values(27,'drunken driving','An allegedly drunk motorist rear-ended the patrol car of policemen attending to a road accident scene');

insert into Case_Description
values(28,'child abuse','A nine-month-old toddler, who was in critical condition after being allegedly abused by his babysitter, died at the Sibu Hospital on Sunday.');

/* CASE_SUPPORTING_FILE */
insert into Case_Supporting_File
values(21,20,'Instrument','Approved');

insert into Case_Supporting_File
values(22,20,'Pleading','In Progress');

insert into Case_Supporting_File
values(23,21,'Instrument','In Progress');

insert into Case_Supporting_File
values(24,22,'Contract','Approved');

insert into Case_Supporting_File
values(25,23,'Will','In Progress');

insert into Case_Supporting_File
values(26,24,'Contract','Approved');

insert into Case_Supporting_File
values(27,24,'Pleading','Approved');

insert into Case_Supporting_File
values(28,25,'Instrument','In Progress');

insert into Case_Supporting_File
values(29,26,'Will','In Progress');

insert into Case_Supporting_File
values(30,27,'Contract','Approved');

insert into Case_Supporting_File
values(31,28,'Contract','Approved');

/* LIC */
insert into LIC
values(0020,0010);

insert into LIC
values(0021,0011);

insert into LIC
values(0022,0011);

insert into LIC
values(0023,0012);

insert into LIC
values(0024,0010);

insert into LIC
values(0025,0011);

insert into LIC
values(0026,0011);

insert into LIC
values(0027,0010);

insert into LIC
values(0028,0012);

/* CASE_ACTIVITY_LOG */
insert into case_activity_log
values(2001,0020,date'2020-02-15','8.00 AM','Room 2');

insert into case_activity_log
values(2002,0021,date'2020-03-24','9.30 AM','Room 3');

insert into case_activity_log
values(2003,0022,date'2020-04-16','10.00 AM','Room 3');

insert into case_activity_log
values(2004,0023,date'2020-07-07','10.00 AM','Room 2');

insert into case_activity_log
values(2005,0024,date'2020-08-23','2.00 PM','Room 4');

insert into case_activity_log
values(2006,0025,date'2020-09-26','2.30 PM','Room 5');

insert into case_activity_log
values(2007,0026,date'2020-09-29','3.00 PM','Room 4');

insert into case_activity_log
values(2008,0027,date'2020-10-18','3.30 PM','Room 4');

insert into case_activity_log
values(2009,0027,date'2020-11-24','4.00 PM','Room 5');

/* INVOICE */
insert into Invoice
values(0001,0013,0020,date'2020-03-10',10000);

insert into Invoice
values(0002,0013,0021,date'2020-03-19',14000);

insert into Invoice
values(0003,0013,0022,date'2020-04-02',19000);

insert into Invoice
values(0004,0014,0023,date'2020-06-01',20000);

insert into Invoice
values(0005,0014,0024,date'2020-08-11',20000);

insert into Invoice
values(0006,0013,0025,date'2020-09-12',21000);

insert into Invoice
values(0007,0014,0026,date'2020-09-24',30000);

insert into Invoice
values(0008,0014,0027,date'2020-12-21',32000);

insert into Invoice
values(0009,0014,0028,date'2020-12-24',36000);

/* RECEIPT */
insert into Receipt
values(0001,0013,0020,date'2020-03-25',10000);

insert into Receipt
values(0002,0013,0021,date'2020-03-25',14000);

insert into Receipt
values(0003,0013,0022,date'2020-04-14',19000);

insert into Receipt
values(0004,0014,0023,date'2020-06-08',20000);

insert into Receipt
values(0005,0014,0024,date'2020-08-15',20000);

insert into Receipt
values(0006,0013,0025,date'2020-09-19',21000);

insert into Receipt
values(0007,0014,0026,date'2020-09-27',30000);

insert into Receipt
values(0008,0014,0027,date'2020-12-26',32000);

insert into Receipt
values(0009,0014,0028,date'2020-12-30',36000);

/* ACCOUNT */
insert into Account
values(0010,16338245,'Maybank');

insert into Account
values(0011,16392458,'Maybank');

insert into Account
values(0012,16338245,'CIMB');

insert into Account
values(0013,16338245,'CIMB');

insert into Account
values(0014,16338245,'RHB');


/* CASE_RESEARCH */
insert into Case_Research
values(0020,0001);

insert into Case_Research
values(0021,0001);

insert into Case_Research
values(0022,0002);

insert into Case_Research
values(0023,0003);

insert into Case_Research
values(0024,0003);

insert into Case_Research
values(0025,0004);

insert into Case_Research
values(0026,0004);

insert into Case_Research
values(0027,0004);

insert into Case_Research
values(0028,0005);


-- Display Table
SELECT * FROM Client;
select * from employee;
select * from legal_research;
select * from case;
select * from pdpn;
select * from case_description;
select * from Case_Supporting_File;
select * from LIC;
select * from case_activity_log;
select * from Invoice;
select * from Receipt;
select * from Account;
select * from Case_Research;


-- Query
/*To Get Client's detail and his/her cases(Client_id:0005)*/
select * from Case inner join Client using(CLient_id) where Client_id = 0005 order by case_id;

/*Detail of case*/
select * from Pdpn inner join Case using(Case_id) inner join Case_description using(Case_id) inner join LIC using(Case_id) order by Case_id;

/*To get Lawyer detail and his/her in charge cases*/
select * from LIC inner join Case using(Case_id) inner join Employee using(Employee_id) where Employee_id=0011 order by Case_id;

/*To know meet detail of client and lawyer in charge*/
select * from LIC inner join Case using(Case_id) inner join case_activity_log using(Case_id) inner join Case_Supporting_File using(Case_id) where Doc_status = 'In Progress' order by Meet_date;

/*Bank acc and salary of the employee */
Select Employee_name, Employee_salary, Employee_email,Bank_acc, Bank_name from Employee inner join Account on Account.Employee_id = Employee.Employee_id;


