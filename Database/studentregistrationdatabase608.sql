DROP DATABASE IF EXISTS STUDENTREGISTRATION608;
CREATE DATABASE STUDENTREGISTRATION608; 
USE STUDENTREGISTRATION608;

DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT(
    department_name                     varchar(100) NOT NULL,
    department_head                     varchar(30) NOT NULL,                         
    PRIMARY KEY(department_name)
);

INSERT INTO DEPARTMENT (department_name, department_head)
VALUES
('Biomedical Engineering','Dr. Michael Kallos'),
('Chemical & Petroleum Engineering','Dr. Arin Sen'),
('Civil Engineering', 'Dr. Jocelyn Hayley'),
('Electrical & Software Engineering', 'Dr. Andy Knight'),
('Geomatics Engineering','Dr. Emmanuel Stefanakis'),
('Mechanical & Manufacturing Engineering', 'Dr. Qiao Sun');


DROP TABLE IF EXISTS COURSE;
CREATE TABLE COURSE(
    department_name                                 varchar(100) NOT NULL,
	course_name         		                    varchar(8) NOT NULL,
	course_start_date		                        DATE NOT NULL,
	course_end_date				                    DATE NOT NULL,
	PRIMARY KEY (department_name, course_name),
    FOREIGN KEY (department_name)                   REFERENCES DEPARTMENT(department_name)
);

INSERT INTO COURSE (department_name, course_name, course_start_date, course_end_date)
VALUES
('Electrical & Software Engineering', 'ENSF592', '2022-05-01', '2022-06-29'),
('Electrical & Software Engineering', 'ENSF593', '2022-05-01', '2022-06-29'),
('Electrical & Software Engineering', 'ENSF594', '2022-07-01', '2022-08-15'),
('Electrical & Software Engineering', 'ENSF607', '2022-09-05', '2022-12-07'),
('Electrical & Software Engineering', 'ENSF608', '2022-09-05', '2022-12-07'),
('Electrical & Software Engineering', 'ENSF611', '2022-09-05', '2022-12-07'),
('Electrical & Software Engineering', 'ENSF612', '2022-09-05', '2022-12-07'),
('Electrical & Software Engineering', 'ENSF614', '2022-09-05', '2022-12-07');


DROP TABLE IF EXISTS PREREQ;
CREATE TABLE PREREQ (
    parent_department_name                                  varchar(100) NOT NULL,
    course_name						                        varchar(8) NOT NULL,
    prereq_department_name                                  varchar(100) NOT NULL,
    prereq_name						                        varchar(8) NOT NULL,
    FOREIGN KEY (parent_department_name, course_name)       REFERENCES COURSE(department_name, course_name),
    FOREIGN KEY (prereq_department_name, prereq_name)       REFERENCES COURSE(department_name, course_name)
);

INSERT INTO PREREQ (parent_department_name, course_name, prereq_department_name, prereq_name)
VALUES
('Electrical & Software Engineering', 'ENSF594', 'Electrical & Software Engineering', 'ENSF592'),
('Electrical & Software Engineering', 'ENSF594', 'Electrical & Software Engineering', 'ENSF593'),
('Electrical & Software Engineering', 'ENSF607', 'Electrical & Software Engineering', 'ENSF594'),
('Electrical & Software Engineering', 'ENSF608', 'Electrical & Software Engineering', 'ENSF594'),
('Electrical & Software Engineering', 'ENSF611', 'Electrical & Software Engineering', 'ENSF594'),
('Electrical & Software Engineering', 'ENSF612', 'Electrical & Software Engineering', 'ENSF594'),
('Electrical & Software Engineering', 'ENSF614', 'Electrical & Software Engineering', 'ENSF594');


DROP TABLE IF EXISTS SECTION;
CREATE TABLE SECTION (
    department_name                                                 varchar(100) NOT NULL,
    course_name                                                     varchar(8) NOT NULL,
    section_number                                                  INT NOT NULL,
    capacity									                    INT NOT NULL,
    PRIMARY KEY (department_name, course_name, section_number),
    FOREIGN KEY (department_name, course_name)                      REFERENCES COURSE(department_name, course_name)
);

INSERT INTO SECTION (department_name, course_name, section_number, capacity)
VALUES
('Electrical & Software Engineering', 'ENSF592', '1', '50'),
('Electrical & Software Engineering', 'ENSF592', '2', '70'),
('Electrical & Software Engineering', 'ENSF593', '1', '50'),
('Electrical & Software Engineering', 'ENSF593', '2', '70'),
('Electrical & Software Engineering', 'ENSF594', '1', '50'),
('Electrical & Software Engineering', 'ENSF594', '2', '70'),
('Electrical & Software Engineering', 'ENSF607', '1', '50'),
('Electrical & Software Engineering', 'ENSF607', '2', '70'),
('Electrical & Software Engineering', 'ENSF608', '1', '50'),
('Electrical & Software Engineering', 'ENSF608', '2', '70'),
('Electrical & Software Engineering', 'ENSF611', '1', '50'),
('Electrical & Software Engineering', 'ENSF611', '2', '70'),
('Electrical & Software Engineering', 'ENSF612', '1', '50'),
('Electrical & Software Engineering', 'ENSF612', '2', '70'),
('Electrical & Software Engineering', 'ENSF614', '1', '50'),
('Electrical & Software Engineering', 'ENSF614', '2', '70');


DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT (
    student_ucid				varchar(8) NOT NULL,
    student_first_name			varchar(15) NOT NULL,
    student_last_name			varchar(15) NOT NULL,
    student_username            varchar(30) NOT NULL,
    student_password            varchar(30) NOT NULL,
	PRIMARY KEY (student_ucid)   
);

INSERT INTO STUDENT (student_ucid, student_first_name, student_last_name, student_username, student_password) VALUES
('30169301','mark','phillipos', 'mark.phillipos', 'password'),
('30169302','ryan','ahlstrom', 'ryan.ahlstrom', 'cats'),
('30169303','derek','walz', 'derek.walz', 'dogs');


DROP TABLE IF EXISTS ENROLLMENT;
CREATE TABLE ENROLLMENT (
    department_name                                                             varchar(100) NOT NULL,
    course_name                                                                 varchar(8) NOT NULL,
    section_number                                                              INT NOT NULL,
    student_ucid                                                                varchar(8) NOT NULL,
    grade                                                                       varchar(1),
    PRIMARY KEY (department_name, course_name, section_number, student_ucid),
    FOREIGN KEY (department_name, course_name, section_number)     		        REFERENCES SECTION(department_name, course_name, section_number),
    FOREIGN KEY (student_ucid)                                                  REFERENCES STUDENT(student_ucid)
);

INSERT INTO ENROLLMENT (department_name, course_name, section_number, student_ucid, grade)
VALUES
('Electrical & Software Engineering', 'ENSF592', '1', '30169301', 'A'),
('Electrical & Software Engineering', 'ENSF593', '1', '30169301', 'A'),
('Electrical & Software Engineering', 'ENSF594', '1', '30169301', 'A'),
('Electrical & Software Engineering', 'ENSF607', '1', '30169301', ''),
('Electrical & Software Engineering', 'ENSF608', '1', '30169301', ''),
('Electrical & Software Engineering', 'ENSF611', '1', '30169301', ''),
('Electrical & Software Engineering', 'ENSF612', '1', '30169301', ''),
('Electrical & Software Engineering', 'ENSF614', '1', '30169301', ''),
('Electrical & Software Engineering', 'ENSF592', '2', '30169302', 'B'),
('Electrical & Software Engineering', 'ENSF593', '2', '30169302', 'B'),
('Electrical & Software Engineering', 'ENSF594', '2', '30169302', 'B'),
('Electrical & Software Engineering', 'ENSF607', '2', '30169302', ''),
('Electrical & Software Engineering', 'ENSF608', '2', '30169302', ''),
('Electrical & Software Engineering', 'ENSF611', '2', '30169302', ''),
('Electrical & Software Engineering', 'ENSF612', '2', '30169302', ''),
('Electrical & Software Engineering', 'ENSF614', '2', '30169302', ''),
('Electrical & Software Engineering', 'ENSF592', '1', '30169303', 'C'),
('Electrical & Software Engineering', 'ENSF593', '1', '30169303', 'C'),
('Electrical & Software Engineering', 'ENSF594', '1', '30169303', 'C'),
('Electrical & Software Engineering', 'ENSF607', '1', '30169303', ''),
('Electrical & Software Engineering', 'ENSF608', '1', '30169303', ''),
('Electrical & Software Engineering', 'ENSF611', '1', '30169303', ''),
('Electrical & Software Engineering', 'ENSF612', '1', '30169303', ''),
('Electrical & Software Engineering', 'ENSF614', '1', '30169303', '');