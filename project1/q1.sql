CREATE TABLE Banks (
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    NoAccounts INT DEFAULT 0,
    Security CHAR(15) CHECK(
        Security = 'weak'
        OR Security = 'good'
        OR Security = 'very good'
        OR Security = 'excellent'
    ),
    CONSTRAINT BanksPK PRIMARY KEY (BankName, City),
    CONSTRAINT NoAccountsCheck CHECK(NoAccounts >= 0)
);
CREATE TABLE Robberies(
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    Date DATE NOT NULL,
    Amount REAL NOT NULL CHECK(Amount >= 0),
    CONSTRAINT RobberiesPK PRIMARY KEY (BankName, City, Date),
    CONSTRAINT RobberiesFK FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City)
);
CREATE TABLE Plans(
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    NoRobbers INT CHECK(NoRobbers > 0),
    PlannedDate DATE NOT NULL,
    CONSTRAINT PlansPK PRIMARY KEY (BankName, City, PlannedDate),
    CONSTRAINT PlansFK FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City)
);
CREATE TABLE Robbers(
    RobberId INT PRIMARY KEY NOT NULL,
    Nickname CHAR(25) NOT NULL,
    Age INT NOT NULL,
    NoYears INT DEFAULT 0,
    CONSTRAINT NoYearsCheck CHECK(NoYears >= 0),
    CONSTRAINT AgeCheck CHECK(Age >= NoYears)
);
CREATE TABLE Skills(
    SkillId INT PRIMARY KEY NOT NULL CHECK(SkillId >= 0),
    Description CHAR(25) UNIQUE NOT NULL
);
CREATE TABLE HasSkills(
    RobberId INT NOT NULL REFERENCES Robbers(RobberId),
    SkillId INT NOT NULL REFERENCES Skills(SkillId),
    Preference INT NOT NULL,
    Grade CHAR(3) NOT NULL,
    CONSTRAINT HasSkillsPK PRIMARY KEY(RobberId, SkillId)
);
ALTER TABLE Hasskills
ADD CONSTRAINT id_preference_unique UNIQUE (RobberId, Preference);
CREATE TABLE HasAccounts(
    RobberId INT NOT NULL REFERENCES Robbers(RobberId),
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    CONSTRAINT HasAccountsPK PRIMARY KEY (RobberId, BankName, City),
    CONSTRAINT HasAccountsFK_2 FOREIGN KEY(BankName, City) REFERENCES Banks(BankName, City) -- can also not specify them since it will auto bind the BanksPK
);
CREATE TABLE Accomplices(
    RobberId INT NOT NULL REFERENCES Robbers(RobberId),
    BankName CHAR(30) NOT NULL,
    City CHAR(30) NOT NULL,
    Date DATE NOT NULL,
    Share REAL NOT NULL,
    CONSTRAINT AccomplicesPK PRIMARY KEY (RobberId, BankName, City, Date),
    CONSTRAINT AccomplicesFK_2 FOREIGN KEY(BankName, City) REFERENCES Banks(BankName, City),
    CONSTRAINT AccomplicesFK_3 FOREIGN KEY(BankName, City, Date) REFERENCES Robberies(BankName, City, Date)
);
CREATE TABLE TempSkills (
    RobberNicknameTemp CHAR(25) NOT NULL,
    DescriptionTemp CHAR(25) NOT NULL,
    PreferenceTemp INT NOT NULL CHECK(PreferenceTemp >= 0),
    GradeTemp CHAR(3) NOT NULL
);