DROP DATABASE IF EXISTS STUDENTREGISTRATION;
CREATE DATABASE STUDENTREGISTRATION; 
USE STUDENTREGISTRATION;

DROP TABLE IF EXISTS COURSES;
CREATE TABLE COURSES (
	course_name         		varchar(8) not null,
	course_start_date		    DATE,
	course_end_date				DATE,
	PRIMARY KEY (course_name)
);

INSERT INTO COURSES (course_name, course_start_date, course_end_date)
VALUES
('ENSF608','2022-09-05','2022-12-07'),
('ENSF611','2022-09-05','2022-12-07'),
('ENSF612','2022-09-05','2022-12-07'),
('ENSF614','2022-09-05','2022-12-07'),
('ENSF607','2022-09-05','2022-12-07'),
('ENSF594','2022-07-01','2022-08-15'),
('ENSF593','2022-05-01','2022-06-29'),
('ENSF592','2022-05-01','2022-06-29');


DROP TABLE IF EXISTS STUDENTS;
CREATE TABLE STUDENTS (
    student_ucid				varchar(8) not null,
    student_first_name			varchar(15) not null,
    student_last_name			varchar(15) not null,
	primary key (student_ucid)   
);

INSERT INTO STUDENTS (student_ucid, student_first_name, student_last_name) VALUES
('30169301','mark','phillipos'),
('30169302','ryan','ahlstrom'),
('30169303','derek','walz');

DROP TABLE IF EXISTS PREREQS;
CREATE TABLE PREREQS (
    course_name						varchar(8),
    prereq_name						varchar(8),
    foreign key (course_name)       references COURSES(course_name),
    foreign key (prereq_name)       references COURSES(course_name)
);

INSERT INTO PREREQS (course_name, prereq_name)
VALUES
('ENSF594', 'ENSF592'),
('ENSF594', 'ENSF593'),
('ENSF607', 'ENSF594'),
('ENSF608', 'ENSF594'),
('ENSF611', 'ENSF594'),
('ENSF612', 'ENSF594'),
('ENSF614', 'ENSF594');

DROP TABLE IF EXISTS SECTIONS;
CREATE TABLE SECTIONS (
    course_name                                 varchar(8),
    section_number                              INT NOT NULL,
    capacity									INT NOT NULL,
    PRIMARY KEY (course_name, section_number),
    FOREIGN KEY (course_name)                   REFERENCES COURSES(course_name)
);

INSERT INTO SECTIONS (course_name, section_number, capacity)
VALUES
('ENSF592', '1', '50'),
('ENSF592', '2', '70'),
('ENSF593', '1', '50'),
('ENSF593', '2', '70'),
('ENSF594', '1', '50'),
('ENSF594', '2', '70'),
('ENSF607', '1', '50'),
('ENSF607', '2', '70'),
('ENSF608', '1', '50'),
('ENSF608', '2', '70'),
('ENSF611', '1', '50'),
('ENSF611', '2', '70'),
('ENSF612', '1', '50'),
('ENSF612', '2', '70'),
('ENSF614', '1', '50'),
('ENSF614', '2', '70');

DROP TABLE IF EXISTS ENROLLMENTS;
CREATE TABLE ENROLLMENTS (
    course_name                                             varchar(8) NOT NULL,
    section_number                                          INT NOT NULL,
    student_ucid                                            varchar(8) NOT NULL,
    grade                                                   varchar(1),
    PRIMARY KEY (course_name, section_number, student_ucid),
    FOREIGN KEY (course_name, section_number)     		    REFERENCES SECTIONS(course_name, section_number),
    FOREIGN KEY (student_ucid)                              REFERENCES STUDENTS(student_ucid)
);

INSERT INTO ENROLLMENTS (course_name, section_number, student_ucid, grade)
VALUES
('ENSF592', '1', '30169301', 'A'),
('ENSF593', '1', '30169301', 'A'),
('ENSF594', '1', '30169301', 'A'),
('ENSF607', '1', '30169301', ''),
('ENSF608', '1', '30169301', ''),
('ENSF611', '1', '30169301', ''),
('ENSF612', '1', '30169301', ''),
('ENSF614', '1', '30169301', ''),
('ENSF592', '2', '30169302', 'B'),
('ENSF593', '2', '30169302', 'B'),
('ENSF594', '2', '30169302', 'B'),
('ENSF607', '2', '30169302', ''),
('ENSF608', '2', '30169302', ''),
('ENSF611', '2', '30169302', ''),
('ENSF612', '2', '30169302', ''),
('ENSF614', '2', '30169302', ''),
('ENSF592', '1', '30169303', 'C'),
('ENSF593', '1', '30169303', 'C'),
('ENSF594', '1', '30169303', 'C'),
('ENSF607', '1', '30169303', ''),
('ENSF608', '1', '30169303', ''),
('ENSF611', '1', '30169303', ''),
('ENSF612', '1', '30169303', ''),
('ENSF614', '1', '30169303', '');