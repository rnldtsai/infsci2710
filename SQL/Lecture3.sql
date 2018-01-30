SELECT * FROM `instructor` WHERE `dept_name` = 'Biology'
SELECT title as CS_COURSE FROM `course` WHERE dept_name = 'Comp. Sci.' and credits = 3
SELECT * FROM `takes` as t, `course` as c WHERE t.ID = 12345 and c.course_id = t.course_id
SELECT t.course_id, c.title FROM `takes` as t, course as c WHERE t.ID = 12345 and c.course_id = t.course_id
SELECT t.course_id, c.title, c.credits FROM `takes` as t, course as c WHERE t.ID = 12345 and c.course_id = t.course_id
SELECT SUM(c.credits) FROM `takes` as t, course as c WHERE t.ID = 12345  and c.course_id = t.course_id
SELECT SUM(c.credits) FROM `takes` as t, course as c WHERE c.course_id = t.course_id GROUP BY t.ID
SELECT s.name, SUM(c.credits) FROM `takes` as t, course as c, student as s WHERE  c.course_id = t.course_id and t.ID = s.ID GROUP BY t.ID
