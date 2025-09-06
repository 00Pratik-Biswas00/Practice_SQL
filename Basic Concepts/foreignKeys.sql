create table teacher (
	teacher_id int not null primary key,
    name varchar(50),
    dept_id int,
    foreign key (dept_id) references student(id)
    on delete cascade -- help to update/delete in both the table
    on update cascade
);

drop table teacher;
-- student table is the parent table because there is foreign key introduced and the teacher table is the child table because here the key is used 

-- update in both the table
select * from techno_students;
select * from teacher;

insert into teacher (teacher_id, name, dept_id) values
(100, "Arpita", 1),(101, "Soumik", 2),(102, "Moumita", 3);

update student
set id=id+1000;

-- alter command is used to change the schema

alter table student
add column location varchar(50) default "Kolkata";

alter table student
modify column location varchar(20);

alter table student
change location my_location varchar(30);

alter table student
drop column  my_location ;

alter table student
rename to techno_students;

-- truncate table table_name is used to delete the data of the table not the schema

-- practice Qs

alter table techno_students
change name full_name varchar(50);

delete from techno_students
where age>22;

alter table techno_students
drop column age;
