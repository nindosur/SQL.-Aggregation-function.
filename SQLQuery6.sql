--1
SELECT COUNT(*) as '���-�� �����' FROM Wards
WHERE Places > 10;

--2
SELECT Departments.Building as '�������� �������', COUNT(Wards.Id) as '���-�� �����'
FROM Departments
LEFT JOIN Wards ON Departments.Id = Wards.DepartmentId
GROUP BY Departments.Building;

--3 
SELECT Departments.Name as '�������� ��������', COUNT(Wards.Id) as '���-�� �����'
FROM Departments
LEFT JOIN Wards ON Departments.Id = Wards.DepartmentId
GROUP BY Departments.Name;

--4
SELECT Departments.Name as '�������� ���������', SUM(Doctors.Premium) as '��������'
FROM Departments
LEFT JOIN Wards ON Departments.Id = Wards.DepartmentId
LEFT JOIN DoctorExaminations ON Wards.Id = DoctorExaminations.DoctorId
LEFT JOIN Doctors ON DoctorExaminations.DoctorId = Doctors.Id
GROUP BY Departments.Name;

--5
SELECT Departments.Name as '�������� ���������' FROM Departments
LEFT JOIN Wards ON Departments.Id = Wards.DepartmentId
LEFT JOIN DoctorExaminations ON Wards.Id = DoctorExaminations.WardID
GROUP BY Departments.Name 
HAVING COUNT(DISTINCT DoctorExaminations.DoctorId) > 5;

--6
SELECT COUNT(*) as '���-�� ������', SUM(Doctors.Salary + Doctors.Premium) as '��������� ��'
FROM Doctors;

--7
SELECT AVG(Doctors.Salary + Doctors.Premium) as '������� ��'
FROM Doctors;

--8
SELECT Name as '�������� ������'
FROM Wards
WHERE Places = (SELECT MIN(Places) FROM Wards)

--9
SELECT Departments.Building as '����� �������', SUM(Wards.Places) as '���-�� ����'
FROM Departments
LEFT JOIN Wards ON Departments.Id = Wards.DepartmentId
WHERE Departments.Building IN (1,6,7,8) AND Wards.Places > 10
GROUP BY Departments.Building 
HAVING SUM(Wards.Places) > 100;
