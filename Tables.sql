USE Hospital
GO

drop table Doctor;
drop table Patient;
drop table Lab;
drop table Room;
drop table InPatient;
drop table OutPatient;
drop table Bill;


CREATE TABLE Doctor
(
        DoctorID varchar(10) NOT NULL,
	Name varchar(50) NOT NULL ,
	Age int,
	Gender varchar(50) NOT NULL ,
	Address varchar(50) NOT NULL ,
	PRIMARY KEY (DoctorID),
);



CREATE TABLE Patient
(
    PatientID varchar(10) NOT NULL,
	Name varchar(50) NOT NULL ,
	Age int,
	Gender varchar(50) NOT NULL ,
	Address varchar(50) NOT NULL ,
	Disease varchar(50) NOT NULL ,
	DoctorID varchar(10) NOT NULL,
	PRIMARY KEY (PatientID),
	FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
);

CREATE TABLE Lab
(
        LabNumber varchar(10) NOT NULL,
	PatientID varchar(10) NOT NULL,
	DoctorID varchar(10) NOT NULL,
	Amount int,
	Date datetime NOT NULL, 
	PRIMARY KEY (LabNumber),
	FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
	FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
);

CREATE TABLE Room
(
	RoomNumner varchar(50) NOT NULL,
	RoomType varchar(50) NOT NULL,
	Status varchar(20) NOT NULL,
	PRIMARY KEY (RoomNumner),
	
);


CREATE TABLE InPatient
(
	PatientID varchar(10) NOT NULL,
	RoomNumber varchar(50) NOT NULL,
	DateOfAdm datetime NOT NULL, 
	DateOfDis datetime NOT NULL,
	LabNumber varchar(10) NOT NULL,
	PRIMARY KEY (PatientID),
	FOREIGN KEY (LabNumber) REFERENCES Lab(LabNumber),
	FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
	
);

CREATE TABLE OutPatient
(
	PatientID varchar(10) NOT NULL,
	Date datetime NOT NULL, 
	LabNumber varchar(10) NOT NULL,
	PRIMARY KEY (PatientID),
	FOREIGN KEY (LabNumber) REFERENCES Lab(LabNumber),
	
);

CREATE TABLE Bill
(
	BillNumber int,
	PatientID varchar(10) NOT NULL,
	DoctorCharge int,
	RoomCharge int,
	LabCharge int,
	NumberOfDays int,
	PRIMARY KEY (BillNumber),
	FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
	
);

create TABLE myLogin
(
inserttime datetime,
roll varchar(20),
);


create TABLE myupdate
(
inserttime datetime,
roll varchar(20),
);

create TABLE mydelete
(
inserttime datetime,
roll varchar(20),
);