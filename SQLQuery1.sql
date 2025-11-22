use QR_Code;
Go

create table Students
(
UNI_ID varchar(12) not null ,
PASS varchar(50) not null,
Full_Name varchar(30) not null ,
Phone_Number varchar(15)   , 
email varchar(35) not null,
Address varchar(50) not null,
Branch varchar(30) not null

constraint students_pk primary key (UNI_ID),
constraint students_Phone_Number_unique unique (Phone_Number),
constraint students_email_unique unique (email)

);

create table UNI_Doctors
(
ID_DR int not null identity(1,1) ,
Full_Name varchar(30) not null ,
Specialization varchar(30) not null ,
Phone_Number varchar(15) , 
email varchar(35) not null,
Address varchar(50) not null,

constraint UNI_Doctors_pk primary key (ID_DR),
constraint UNI_Doctors_Phone_Number_unique unique (Phone_Number),
constraint UNI_Doctors_email_unique unique (email)

);


create table Courses
(
ID_course int not null identity(1,1),
Cours_Name varchar(50) not null,
Symbol_course varchar(6) not null,
Credt_Hour int ,
Absence_point int,
Courses_type varchar(3) NOT NULL,

constraint Courses_pk primary key (ID_course),
CONSTRAINT Courses_type_chk CHECK (Courses_type IN ('T','P','T,P'))

);

create table Dean_of_colleges_Admin
(
ID int not null identity(1,1) ,
Full_Name varchar(30) not null ,
Specialization varchar(30) not null ,
Phone_Number varchar(15)   , 
email varchar(35) not null,
Address varchar(50) not null,

constraint Dean_of_colleges_Admin_pk primary key (ID),
constraint Dean_of_colleges_Admin_Phone_Number_unique unique (Phone_Number),
constraint Dean_of_colleges_Admin_email_unique unique (email)

);

create table coordinators_Sub_Admin
(
ID int not null identity(1,1) ,
Full_Name varchar(30) not null ,
Specialization varchar(30) not null ,
Phone_Number varchar(15)   , 
email varchar(35) not null,
Address varchar(50) not null,

constraint coordinators_Sub_Admin_pk primary key (ID),
constraint coordinators_Sub_Admin_Phone_Number_unique unique (Phone_Number),
constraint coordinators_Sub_Admin_email_unique unique (email)

);



create table Lecture_Time
(
Lecture_ID int not null identity(1,1), 
ID_course int not null,
ID_DR int not null,
Lecture_Date date,
Start_Time time,
End_Time time ,

constraint Lecture_Time_pk primary key (Lecture_ID),

constraint Lecture_course_FK foreign key (ID_course)
references Courses(ID_course),

CONSTRAINT cuorse_DR_fk foreign key (ID_DR)
references UNI_Doctors (ID_DR),

constraint Lecture_Time_unique unique (Lecture_Date, Start_Time, ID_course, ID_DR)


);
create table Name_Student_Cours 
(
UNI_ID varchar(12) not null ,
ID_course int not null,

constraint Student_Courses_pk primary key (UNI_ID, ID_course),

constraint UNI_ID_FK foreign key (UNI_ID)
references Students (UNI_ID),

constraint ID_course_FK foreign key (ID_course)
references Courses (ID_course)
);

create table Attendees_Name
(

  UNI_ID varchar(12) not null,
  Lecture_ID int not null, 

  constraint Attendees_pk primary key (UNI_ID, Lecture_ID),
  constraint Attendees_student_FK foreign key (UNI_ID)
  references Students(UNI_ID),
  constraint Attendees_lecture_FK foreign key (Lecture_ID)
  references Lecture_Time(Lecture_ID)



);
