#create db
create database School_db;
use School_db;
create table Student(Roll_No int,Full_name varchar(30), Marks int,Grade varchar(10));
desc Student;
select* from Student;
#Add column Contact
Alter table Student add Contact char(15);
insert into Student values(1,"rari","87","A","9999999999");
insert into Student values(2,"manu","83","A","9999999998");
insert into Student values(3,"raji","97","A","9999999988");
insert into Student values(4,"hari","67","c","9999999888");
insert into Student values(5,"rari","57","d","9999999998");
insert into Student values(6,"rari","87","A","9999999999");
insert into Student values(7,"rari","77","b","9999999999");
insert into Student values(8,"rari","87","A","9999998999");
insert into Student values(9,"rari","87","A","9999999999");
insert into Student values(10,"rama","97","A","9999999999");
insert into Student values(11,"jari","87","A","9999999999");
insert into Student values(12,"nari","87","A","9999999999");
#Remove column named contact
Alter table Student drop Grade;
#rename table to classten
rename table Student to Classten;
#Remove all rows from the table
truncate Student;
select * from Student;
#Remove the table from the database
drop table Student;
