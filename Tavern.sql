/*drop tables in reverse order of creation*/
DROP TABLE IF exists Sales
DROP TABLE IF exists TavernServices
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
	WorkerID INT,
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


/* table needs name of service, description of service, status, */
CREATE TABLE TavernServices (
	ID INT IDENTITY,
	Service VARCHAR(250),
	Cost MONEY,
	Status VARCHAR(100)
);

CREATE TABLE Sales(
	SaleID INT IDENTITY,
	CustID INT,
	ServiceID INT,
	TavernID INT,
	Price MONEY,
	QuantPurch INT,
	PurchDate VARCHAR(100)
);



INSERT INTO Locations (LocationName) values
	('intersection of fifth and market'),
	('123 Main street'),
	('Third star to the right, and straight on til morning'),
	('1 Royal Place'),
	('Jonestown'),
	('Market bazaar, stall 15'),
	('northern most manhole cover, Poopville, Dreamland'),
	('32 Adventure lane, Nicetown, Dreamland');


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
	(6, 'Jimmy'),
	(5, 'Jim'),
	(4, 'Jam'),
	(7, 'Jom');

INSERT INTO Roles (Role, RoleDesc) values
	('Bartender','serves drinks'),
	('Waitress','Takes orders and serves food'),
	('Janitor','various cleaning tasks'),
	('Shopkeep','sells taverns wares and services'),
	('Shady Vendor','sells questionable wares');

INSERT INTO Workers (Worker) values
	('Uther Bolitho'),
	('Comoere Martin'),
	('Humfra Roskruge'),
	('Freoc Killigrew'),
	('Catgutic Rosevear'),
	('Brytthael Trewella'),
	('Bleidiud Bennetto'),
	('Dofagan Dowrick'),
	('Clemmo Runnalls'),
	('Casworon Trewarne');


INSERT INTO WorkRoles (WorkerID, RoleID) Values
	(1,1),
	(2,1),
	(3,1),
	(4,2),
	(5,2),
	(6,3),
	(7,4),
	(8,4),
	(9,4),
	(10,5);

INSERT INTO Supplies(Unit, Item, Stock, Price) values
	(1,1, 1, 1)
	;

INSERT INTO Inventory(SupplyID,TavernID,Cost,Received) values
	(1, 1, 23.50, 23.50)

;

INSERT INTO TavernServices (Service, cost, status) values
	('Sword Honing', 23.50, 'Available')
;

INSERT INTO Sales(CustID,ServiceID,TavernID,Price,QuantPurch,PurchDate) values
	(1,1,1,23.50,2, '2004-05-23 12:25:10')
;

SELECT * FROM Taverns T
--JOIN Rats R ON T.ID = R.TavernID;-- shows only taverns with rats, sorted by Rats table ID
SELECT * FROM Workers

SELECT * FROM TavernServices

SELECT * FROM Sales



