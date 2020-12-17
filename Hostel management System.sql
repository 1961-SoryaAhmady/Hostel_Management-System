---Hostel Table creation---
Create table hostel(hostel_id integer primary key,Hostel_name varchar(30),No_of_Rooms integer ,no_of_studnet INT);

---Admin Table Creation---
create table admin(admin_id integer primary key,first_name varchar(20),last_name varchar(20),Mobile_no number(10),hostel_id INT,
FOREIGN KEY (hostel_id)REFERENCES hostel(hostel_id));

---Student Table creation---
create table student(student_id INT primary key,first_name VARCHAR2(20),last_name VARCHAR2(20),Mobile_no number(10),department VARCHAR(20),
year_of_study INT ,hostel_id INT,room_id INT,FOREIGN KEY (hostel_id)REFERENCES hostel(hostel_id),FOREIGN KEY (room_id)REFERENCES room(room_id));

---Room Table Creation---
create table room(room_id INT primary key,hostel_id INT ,FOREIGN KEY (hostel_id)REFERENCES hostel(hostel_id));

---Visitors Table Creation---
create table visitors(visitor_id INT primary key,first_name VARCHAR2(20),last_name VARCHAR2(20),Mobile_no number(10),
in_time TIMESTAMP WITH TIME ZONE ,out_time TIMESTAMP WITH TIME ZONE ,student_id int ,FOREIGN KEY (student_id) REFERENCES student(student_id));

---employee table creation---
create table employee(employee_id INT primary key,first_name VARCHAR(20),last_name VARCHAR(20),mobile_no NUMBER(10));

---Mess details creation---
create table mess_details(amount INT,date_of_payment DATE,student_id INT,FOREIGN KEY (student_id) REFERENCES student(student_id));

---Fees details creation---
create table fees_details(amount INT,date_of_payment DATE,student_id INT,FOREIGN KEY (student_id) REFERENCES student(student_id));

---in/out details---
create table in_out(in_time TIMESTAMP WITH TIME ZONE,out_time TIMESTAMP WITH TIME ZONE, student_id INT,FOREIGN KEY (student_id) REFERENCES student(student_id));

 