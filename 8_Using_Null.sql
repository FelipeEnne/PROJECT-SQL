-- Using Null

-- 1)
-- List the teachers who have NULL for their department.

--  Answer 
SELECT teacher.name
 FROM teacher
WHERE dept IS NULL

-- 2)
-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

--  Answer  
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3)
-- Use a different JOIN so that all teachers are listed.

--  Answer  
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)



-- 4)
-- Use a different JOIN so that all departments are listed.


-- Answer  
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id) 



-- 5)
-- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. 
-- Show teacher name and mobile number or '07986 444 2266'

--  Answer  
SELECT name, COALESCE(mobile,'07986 444 2266')
 FROM teacher 



-- 6)
-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. 
-- Use the string 'None' where there is no department.

--  Answer  
SELECT teacher.name, COALESCE(dept.name,'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)



-- 7)
-- Use COUNT to show the number of teachers and the number of mobile phones.

--  Answer  
SELECT COUNT(name) AS Number_Teachers, COUNT(mobile) AS Number_Mobile
 FROM teacher 



-- 8)
-- LUse COUNT and GROUP BY dept.name to show each department and the number of staff. 
-- Use a RIGHT JOIN to ensure that the Engineering department is listed.

--  Answer  
SELECT  dept.name, COUNT(teacher.name)
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
GROUP BY dept.name



-- 9)
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- [Note: the ord field of casting gives the position of the actor. 
-- If ord=1 then this actor is in the starring role]

--  Answer  
SELECT teacher.name ,
CASE WHEN teacher.dept= 1 OR teacher.dept= 2 THEN  'Sci'  ELSE  'Art' END
 FROM teacher 


-- 10)
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, 
-- show 'Art' if the teacher's dept is 3 and 'None' otherwise.

--  Answer  
SELECT teacher.name ,
CASE 
WHEN teacher.dept= 1 OR teacher.dept= 2 THEN  'Sci' 
WHEN teacher.dept= 3 THEN  'Art' ELSE  'None' END
 FROM teacher 
