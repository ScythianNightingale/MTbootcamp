/*drop tables in reverse order of creation*/
DROP TABLE IF exists Sales
DROP TABLE IF exists Guests
DROP TABLE IF exists GuestClass
DROP TABLE IF exists GuestStatus
DROP TABLE IF exists OtherServices
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
	Worker varchar(100),
	RoleID INT
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


/*create table for various statuses*/
CREATE TABLE GuestStatus(
	ID INT IDENTITY,
	GStatus VARCHAR(100)
);

/*guestClass exists specifically to hold classes array */
CREATE TABLE GuestClass(
	ID INT IDENTITY,
	GClass VARCHAR(100)
);

/*create guests table to show relevant info*/
CREATE TABLE Guests (
	ID INT IDENTITY,
	Guest VARCHAR(100),	
	GClassID INT,
	GLevelID INT,
	GNote VARCHAR(MAX),
	GBday DATE,
	GCakeday DATE,
	GStatusID VARCHAR(100)
	PRIMARY KEY (Guest)
);

CREATE TABLE Sales(
	SaleID INT IDENTITY,
	CustID VARCHAR(100),
	TavernID INT,
	SupandServID INT,
	Price MONEY,
	QtyPurch INT,
	PurchDate VARCHAR(100)
	PRIMARY KEY (SaleID),
	FOREIGN KEY (TavernID) REFERENCES Taverns(ID),
	FOREIGN KEY (CustID) REFERENCES Guests(Guest),
);
go

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

INSERT INTO GUESTS (Guest) Values 
	('Jim Darkmagic'),
	('Gladys Wild');


INSERT INTO Sales(CustID,TavernID,SupandServID,Price,QtyPurch,PurchDate) values
	('Jim Darkmagic',1,1,23.50,2, '2004-05-23 12:25:10')
;


/**


INSERT INTO Sales(CustID,TavernID,SupandServID,Price,QtyPurch,PurchDate) values
	(1,2,1,23.50,1, timestamp),
	(2,3,1,23.50,2, timestamp)

should output

SALE ID    |    Guest     |    Tavern    |    Item/Service Purchased   |     Price     |  Qty Purchased   |    PurchDate
   1       | Jim Darkmagic|    Mollys    |      Sword Sharpening       |     23.50     |        1         |    PurchDate
   2       | Gladys Wild  |    Millys    |      Sword Sharpening       |     47.00     |        2         |    PurchDate

need to figure out how to input an int to point to another table, and output as text during "select" command. may not be possible in SQL


*/

/*
SELECT * FROM Taverns 
JOIN Rats ON Taverns.ID = Rats.TavernID;-- shows only taverns with rats, sorted by Rats table ID
SELECT * FROM Workers

SELECT * FROM TavernServices

SELECT * FROM Sales
*/


/*query the database - "SELECT CREATE"
Using Filter "Where"
ex. generate the following several times in order to display a select statement to display each individual tavern
Select * from taverns where name = 'the mended drum'*/

--SELECT * FROM Taverns WHERE Taverns.Tavern = + Taverns.Tavern --incorrect for the guide

--select CONCAT('select * from Taverns where Tavern =''',Tavern, '''') FROM Taverns  --outputs string with given data

--select 'select * from Taverns where Tavern = ''' + Taverns.tavern + '''' FROM Taverns  --same result as CONCAT but more cumbersome

