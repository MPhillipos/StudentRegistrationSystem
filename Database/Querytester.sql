use studentregistration608;

-- 1) Show all tables and explain how they are related to one another (keys, triggers, etc.)
select * from department;
--       primary key (department_id)
select * from course;
-- 		primary key (student_ucid)   
select * from student;
-- 		primary key (student_ucid)   
select * from prereq;
--      foreign key (course_name) references COURSES(course_name),
--      foreign key (prereq_name) references COURSES(course_name)
select * from section;
-- 		primary key (course_name, section_number),
--      foreign key (course_name)  references COURSES(course_name)
select * from enrollment;
-- 		primary key (course_name, section_number, student_ucid),
-- 		foreign key (course_name, section_number) references SECTIONS(course_name, section_number),
-- 		foreign key (student_ucid) references STUDENTS(student_ucid)

-- 2) A basic retrieval query
select * from course as c where c.course_name = "ENSF608";

-- 3) A retrieval query with ordered results
select * from course order by course_name asc;

-- 4) A nested retrieval query
-- 		get all ucid's for students with first name mark

select A.student_ucid FROM (
                        select * from student as B where B.student_first_name='mark'
                      ) as A;
                      
-- 5) A retrieval query using joined tables
-- 		get prereqs for ENSF594
select pc.course_name, pc.course_start_date, pc.course_end_date from course c
	inner join prereq p on c.course_name=p.course_name
	inner join Course pc on p.prereq_name=pc.course_name
	where c.course_name = 'ENSF594';
                            
-- 6) An update operation with any necessary triggers
update student SET student_first_name = 'cool guy' where student_ucid = '30169301';

-- 7) A deletion operation with any necessary triggers
delete from enrollment e where e.course_name = 'ENSF608' and e.student_ucid = '30169301';