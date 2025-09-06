-- select column_name
-- from tableA
-- inner join tableB
-- on tableA.column_name = tableB.column_name (condition)

select * from faculty;
select * from firstyearstudents;
select * from payment;
select * from teacher;
select * from techno_students;

alter table teacher
change rollno teacher_id  int not null;

select *
from firstyearstudents
inner join teacher
on firstyearstudents.rollno = teacher.teacher_id;

select *
from firstyearstudents
left join teacher
on firstyearstudents.rollno = teacher.teacher_id;

select *
from firstyearstudents
right join teacher
on firstyearstudents.rollno = teacher.teacher_id;


-- full join statement is not present in mysql alternative approach -
select *
from firstyearstudents
left join teacher
on firstyearstudents.rollno = teacher.teacher_id
union
select *
from firstyearstudents
right join teacher
on firstyearstudents.rollno = teacher.teacher_id;

-- left exclusive join
select *
from firstyearstudents
left join teacher
on firstyearstudents.rollno = teacher.teacher_id
where teacher.teacher_id is not null;

-- self join

select *
from teacher as a
join teacher as b
where a.teacher_id = b.teacher_id;

-- sub queries - can be written using SELECT, FROM, WHERE clauses


-- find names of the students whose marks are greater than the avg of the class
select avg(marks) from firstyearstudents;
select name, marks 
from firstyearstudents 
where marks > (select avg(marks) from firstyearstudents);

-- find names of the students whose rollno is even
select rollno, name 
from firstyearstudents 
where rollno in  (select rollno from firstyearstudents where rollno%2=0);

-- find the max marks from the city of barrackpore

select name from firstyearstudents where city="Barrackpore";
select max(marks) from (select * from firstyearstudents where city="Barrackpore") as temp_table;

-- mysql views

create view v1 as
select rollno,marks,grade from firstyearstudents;

select * from v1;