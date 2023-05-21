Create database HOSPITAL;
use  HOSPITAL;

CREATE TABLE BRANCH(
BRANCH_ID INT NOT NULL,
BRANCH_NAME VARCHAR(50) NOT NULL,
ADDRESS VARCHAR(50) NOT NULL,
CONTACT_NO INT NOT NULL ,
TOTAL_STAFF INT ,
AVAILABLE_BEDS INT,
OCCUPIED_BEDS INT,
PRIMARY KEY(BRANCH_ID),
UNIQUE (CONTACT_NO,ADDRESS)
);

create table staff(
staff_id INT NOT NULL,
staff_name varchar(20) NOT NULL,
salary INT NOT NULL,
contact_no INT NOT NULL,
occupation varchar(20) NOT NULL,
branch_id INT NOT NULL,
primary key(staff_id),
foreign key(branch_id) references BRANCH(branch_id)
);

create table doctor(
staff_id INT NOT NULL,
doc_name VARCHAR(20) NOT NULL,
qualication VARCHAR(20) NoT NULL,
salary INT NOT NULL,
department varchar(20) NOT NULL,
contact_no INT NOT NULL,
branch_id INT NOT NULL,
PRIMARY KEY(staff_id),
UNIQUE(contact_no),
FOREIGN KEY(staff_id) REFERENCES staff(staff_id) on delete cascade
);

CREATE TABLE PATIENTS(
PATIENT_ID INT NOT NULL,
ROOM_NO INT ,
PATIENT_NAME VARCHAR(20) NOT NULL,
PATIENT_CONTACT_NO INT NOT NULL,
AGE INT NOT NULL,
DISEASE VARCHAR(10) NOT NULL,
DOC_ID INT NOT NULL,
BRANCH_ID INT NOT NULL,
PRIMARY KEY(PATIENT_ID),
UNIQUE(PATIENT_CONTACT_NO),
FOREIGN KEY(BRANCH_ID) REFERENCES BRANCH(BRANCH_ID),
FOREIGN KEY(DOC_ID) REFERENCES DOCTOR(STAFF_ID)
);

CREATE TABLE MEDICINE(
MEDNAME VARCHAR(10) NOT NULL,
USE_BY_DATE DATE NOT NULL,
DOSAGE VARCHAR(10) NOT NULL,
PRICE INT NOT NULL,
REFFERED_TO INT NOT NULL,
PRIMARY KEY(MEDNAME,REFFERED_TO),
FOREIGN KEY(REFFERED_TO) REFERENCES PATIENTS(PATIENT_ID)
);

create table tests(
type_of_test VARCHAR(20),
reffered_to INT NOT NULL,
price INT,
report_date date NOT NULL,
primary key(type_of_test,reffered_to),
foreign key(reffered_to) references patients(patient_id) on delete cascade
);
INSERT INTO BRANCH values(1254,"Aster DM Healthcare","147-g,M Paramanand Marg, Girgaon",1048864340,17,66,23);
INSERT INTO BRANCH values(1228,"Care Hospitals","2/34, Double Storey,Jangpura Extn",1062682735,37,87,43);
INSERT INTO BRANCH values(1694,"Command Hospital","288 Abdul Rehman Street",1050136959,101,32,17);
INSERT INTO BRANCH values(1344,"Global Hospitals Group","125 New Apollo Estate, Mogra Lane, Andheri (east)",1031258867,67,435,290);
INSERT INTO BRANCH values(1022,"LifeSpring Hospitals","144 145, Main Market, Gurgaon, Gurgaon",1091540067,87,235,210);

INSERT INTO STAFF values(101,"Abhijeet Chandan",92760,79763375,"Doctor",1254);
INSERT INTO STAFF values(102,"Shanti Vasundhara",96830,23564891,"Doctor",1344);
INSERT INTO STAFF values(103,"Sumati Jayanta",69040,45784806,"Patient services",1254);
INSERT INTO STAFF values(104,"Kapil Indra",87000,30834793,"IT",1254);
INSERT INTO STAFF values(105,"Parth Prasanna",69220,80264363,"Patient services",1694);
INSERT INTO STAFF values(106,"Jyotsana Ratna",61180,26082456,"Porters ",1022);
INSERT INTO STAFF values(107,"Bhaskar Kalpana",32980,64209751,"Clinical assistants",1694);
INSERT INTO STAFF values(108,"Navneet Sarika",38190,59769011,"Nurse",1228);
INSERT INTO STAFF values(109,"Mukul Girish",24670,29260000,"Pharmacist",1228);
INSERT INTO STAFF values(110,"Sumeet Rakesh",44780,99851364,"Dietitian",1022);
INSERT INTO STAFF values(111,"Alexander	Foster",91560,49863375,"Doctor",1022);
INSERT INTO STAFF values(112,"Dainton Foster",93890,90564891,"Doctor",1694);
INSERT INTO STAFF values(113,"Melissa Richards",99860,97463375,"Doctor",1694);
INSERT INTO STAFF values(114,"Michelle Andrews",100890,73564891,"Doctor",1228);

select * from MEDICINE;

INSERT INTO DOCTOR values(101,"Abhijeet Chandan","B.SC,M.D",92760,"Anesthetics",79763375,1254);
INSERT INTO DOCTOR values(102,"Shanti Vasundhara","B.SC,M.SC",96830,"Anesthetics",23564891,1344);
INSERT INTO DOCTOR values(111,"Alexander Foster","B.SC,MBBS",91560,"Neurology",49863375,1022);
INSERT INTO DOCTOR values(112,"Dainton Foster","B.SC,M.D",93890,"ENT",90564891,1694);
INSERT INTO DOCTOR values(113,"Melissa Richards","B.SC,M.SC",99860,"Gynecology",97463375,1694);
INSERT INTO DOCTOR values(114,"Michelle Andrews","B.SC,MBBS",100890,"Urology",73564891,1228);

INSERT INTO PATIENTS values(026,207,"Aston Riley",73564999,37,"Infection",112,1694);
INSERT INTO PATIENTS values(039,306,"Frederick Fowler",73765891,52,"BP",111,1022);
INSERT INTO PATIENTS values(069,NULL,"Jared Rogers",73560987,23,"Infection",114,1228);
INSERT INTO PATIENTS values(096,109,"Aldus Harrison",35214891,31,"Infection",112,1694);


INSERT INTO TESTS values("Blood Test",039,500,"2023-01-20");
INSERT INTO TESTS values("X-ray",026,900,"2023-02-22");
INSERT INTO TESTS values("Ultrasound",069,2000,"2023-02-05");

INSERT INTO MEDICINE values("Amoxi","2026-01-22","2/day",800,026);
INSERT INTO MEDICINE values("cipro","2028-08-12","3/week",785,026);
INSERT INTO MEDICINE values("azithromy","2027-09-11","2/day",395,069);
INSERT INTO MEDICINE values("clinda","2029-05-03","1/day",140,096);
