/*drop tables in reverse order of creation*/
DROP TABLE IF exists Inventory
DROP TABLE IF exists Supplies
DROP TABLE IF exists WorkRoles
DROP TABLE IF exists Roles
DROP TABLE IF exists Workers
DROP TABLE IF exists Rats
DROP TABLE IF exists Taverns
DROP TABLE IF exists Locations

/* table needs ID and name(place)*/
CREATE TABLE Locations (
	ID INT IDENTITY,
	LocationName varchar(100)
	PRIMARY KEY (ID)
	);

/*table needs name, location, info about owner, total floors, and rats in basement*/
CREATE TABLE [Taverns] (
	ID INT IDENTITY,
	Tavern varchar(100),
	TavOwner varchar(100),
	LocationID INT,
	Floors INT,
	PRIMARY KEY (ID),
);

/* table needs names and which tavern the're part of */
CREATE TABLE Rats ( 
	ID INT IDENTITY, 
	Rat varchar(100),
	TavernID int,
	PRIMARY KEY (ID),
	FOREIGN KEY (TavernID) REFERENCES Taverns(ID)
);


/* table needs names and roles w/ description (eg. bonnie, barmaid (serves drinks)) */
CREATE TABLE Workers (
	ID INT IDENTITY,
	Worker varchar(100)
);

/* table needs names and description of roles */
CREATE TABLE Roles (
	ID INT IDENTITY,
	Role varchar(100),
	RoleDesc varchar(100)
);

CREATE TABLE WorkRoles(
	UserID INT,
	RoleID INT
);

/* table needs units */
CREATE TABLE Supplies(
	Unit INT,
	Item VARCHAR(100),
	Stock INT,
	Price MONEY
);

CREATE TABLE Inventory(
	SupplyID INT,
	TavernID INT,
	Cost MONEY,
	Received MONEY,
	InvDate DATETIME
);

/*
/* table needs name of service, description of service, status, */
CREATE TABLE [SERVICES]();



*/

INSERT INTO Locations (LocationName) values
	('intersection of fifth and market');


INSERT INTO Taverns (Tavern,TavOwner,Floors) values
	('Jims','Tom',3),
	('Mollys','Molly',2),
	('Millys','Milton',1),
	('Mellys','Mel',4),
	('Myllys','Myles',4),
	('Mallys','Malone',4),
	('Mullys','Mulder',4);


INSERT INTO Rats (TavernID, Rat) values
	(1, 'Jim'),
	(2, 'Jim'),
	(2, 'Jom'),
	(3, 'Jam'),
	(3, 'Jym'),
	(2, 'Jimy'),
	(2, 'Jimmy'),
	(5, 'Jim'),
	(4, 'Jam'),
	(5, 'Jom');

INSERT INTO Roles (Role, RoleDesc) values
	('Bartender','serves drinks');

INSERT INTO Workers (Worker) values
	('Jim');

INSERT INTO WorkRoles (UserID, RoleID) Values
	(1,1);


SELECT * FROM Taverns T
JOIN Rats R ON T.ID = R.TavernID;-- shows only taverns with rats, sorted by Rats table ID




