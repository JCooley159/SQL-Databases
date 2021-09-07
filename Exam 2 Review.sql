#Query 1
Select ItemID, ItemDescription FROM ITEM WHERE ItemCost >= 3000;

#Query 2
SELECT ItemID, ItemDescription FROM ITEM WHERE ItemCost >= 1000 AND ItemDescription LIKE 'Antique%';

#Query 3
SELECT CompanyName, Address, Phone FROM VENDOR WHERE CompanyName IS NOT NULL;

#Query 4
SELECT LastName, FirstName, Phone, Email FROM EMPLOYEE
	WHERE Email LIKE '%.Stuart%'
	ORDER BY FirstName;
    
#Query 5    
SELECT ItemID, PurchaseDate, ItemCost, ItemPrice, (ItemPrice - ItemCost) AS PriceMarkup FROM ITEM;

#Query 6
SELECT DISTINCT FirstName, LastName, Phone FROM CUSTOMER AS C
	INNER JOIN SALE AS S
		ON C.CustomerID = S.CustomerID
        WHERE Subtotal >= 500;
    
#Query 7
SELECT FirstName, LastName, Phone, SaleDate, Subtotal FROM Employee, Sale
	WHERE Subtotal >= 3000;
    
#Query 8    
SELECT ItemID, ItemDescription, ItemPrice, CompanyName FROM ITEM AS I
	INNER JOIN VENDOR AS V
		ON I.VendorID = V.VendorID
        WHERE I.ItemID = 1;
        
#Query 9
SELECT LastName, FirstName, Phone, Count(SaleID) AS NumberSalesTransactions, SUM(Subtotal) AS TotalSalesAmount FROM SALE AS S
	INNER JOIN CUSTOMER AS C
		ON S.CustomerID = C.CustomerID;
        
#Query 10
SELECT ItemID, ItemDescription FROM Item WHERE ItemID NOT IN (SELECT ItemID FROM SALE_ITEM);