INSERT INTO `lab`.`student` (`ID`, `name`, `dept_name`, `tot_cred`) VALUES ('789', '1', 'Biology', '1');
SELECT * FROM `classroom` group by building
SELECT *,sum(capacity) FROM `classroom` group by building
SELECT *,sum(capacity) FROM `classroom` group by building having sum(capacity) > 100
SELECT * FROM `section` as s,`classroom` as c where s.room_number = c.room_number group by c.building
SELECT c.building, s.room_number, count(s.course_id) FROM `section` as s, classroom as c where s.room_number = c.room_number group by c.building
SELECT `classroom`.building, `section`.room_number, count(`section`.course_id) FROM `section` JOIN `classroom` on   `section`.room_number = `classroom`.room_number group by `classroom`.building
SELECT *,count(course_id) FROM `section` group by building; ->simple version. 

SELECT * FROM `student` where name like '%an%' order by tot_cred
SELECT *,replace(name, 'an', 'xx') FROM `student` where name like '%an%' order by tot_cred
SELECT *,UCASE(replace(name, 'an', 'xx')) FROM `student` where name like '%an%' order by tot_cred
SELECT *,CONCAT(UCASE(replace(name, 'an', 'xx')),'@',dept_name) FROM `student` where name like '%an%' order by tot_cred
SELECT *,CONCAT(UCASE(replace(name, 'an', 'xx')),'@',dept_name) as the_name FROM `student` where name like '%an%' order by tot_cred
