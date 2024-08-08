-- create database Sql_Query;
use sql_query;
drop table student;

create table Student(
	ID varchar(255) primary key,
    Name varchar(255),
    Address varchar(255),
    Gpa double,
    Birth varchar(255)
);

insert into Student values 
	('SV001', 'Nguyen Van Nam', 'Hai Duong', 3.2, '2002-02-10'),
    ('SV002', 'Hoang Dinh Nam', 'Ha Noi', 2.8, '1999-08-08'),
    ('SV003', 'Pham Ngoc Thuan', 'Nam Dinh', 2.2, '1999-12-20'),
    ('SV004', 'Nguyen Duc Xuan', 'Thai Binh', 2.1, '1999-07-18'),
    ('SV005', 'Hoang Van Long', 'Ha Noi', 3.4, '2001-10-10'),
    ('SV006', 'Nguyen Ngoc Long', 'Nam Dinh', 3.1, '2001-12-19'),
    ('SV007', 'Nguyen Thuy Linh', 'Hai Duong', 3.7, '2001-03-03'),
    ('SV008', 'Nguyen Thuy Huong', 'Nghe An', 2.8, '1999-04-20');

#3
select * from student;
#4
select ID, Name, Gpa from student
where Gpa >= 3.2;student
#5 
select * from student
where Address = 'Hai Duong';
#6
select * from student
where Address = 'Nam Dinh' 
and Gpa >= 3.2;
#7
select * from student 
where Gpa <= 3.2
and Gpa >= 2.5;
#8
select * from student
where Name regexp '^[hp]';
-- where Name like 'h%' 
-- or Name like "p%";
#9
select * from student
where Name regexp '[gm]$'
and length(Name) >= 5;

#10
select * from student
where Address = 'Hai Duong' 
or Address = 'Nam Dinh'
and year(Birth) >= 2000;

#11
select * from student
where Lower(Name) regexp '[a-h]'; -- tồn tại

#12
select * from student
order by gpa desc, birth asc;

#13
select distinct address from student;

#14
select * from student
where not regexp_like(address, '[b-d]'); -- không tồn tại 

#15
select * from student
where year(birth) = '2001';

#16
select * from student
where year(birth) = 1999
and name like '%n'
and gpa in (2.1 , 2.2, 2.5, 2.8);

#17
select avg(gpa) as DiemTrungBinh -- count, sum,...
from student;

#18 
select max(gpa) as MaxGpa 
from student;

#19 
select min(gpa) as MinGpa
from student;

#20
select * 
from student
where gpa = (select max(gpa) from student)
order by id;

#21 
select * from student
where gpa = (select min(gpa) from student)
order by id;

#23
select * from student
where length(address) >= 9
order by gpa desc;

#24
select * from student
where gpa > (select avg(gpa) from student)
order by gpa desc;

#25
select * 
from student
where name like '%nh' 
or name like '%an' ;


#26
select * 
from student
where name like 'tra%' 
or name like 'ngu%'
order by name, id; 

#27
select * 
from student
where birth like '1999-07%'
order by id;

#28
select * from student
where birth = (select max(birth) from student)
order by id;

#29
select * from student
where birth = (select min(birth) from student)
order by id;

#31
select * from student
where birth >= '1999-04-28' 
and gpa > (select avg(gpa) from student);

#34
 select datediff(
	(select max(birth) from student),
    (select min(birth) from student)
 ) as DateDiff;
