USE RealEstateSystemDB;

-- calculate rent/buying price
GO
CREATE FUNCTION CalculatePrice
(
  @REObjectID int,
  @coefficient decimal
)
RETURNS int 
AS 
-- Returns the stock level for the product.
BEGIN
  DECLARE @ret int;
  SELECT @ret = ((reo.SQM * z.PricePerSqm) * @coefficient)
  FROM RealEstateObject as reo 
  INNER JOIN Zipcode AS z ON reo.ZipCodeID = z.ZipCodeID
  WHERE RealEstateObjectID = @REObjectID       
  IF (@ret IS NULL) 
    SET @ret = 0;
  RETURN @ret;
END

-- 1. Lista alla m�klare f�r en viss stad
GO
CREATE PROCEDURE ListAgentFrCity
  @City NVARCHAR(50)
AS
BEGIN
  SELECT (p.FirstName + ' ' + p.LastName) AS 'Full Name', c.CityName AS 'City' 
		FROM Person AS p INNER JOIN City AS c ON p.CityID = c.CityID
		WHERE c.CityName =  @City  AND p.Discriminator = 'Agent'
END

-- 2. Lista topp fem/tio objekt som blev s�lda p� ett visst omr�de; 
GO 
CREATE PROC ListSoldItemsInArea
  @ZipID int
AS
BEGIN 
SELECT TOP 5 RealEstateObjectID, EstateType, Sqm, Address, DateOnMarket, SaleDate, z.ZipCodes AS [Zipcode]
  FROM RealEstateObject AS reo
  INNER JOIN ZipCode AS z ON reo.ZipCodeID = z.ZipCodeID
  WHERE reo.ZipCodeID = @ZipID AND SaleDate IS NOT NULL 
END

-- 3. Lista aktuella visningar f�r en viss stad
GO
CREATE PROCEDURE ViewingForACertainCity
  @city nvarchar(50)
 
  
AS
BEGIN
  SET NOCOUNT ON;

  SELECT r.Contract, r.EstateType AS 'Estate type', (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name],(Customer.FirstName + ' ' + Customer.LastName) AS 'Customer full name', r.Sqm AS 'Square meters', r.Address, c.CityName AS 'City', z.ZipCodes AS 'Zip code', r.DateOnMarket AS 'Date on Market', v.ViewingStart AS [View Date]
  FROM RealEstateObject AS r
  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = r.AgentID
  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Customer') AS Customer ON Customer.PersonID = r.CustomerID
  JOIN City AS c ON r.CityID = c.CityID
  JOIN ZipCode AS z ON r.ZipCodeID = z.ZipCodeID
  JOIN Viewing AS v ON r.RealEstateObjectID = v.RealEstateObjectID
  WHERE CityName =  @city  
END

--2 A: Visa en lista �ver kunder f�r en viss m�klare
GO
CREATE PROCEDURE ListCustomersAgent
  @Agent NVARCHAR(50)
AS
BEGIN 
  SELECT DISTINCT temp.FirstName as Customer, p.FirstName AS Agent FROM Person AS p 
		INNER JOIN RealEstateObject AS r  ON   p.PersonID = r.AgentID
		INNER JOIN (SELECT FirstName, PersonID FROM Person Where Person.Discriminator = 'Customer') as temp ON temp.PersonID = r.CustomerID
		WHERE p.FirstName = @Agent
END

-- 5. Lista kontaktinformation (kontorets adress, m�klarens email, adress) om diverse m�klare/st�der; 
GO
CREATE PROC ListContactInformationOfBrokers
AS
BEGIN
  SELECT (FirstName + ' '+ LastName) AS [Agent full name], Email, OfficeName AS [Office], Office.Address 
    FROM Person
    JOIN Office ON Person.OfficeID = Office.OfficeID
    WHERE Person.Discriminator = 'Agent'
END

-- 6. Visa hur mycket m�klaren har tj�nat i en viss stad under en viss tidsperiod
GO
CREATE PROCEDURE AgentEarn 
  @city as nvarchar(50), 
  @salePeriodStart date, 
  @salePeriodStop date
AS
BEGIN
  SET NOCOUNT ON;

  SELECT (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name], c.CityName AS [City], SUM(r.Sqm * z.PricePerSqm * 0.05) AS Profit
  FROM Person AS p
  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = p.PersonID
  JOIN City AS c ON p.CityID = c.CityID
  JOIN ZipCode AS z ON p.ZipCodeID = z.ZipCodeID
  JOIN RealEstateObject AS r ON r.AgentID = p.PersonID
  WHERE c.CityName = @city AND r.SaleDate BETWEEN @salePeriodStart AND @salePeriodStop
  GROUP BY Agent.FirstName,Agent.LastName ,c.CityName
END

-- 7. Visa hur mycket f�retaget tj�nade under en viss tidsperiod
GO
CREATE PROC spBenefitsYear
  @DateInitial DATE, 
  @DateFinal DATE
AS
BEGIN
  SELECT r.EstateType AS 'Estate type', ((r.sqm * z.PricePerSqm *4)/10) AS Profits  
		FROM RealEstateObject AS r 
		INNER JOIN ZipCode AS z ON r.ZipCodeID = z.ZipCodeID
		WHERE r.SaleDate IS NOT NULL AND r.SaleDate BETWEEN @DateInitial AND @DateFinal
		ORDER BY Profits ASC  
END

-- 8. Lista alla objekt fr�n alla ObjektS�ljare var f�r sig; 
-- Hemsidan g�r detta automatisk
GO
CREATE PROC ListObjectsCustomer
AS
BEGIN
  SELECT (FirstName + ' ' + LastName) AS [Customer full name], Address, Email  
    FROM Person
    WHERE Person.Discriminator = 'Customer'
END

-- 9. Lista alla objekt fr samma ObjektS�ljare
GO
USE RealEstateSystemDB
GO
CREATE PROC ListObjectsBySeller (@Customer AS NVARCHAR(50)=N'') AS
BEGIN
	SELECT r.[Contract], r.EstateType AS 'Estate type', (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name],
	(Customer.FirstName + ' ' + Customer.LastName) AS [Customer full name], r.Sqm AS 'Square meters', r.Address, c.CityName AS 'City', z.ZipCodes AS 'Zip code', r.DateOnMarket AS 'Date on Market', r.SaleDate AS 'Sale Date'
	  FROM RealEstateObject AS r
	  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = r.AgentID
	  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Customer') AS Customer ON Customer.PersonID = r.CustomerID
	  JOIN City AS c ON r.CityID = c.CityID
	  JOIN ZipCode AS z ON r.ZipCodeID = z.ZipCodeID
	  WHERE Customer.FirstName = @Customer
END
--GO
--CREATE PROCEDURE ListObjectsBySeller
--  @seller int
--AS
--BEGIN
--  SET NOCOUNT ON;

--  SELECT *
--  FROM RealEstateObject
--  WHERE CustomerID = @seller
--END

-- 10. Visa antalet s�ljare fr ett visst omr�de.
Go
Use RealEstateSystemDB
GO
CREATE PROC NumberOfSellersInCity (@City AS NVARCHAR(MAX)) AS
  BEGIN
  SELECT COUNT(Discriminator) AS 'Number of Customers', c.CityName AS City FROM Person AS p 
		INNER JOIN City AS c ON p.CityID = c.CityID 
		WHERE  p.Discriminator IN (N'Customer') AND c.CityName = @City
		GROUP BY  c.CityName;			
END

-- 11. Visa alla objekt som s�ljs av samma m�klare; 
GO
CREATE PROC  ListOfObjectsBeingSoldByTheSameBroker AS
	BEGIN
		  SELECT r.Contract, r.EstateType AS 'Estate type', (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name],
		  (Customer.FirstName + ' ' + Customer.LastName) AS 'Customer full name', r.Sqm AS 'Square meters', r.Address, 
		  c.CityName AS 'City', z.ZipCodes AS 'Zip code', r.DateOnMarket AS 'Date on Market', r.SaleDate AS 'Sale Date'
		  FROM RealEstateObject AS r
		  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = r.AgentID
		  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Customer') AS Customer ON Customer.PersonID = r.CustomerID
		  JOIN City AS c ON r.CityID = c.CityID
		  JOIN ZipCode AS z ON r.ZipCodeID = z.ZipCodeID
		  
		  
	END

--GO
--CREATE PROC ListOfObjectsBeingSoldByTheSameBroker 
--AS
--BEGIN
--  SELECT RealEstateObjectID, Address, DateOnMarket, AgentID
--    FROM RealEstateObject
--    WHERE AgentID = 1 
--END

-- 12. Visa alla objekt som s�ljs av en viss m�klare
GO
CREATE PROCEDURE ListObjectsByAgents
  (@agent NVARCHAR(50) = N'')
AS
BEGIN
  SET NOCOUNT ON;

  SELECT r.Contract, r.EstateType AS 'Estate type', (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name],(Customer.FirstName + ' ' + Customer.LastName) AS 'Customer full name', r.Sqm AS 'Square meters', r.Address, c.CityName AS 'City', z.ZipCodes AS 'Zip code', r.DateOnMarket AS 'Date on Market', r.SaleDate AS 'Sale Date'
		  FROM RealEstateObject AS r
		  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = r.AgentID
		  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Customer') AS Customer ON Customer.PersonID = r.CustomerID
		  JOIN City AS c ON r.CityID = c.CityID
		  JOIN ZipCode AS z ON r.ZipCodeID = z.ZipCodeID
		  WHERE Agent.FirstName = @Agent AND r.SaleDate IS NULL
END

-- 13. Lista alla gatuadresser f�r objekt som s�ldes p� en viss datum
GO
CREATE PROC spAddressSold
  @DateInitial DATE, 
  @DateFinal DATE
AS
BEGIN
  SELECT r.Address, r.SaleDate AS 'Date of Sale' FROM RealEstateObject AS r 
  WHERE r.SaleDate IS NOT NULL AND r.SaleDate Between @DateInitial AND @DateFinal
END

-- 14. Lista alla objekt �ver en viss pris
GO
CREATE PROCEDURE AllObjectOverACertainPrice
  @price money
AS
BEGIN
  SET NOCOUNT ON;

		  SELECT r.Contract, r.EstateType AS [Estate type], (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name],(Customer.FirstName + ' ' + Customer.LastName) AS 'Customer full name', 
		  r.Sqm AS 'Square meters', r.Address, c.CityName AS 'City', z.ZipCodes AS 'Zip code', r.DateOnMarket AS 'Date on Market', r.SaleDate AS 'Sale Date', SUM(r.Sqm * z.PricePerSqm) AS Price
		  FROM RealEstateObject AS r
		  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = r.AgentID
		  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Customer') AS Customer ON Customer.PersonID = r.CustomerID
		  JOIN City AS c ON r.CityID = c.CityID
		  JOIN ZipCode AS z ON r.ZipCodeID = z.ZipCodeID		  
		  WHERE SaleDate IS NULL AND sqm * PricePerSqm > @price
		  GROUP BY r.Contract, r.EstateType, Agent.FirstName, Agent.LastName,Customer.FirstName, Customer.LastName,r.Sqm,r.Address,c.CityName,z.ZipCodes,r.DateOnMarket,r.SaleDate,r.Sqm, z.PricePerSqm
END

-- 15. Lista alla objekt fr�n ett visst omr�de
GO
CREATE PROC spAllObjCity
  @City NVARCHAR(50)
AS
BEGIN
  SELECT r.Contract,r.EstateType AS 'Estate type', r.Address, r.DateOnMarket AS 'Date on Market',r.SaleDate AS 'Sale Date', c.CityName AS City
  FROM RealEstateObject AS r INNER JOIN City AS c ON r.CityID = c.CityID
  WHERE c.CityName = @City;
END

-- 16. Lista alla objekt som har visning p� ett visst datum
GO
CREATE PROCEDURE ViewingOnCertainDate
  @date AS date
AS
BEGIN
  SET NOCOUNT ON;

  SELECT r.Contract,r.EstateType AS 'Estate type', r.Address, (Agent.FirstName + ' ' + Agent.LastName) AS [Agent full name], 
  v.ViewingStart AS [Viewing start],v.ViewingStop AS [Viewing stop]
  FROM Viewing AS v
  JOIN (SELECT PersonID, FirstName, LastName FROM Person WHERE Discriminator = N'Agent') AS Agent ON Agent.PersonID = v.AgentID
  JOIN RealEstateObject AS r ON r.RealEstateObjectID = v.RealEstateObjectID
  WHERE ViewingStart BETWEEN @date AND DATEADD(day, 1, @date)
END

-- 17. Visa antalet potentiella k�pare som kommer p� en viss visning. 
GO
CREATE PROC usp_ShowCustomersForViewing
  @ViewID INT
AS
BEGIN
  SET NOCOUNT ON;
  SELECT v.RealEstateObjectID as [Listing ID], reo.[Address], COUNT(vc.CustomerID) as [Number of Customers] 
  FROM ViewingCustomer AS vc
  INNER JOIN Viewing AS v ON vc.ViewingID = v.ViewingID
  INNER JOIN RealEstateObject AS reo ON v.RealEstateObjectID = reo.RealEstateObjectID
  WHERE vc.ViewingID = @ViewID
  GROUP BY v.RealEstateObjectID, reo.[Address]
END

-- 18. Snitt priset p� s�lda fastigheter p�  ett visst omr�de.
GO
CREATE PROC usp_AveragePriceForSoldObjectsInArea
  @CityName NVARCHAR(50)
AS
BEGIN
  SET NOCOUNT ON;
  SELECT CityName AS City, ZipCodes AS Zipcode, AVG(temp.Total) AS [Average Price] 
  FROM (SELECT (reo.Sqm * z.PricePerSqm)as [Total], reo.SaleDate, c.CityName, z.ZipCodes 
    FROM RealEstateObject AS reo
	INNER JOIN ZipCode AS z ON reo.ZipCodeID = z.ZipCodeID
	INNER JOIN CITY AS c ON reo.CityID = c.CityID) AS Temp
  WHERE Temp.SaleDate IS NOT NULL AND temp.CityName = @CityName
  GROUP BY temp.CityName, temp.ZipCodes
END

-- 19. Sammanlagda s�lda objekt f�r ett visst kontor under en viss tidsperiod.
GO
CREATE PROC GetAgentsSaleStatisticsForPeriod
  @Date1 DATE,
  @Date2 DATE 
AS
BEGIN
  IF @Date1 < @Date2
  BEGIN 
    SELECT COUNT(reo.SaleDate) as [Number of sold objects], o.OfficeName AS Office
	FROM RealEstateObject AS reo
	INNER JOIN person as p ON reo.AgentID = p.PersonID
	INNER JOIN office as o ON p.OfficeID = o.OfficeID
	WHERE p.Discriminator = 'Agent' AND reo.SaleDate IS NOT NULL AND
	reo.SaleDate BETWEEN @Date1 AND @Date2
	GROUP BY o.OfficeName
  END
  ELSE
  BEGIN
    PRINT 'The first date must be earlier than the second date.'
  END
END

-- TRANSACTION
GO

USE RealEstateSystemDB

GO

CREATE PROC BookViewing(@ViewID INT, @CustID INT) AS
	SET NOCOUNT OFF;
	BEGIN 
	BEGIN TRAN

	DECLARE @Flag INT
	SET @Flag = 1

	DECLARE @MaxCustomers INT
	SET @MaxCustomers = (SELECT v.MaximumNoCustomerPerViewing FROM Viewing AS v WHERE v.ViewingID = @ViewID)

	DECLARE @NumberOfBookings INT
	SET @NumberOfBookings = (SELECT COUNT(CustomerID) FROM ViewingCustomer AS vc WHERE vc.ViewingID = @ViewID)
	
	IF EXISTS(SELECT vc.ViewingID, vc.CustomerID FROM ViewingCustomer AS vc
			  WHERE vc.ViewingID = @viewID AND vc.CustomerID = @CustID)
			  BEGIN
				PRINT 'This customer has already placed a booking for this view.'
				SET @Flag = 0;
			  END;

	IF (@NumberOfBookings) >= (@MaxCustomers)
		BEGIN
			PRINT 'There is no available spots for this viewing, contact the agent.'
		SET @Flag = 0;
	END;

	IF NOT EXISTS(SELECT p.PersonID FROM Person AS p WHERE p.Discriminator = 'Customer' AND p.PersonID = @CustID)
		BEGIN
			PRINT 'Customer does not exist'
			SET @Flag = 0
		END;
	IF (SELECT p.Discriminator FROM Person AS p WHERE p.PersonID = @CustID) = 'Agent'
		BEGIN
			PRINT 'The ID entered is not a customer'
			SET @Flag = 0
		END

	IF @Flag = 0
		BEGIN
			PRINT 'Booking Canceled'
			ROLLBACK TRAN;
		END;
	ELSE
		BEGIN
		INSERT INTO ViewingCustomer(ViewingID, CustomerID)
			VALUES (@ViewID, @CustID)
			COMMIT TRAN;
		END;
	END;

-- ****************************************************************
-- ************************** TRIGGERS ****************************
-- ****************************************************************



--T2 when saleDate < DateOnMarket
GO

USE RealEstateSystemDB;

GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'tr_Check_Date'
)
	DROP TRIGGER tr_Check_Date
GO

CREATE TRIGGER tr_Check_Date ON dbo.RealEstateObject 
	AFTER INSERT, UPDATE AS
		BEGIN
			DECLARE @SaleDate AS DATETIME
			SET @SaleDate = (SELECT inserted.SaleDate FROM INSERTED)
			DECLARE  @DateOnMarket AS DATETIME 
			SET @DateOnMarket = (SELECT inserted.DateOnMarket FROM INSERTED)
			IF (@SaleDate < @DateOnMarket) 
				BEGIN
					PRINT 'Realestate can NOT be sold before it came out to the market.'
				ROLLBACK TRANSACTION
				END
		END;
GO	




-- T4. Viewing start > DateOnMarket 
GO
USE [RealEstateSystemDB]
GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'tr_ViewingStart'
)
	DROP TRIGGER tr_ViewingStart
GO

CREATE TRIGGER [dbo].[tr_ViewingStart] ON [dbo].[Viewing] 
	AFTER INSERT, UPDATE
AS 
BEGIN 
IF (SELECT COUNT(*)
	FROM inserted
	JOIN RealEstateObject ON RealEstateObject.RealEstateObjectID = inserted.RealEstateObjectID
	WHERE ViewingStart < DateOnMarket OR ViewingStop < DateOnMarket) = 1
	BEGIN
		PRINT 'Viewing can NOT begin before the realestate came on the market.' 
		ROLLBACK TRANSACTION
	END
END
GO


-- T5. Insert  a new Viewing is not possible when the realestate is already sold. (OK /Robin)
USE RealEstateSystemDB
GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'tr_NewViewingBySoldRE'
)
	DROP TRIGGER tr_NewViewingBySoldRE
GO

CREATE TRIGGER tr_NewViewingBySoldRE ON Viewing 
	AFTER INSERT, UPDATE
AS 
BEGIN
IF (SELECT COUNT(*)
	FROM inserted
	JOIN RealEstateObject ON RealEstateObject.RealEstateObjectID = inserted.RealEstateObjectID
	WHERE SaleDate IS NOT NULL) = 1
	BEGIN
		PRINT 'Viewing is not possible because the realestate is sold.' 
		ROLLBACK TRANSACTION
	END
END
GO


-- T6. Insert ViewingStop is not possible when it's less than ViewingStart 
USE RealEstateSystemDB
GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'tr_ViewingStopLessThanStart'
)
	DROP TRIGGER tr_ViewingStopLessThanStart
GO

CREATE TRIGGER tr_ViewingStopLessThanStart ON Viewing 
	AFTER INSERT, UPDATE
AS 
BEGIN
IF (SELECT COUNT(*)
	FROM inserted
	WHERE ViewingStart >= ViewingStop) = 1
	BEGIN
		PRINT 'Viewing can NOT finish before it was begun.' 
		ROLLBACK TRANSACTION
	END
END
GO


--T7. Sqm should not be too big

USE RealEstateSystemDB
GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = 'tr_TooBigRE'
)
	DROP TRIGGER tr_TooBigRE
GO

CREATE TRIGGER tr_TooBigRE ON RealEstateObject 
	AFTER INSERT
AS 
BEGIN 
DECLARE @MaxSize INT
SET @MaxSize = 10000
IF (SELECT COUNT(*)
	FROM inserted
	WHERE sqm > @MaxSize) = 1
	BEGIN
		PRINT 'The size of the realestate is unrealistic.' 
		ROLLBACK TRANSACTION
	END
END
GO
