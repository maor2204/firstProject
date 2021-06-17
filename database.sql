Create database dt1;
Use dt1
Create table tbdb6( 
fname varchar(300), 
lname varchar(300), 
e_mail varchar(700), 
day int,
month int,
year int,
age int,
gender varchar(6), 
password varchar(100),
yot varchar(10),
admin varchar(3));
insert into tbdb6 values ('maor','bar','maorbar2204@gmail.com',2,2,2004,16,'male','maor2204','1','YES');
insert into tbdb6 values ('daniel','samoch','daniel@gmail.com',1,1,2004,16,'male','1234567','1','YES');
insert into tbdb6 values ('adar','bar','ab@gmail.com',17,2,1972,48,'female','12345678','1','NO');
insert into tbdb6 values ('dan','bar','db@gmail.com',22,6,1971,48,'male','1234567db','1','NO');
insert into tbdb6 values ('shahaf','bar','sb@gmail.com',8,3,1998,22,'female','1234567sb','1','NO');
insert into tbdb6 values ('berto','polity','bp@gmail.com',5,1,1943,77,'male','1234567bp','1','NO');