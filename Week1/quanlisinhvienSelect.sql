SELECT *
FROM student AS S
WHERE S.StudentName LIKE 'h%';
SELECT *
FROM class AS C
WHERE C.StartDate LIKE '%-12-%';
SELECT *
FROM subject AS Sustudent
WHERE Su.Credit BETWEEN 3 AND 5;
UPDATE student
SET ClassId = 2
WHERE StudentName='Hung';
SELECT St.StudentName, Su.SubName, M.Mark
FROM student AS St, `subject` AS Su, mark AS M
ORDER BY M.Mark DESC, St.StudentName ASC;  