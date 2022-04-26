--  part of Q2 sql statements
-- Q2, remove duplicate rows based on description column
-- https://www.codegrepper.com/code-examples/sql/postgresql+remove+duplicate+rows+based+on+one+column
DELETE FROM Skills rowA USING (
        SELECT MIN(ctid) as ctid,
            description
        FROM Skills
        GROUP BY description
        HAVING COUNT(*) > 1
    ) rowB
WHERE rowA.description = rowB.description
    AND rowA.ctid <> rowB.ctid;
``` after removing duplicates, remaining ids are not in order, so sort them from 1,4,7 to 1,2,3
CREATE SEQUENCE Skills_id_seq2 AS integer;
ALTER SEQUENCE Skills_id_seq2 OWNED BY Skills.SkillId;
update Skills set SkillId = nextval('Skills_id_seq2')
\g
select * from Skills
\g
``` -- for populatiinnng HasSkills table
INSERT INTO HasSkills(RobberId, SkillId, Preference, Grade)
SELECT robber.RobberId,
    skill.SkillId,
    tempSkill.PreferenceTemp,
    tempSkill.GradeTemp
FROM TempSkills tempSkill,
    Robbers robber,
    Skills skill
WHERE robber.Nickname = tempSkill.RobberNicknameTemp
    AND skill.Description = tempSkill.DescriptionTemp;
-- 
-- 
-- 
CREATE TABLE TempHasaccounts (
    RobberNicknameTemp CHAR(25) NOT NULL,
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL
);
-- \ copy TempHasaccounts FROM ~ / git / 439p1 / data2022 / hasaccounts_22.data 
INSERT INTO HasAccounts(RobberId, BankName, City)
SELECT robber.RobberId,
    temp.BankName,
    temp.City
FROM Robbers robber,
    TempHasaccounts temp
WHERE robber.Nickname = temp.RobberNicknameTemp;
-- 
-- Accomplicaes table
-- 
CREATE TABLE TempAccomplices (
    RobberNicknameTemp CHAR(25) NOT NULL,
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    DateTemp DATE NOT NULL,
    ShareTemp REAL NOT NULL
);
-- \copy TempAccomplices FROM ~/git/439p1/data2022/accomplices_22.data --
INSERT INTO Accomplices(RobberId, BankName, City, Date, Share)
SELECT robber.RobberId,
    temp.BankName,
    temp.City,
    temp.DateTemp,
    temp.ShareTemp
FROM Robbers robber,
    TempAccomplices temp
WHERE robber.Nickname = temp.RobberNicknameTemp;