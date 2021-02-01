.mode column
.headers on
PRAGMA foreign_keys = ON;

----------------------
-- Database Degrade --
----------------------
drop table if exists student;
drop table if exists course;
drop table if exists record;

-------------------
-- Create Tables --
-------------------
create table student (
    name,
    sid,
    primary key (sid));
create table course (
    name,
    cid,
    primary key(cid));
create table record (
    sid, cid, quarter, year, grade,
    primary key (sid, cid),
    foreign key (sid) references student(sid),
    foreign key (cid) references course(cid));

------------------- 
-- Insert Values --
-------------------

insert into student values ('Bob', 'A00');
insert into student values ('Abby', 'A01');
insert into student values ('Emily', 'A02');
insert into student values ('Alex', 'A03');
insert into student values ('Tim', 'A04');
insert into student values ('Terry', 'A05');
insert into student values ('Emma', 'A06');
insert into student values ('Paul', 'A07');


insert into course values ('Data Structures', 'CSE100');
insert into course values ('Algorithms', 'CSE101');
insert into course values ('Software Engineering', 'CSE110');
insert into course values ('Computer Networks', "CSE123");
insert into course values ('Database System Principles', 'CSE132A');
insert into course values ('Database Systems Applications', 'CSE132B');
insert into course values ('Artificial Intelligence', 'CSE151');
insert into course values ('Computer Graphics', 'CSE167');


insert into record values ('A01','CSE100','W', 2013, 4);
insert into record values ('A01','CSE132A','F', 2013, 3);
insert into record values ('A01','CSE132B','S', 2013, 3);
insert into record values ('A01','CSE110','S', 2015, 3);
insert into record values ('A01','CSE101','S', 2015, 3);
insert into record values ('A01','CSE123','S', 2015, 2);
insert into record values ('A01','CSE167','S', 2015, 3); 

insert into record values ('A02','CSE100','S', 2017, 4);
insert into record values ('A02','CSE101','W', 2019, 0);
insert into record values ('A02','CSE132A','W', 2020, 3);
insert into record values ('A02','CSE132B','W', 2020, 3);

insert into record values ('A03','CSE100','W', 2018, 4);
insert into record values ('A03','CSE167','F', 2020, 4);
insert into record values ('A03','CSE151','W', 2020, 3);

insert into record values ('A04','CSE100','F', 2019, 2);
insert into record values ('A04','CSE132A','F', 2020, 4);
insert into record values ('A04','CSE101','W', 2020, 3);
insert into record values ('A04','CSE110','F', 2018, 4);

insert into record values ('A05','CSE100','W', 2020, 2);

insert into record values ('A06','CSE100','W', 2020, 4);

insert into record values ('A07','CSE100','W', 2020, 3);

-----------------------------
-- Simple Database Queries --
-----------------------------

-- Find all students
select *  from student; 
-- Find the name of a student whose sid is A00
select name from student where sid = 'A00'; 

------------------------
-- Gropu by Statement --
------------------------
-- Find the number of courses that Abby has taken 
select count(*) from record where sid = 'A01';
-- Find Abby's GPA in each quarter
select avg(grade), year, quarter from record 
group by year, quarter having sid = 'A01';

--------------
-- Order By --
--------------
-- Order the grade of couses in record
select * from record order by grade;


------------------
-- Join Clauses --
------------------
-- Pair the courses' cid in record with its name in course
select r.sid, r.cid, c.name, r.year, r.quarter
from course c inner join record r on r.cid = c.cid;

--------------------
-- Update Clauses --
--------------------
-- Update on the courses that A07 has taken 
update record 
set cid = 'CSE101'
where sid = 'A07';

--------------------
-- Delete Clauses --
--------------------
-- Delete the courses that A07 has taken
delete from record where sid = 'A07';

