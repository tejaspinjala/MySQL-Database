use university;

select student_number, grade, section_identifier
	from grade_report, course
    where student_number = (select student_number from student where name = 'Smith');

select * from course where course = "Database Management";

# Retreive the transcript - a list of all courses and grades of 'Smith'
select sec.course_number, gr.grade
	from 	student st,
			grade_report gr,
			section sec
	where 	st.student_number = gr.student_number
		and gr.section_identifier = sec.section_identifier
		and st.name = 'Smith';
    
# List the name of students who took the section of the 'Database Management' course offered
# in fall 2008 and their grades in that section
select s.name, sec.course_number, gr.grade
	from	student s,
			grade_report gr,
            section sec,
            course c
	where	s.student_number = gr.student_number
		and gr.section_identifier = sec.section_identifier
        and sec.course_number = c.course_number
        and c.course_name = 'Database Management'
        and sec.semester = 'Fall'
        and sec.year = '08';
        
# List the prerequisites of the 'Database Management' course
select p.prerequisite_number
	from	prerequisite p,
			course c
    where	p.course_number = c.course_number
		and c.course_name = 'Database Management';

select c2.*
	from	prerequisite p,
			course c,
            course c2
    where	p.course_number = c.course_number
		and p.prerequisite_number = c2.course_number
		and c.course_name = 'Database Management';
        
# Change the class of 'Smith' to Sophomore
select st.name
	from 	student st
    where	student_name = 'Smith';
    
update student
set class = (select class 
	from 	classification 
    where	upper(description) = upper('sophomore')
			)
where name = 'Smith'
			
# Create a new section for the 'Database Management' course for this semester
select * from section
insert into section
values (136, 'CS3380', 'Summer', '23', '5');


select * from section
insert into section
values (136, 
		(select 	course_number
			from	course
            where	course_name = 'Database Management'), 
            'Summer', 
            '23', 
            (select 	ssn
				from 	employee
                where 	lname = 'Stone')
                )

# Enter a grade of 'A' for 'Smith' in the 'Database Management'
# section of the last semester
insert into grade_report
values ((select 	student_number 
			from 	student 
            where 	name = 'Smith'),
		(select 	section_identifier
			from 	section 
            where	course_number in (select 	course_number
										from	course
                                        where	course_name = 'Database Management')
				and semester = 'Fall'
                and year = '08'),
		'B')

select gr.*
	from 	grade_report gr,
			student s,
			section sec,
            course c
	where	gr.student_number = s.student_number
		and gr.section_identifier = sec.section_identifier
        and sec.course_number = c.course_number
        and s.name = 'Smith'
        and sec.semester = 'Fall'
        and sec.year = '08'
        and c.course_name = 'Database Management';

update grade_report gr
set gr.grade = 'A'
where exists (select *
				from 	student s,
						section sec,
						course c,
                        grade_report gr
				where	gr.student_number = s.student_number
					and gr.section_identifier = sec.section_identifier
					and sec.course_number = c.course_number
					and s.name = 'Smith'
					and sec.semester = 'Fall'
					and sec.year = '08'
					and c.course_name = 'Database Management'
				)


		




