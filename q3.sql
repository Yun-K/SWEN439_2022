-- task1
INSERT INTO Skills(skillId, Description)
VALUES(21, 'Driving');
-- task2
INSERT INTO Banks(BankName, City, NoAccounts, Security)
VALUES('Loanshark Bank', 'Evanston', 100, 'very good') -- 
    -- 
INSERT INTO Banks(BankName, City, NoAccounts, Security)
VALUES('EasyLoan Bank', 'Evanston', -5, 'excellent');
-- 
-- 
INSERT INTO Banks(BankName, City, NoAccounts, Security)
VALUES('EasyLoan Bank', 'Evanston', 100, 'poor');
-- 
-- 
INSERT INTO Robberies(BankName, City, Date, Amount)
VALUES('NXP Bank', 'Chicago', '2019-01-08', 1000);
-- 
-- Task 4, delete skills
DELETE FROM Skills
WHERE SkillId = 1
    AND Description = 'Planning';
-- 
-- Task 5, delete Banks
DELETE FROM Banks
WHERE BankName = 'PickPocket Bank'
    AND City = 'Evanston'
    AND NoAccounts = 2000
    AND Security = 'very good';
-- 
-- Task 6, delete Robberies
DELETE FROM Robberies
WHERE BankName = 'Loanshark Bank'
    AND City = 'Chicago'
    AND Date = ''
    AND Amount = '';
-- 
-- task 7 , insert  Robbers
-- a.	(1, ‘Shotgun’, 70, 0)
-- b.	(333, ‘Jail Mouse’, 25, 35)
--
INSERT INTO Robbers(RobberId, NickName, Age, NoYears)
VALUES (1, 'Shotgun', 70, 0);
INSERT INTO Robbers(RobberId, NickName, Age, NoYears)
VALUES(333, 'Jail Mouse', 25, 35);
-- 
-- task 8 , insert  HasSkills
-- a.	(1, 7, 1, ‘A+’)
-- b.	(1, 2, 0, ‘A’)
-- c.	(333, 1, 1, ‘B-’)
-- d.	(3, 20, 3, ‘B+’)
--
INSERT INTO HasSkills(RobberId, SkillId, Preference, Grade)
VALUES (1, 7, 1, 'A+');
INSERT INTO HasSkills(RobberId, SkillId, Preference, Grade)
VALUES (1, 2, 0, 'A');
INSERT INTO HasSkills(RobberId, SkillId, Preference, Grade)
VALUES (333, 1, 1, 'B-');
INSERT INTO HasSkills(RobberId, SkillId, Preference, Grade)
VALUES (3, 20, 3, 'B+');
-- 
-- 
-- TASK 9: delete RObbers
-- a.	(1, ‘Al Capone’, 31, 2).
--
DELETE FROM Robbers
WHERE RobberId = 1
    AND Nickname = 'Al Capone'
    AND Age = 31
    AND NoYears = 2;