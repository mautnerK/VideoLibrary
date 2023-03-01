CREATE TABLE Members(
	MemberId INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	PhoneNumber VARCHAR(20),
	DateOfMembership DATE,
	Status VARCHAR(30)
);

CREATE TABLE Movies(
	MovieId INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(30),
	genre VARCHAR(20),
	ReleaseYear INT,
	Status INT
);
CREATE TABLE Loan(
	LoanId int PRIMARY KEY IDENTITY(1,1),
	MovieId int FOREIGN KEY(MovieId) REFERENCES MOVIES(MovieId),
	MemberId int FOREIGN KEY(MemberId) REFERENCES MEMBERS(MemberId),
	StartDate DATE,
	EndDate DATE
);
CREATE TABLE HistoryOfLoans(
	HistoryId int PRIMARY KEY IDENTITY(1,1),
	DateOfReturn DATE,
	MovieId int FOREIGN KEY(MovieId) REFERENCES MOVIES(MovieId),
	MemberId int FOREIGN KEY(MemberId) REFERENCES MEMBERS(MemberId),
);

DROP TABLE HistoryOfLoans
DROP TABLE Loan
DROP TABLE Members
DROP TABLE Movies


insert into Movies values ('The Shawshank Redemption', 'Drama', 1994,0)
insert into Movies values ('The Godfather', 'Crime, Drama', 1972,0)
insert into Movies values ('The Dark Knight', 'Action, Crime, Drama', 2008,0)
insert into Movies values ('The Godfather Part II', 'Crime, Drama', 1974,0)
insert into Movies values ('Matrix', 'Action, Sci-Fi', 1999,1)

Insert into Members values ('Bruno', 'Horvat', '+385 98 910 8555', '2010-01-01', 'Regular')
Insert into Members values ('Ivana', 'Markić', '+385 98 123 4422', '2020-05-11', 'Regular')
Insert into Members values ('Mirko', 'Josipović', '+385 98 123 4422', '2000-07-22', 'Frequent')

Insert into Loan values (1, 1, '2023-01-15', '2023-02-28') 
Insert into Loan values (2, 3, '2022-03-26', '2023-01-01') 



-- a)
SELECT * FROM Movies where genre LIKE '%Action%'
-- b)
SELECT * FROM Movies where genre LIKE '%Action%' AND Status = 1
-- c)
UPDATE Movies SET genre = 'Clasical' WHERE ReleaseYear < 1980
-- d)
INSERT INTO HistoryOfLoans Select GETDATE() AS DateOfReturn, MovieId, MemberId FROM LOAN WHERE LoanId = 1
DELETE FROM Loan WHERE LoanId = 1
-- e)
UPDATE MEMBERS SET Status = 'Frequent' FROM MEMBERS mem INNER JOIN (SELECT MemberId from MEMBERS GROUP BY MemberId HAVING COUNT(*) > 0) as hol ON mem.MemberId = hol.MemberId
