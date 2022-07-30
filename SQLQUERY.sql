 select *from InventoryMovements;
--select sum(InQuantity) as Total_bought  from InventoryMovements;
--select sum(OutQuantity) as Total_Sold  from InventoryMovements;
--SELECT MAX(OutQuantity) AS Most_sold_Item FROM InventoryMovements;
--SELECT Top(1) itemID  ,SUM(OutQuantity) as Most_sold_Item,COUNT(itemID) as No_of_iteam from InventoryMovements
	--group by(ItemID)
	--order by Most_sold_Item desc;
--SELECT * FROM InventoryMovements WHERE ItemID LIKE '%1%'; -- search integer 1 from iteam

SELECT * FROM InventoryMovements WHERE ItemID LIKE '%I%'; -- search String I from iteam

USE shah;


select * from SaleInvoices;
select * from SaleInvoiceDetails;

select sum(SellPrice) as Sell_duration from SaleInvoiceDetails
	where  IssuedDate between '2022/01/01' and '2022/03/30';

         -- group by SellPrice;

--How many items are sold?
Select sum(SellPrice) as Total_Sales from SaleInvoiceDetails;

--Which is the most profitable item
  select Top(1) ItemID, (SellPrice-CostPrice)*Quantity as Most_profitable from SaleInvoiceDetails
	order by Most_profitable desc;
--Which Item is most expensive?
  select  DISTINCT TOP 2 ItemID, CostPrice as Most_Expensive from SaleInvoiceDetails
	order by Most_Expensive desc;

--Which customer has a high number of sales? Top 5 customers.

select Top(5) CustomerID, sum(GrossTotal) as most_sell 
	from SaleInvoices 
	group by CustomerID
	order by most_sell desc;

--Which category items are generating the most profit? Top 5 categories.

select * from Items;
select * from SaleInvoiceDetails;

select CategoryID, sum((SellPrice-CostPrice)*Quantity) as Most_profitable from SaleInvoiceDetails
	INNER JOIN Items ON SaleInvoiceDetails.ItemID = Items.ItemID
	group by CategoryID 
	;



 --Track Purchases
 select * from PurchaseInvoice;
 select * from PurchaseInvoiceDetails;
 --Top 5 purchases from Supplier?
 Select Top(5) SupplierID, Sum(GrossTotal) as Purchase from PurchaseInvoice
 group by SupplierID;

 -- Most purchases in which Month and Year?
Select Top(1) Year(IssuedDate) as Year ,Month(IssuedDate) as Month,Sum(GrossTotal) as Most_purchase from PurchaseInvoice
	group by Year(IssuedDate), MONTH(IssuedDate)
	order by most_purchase desc
;
--Which Item is Purchased the most? Top 5
Select Top(5) ItemID, sum(CostPrice) as Most_Purchased from PurchaseInvoiceDetails
	group by ItemID
	order by Most_Purchased desc;
--Which Category is purchased the most? Top 5.
select Top(5) CategoryID, sum(CostPrice) as Purchased from PurchaseInvoiceDetails
	INNER JOIN Items ON PurchaseInvoiceDetails.ItemID = Items.ItemID
	group by CategoryID 
	;
 --Track Customers:
 --Total number of customers?
 Select * from Customers;
 Select Count(CustomerID) as Total_Customar from  Customers;
 --Customers from Abbottabad?
 Select * from Customers
	where FullAddress LIKE '%Abbottabad%'; 


select * from SaleInvoices;
select * from SaleInvoiceDetails;

--Customer buying the most quantity of items? Top 5
select Top(5) CustomerID, sum(Quantity) as Most_Quntity from SaleInvoices
	INNER JOIN SaleInvoiceDetails ON SaleInvoices.InvoiceId = SaleInvoiceDetails.SaleInvoiceID
	group by CustomerID
	order by Most_Quntity desc


--Customers providing the most Profit? Top 5.

select Top(5) CustomerID, sum((SellPrice-CostPrice)*Quantity) as Most_Profit from SaleInvoices
	INNER JOIN SaleInvoiceDetails ON SaleInvoices.InvoiceId = SaleInvoiceDetails.SaleInvoiceID
	group by CustomerID
	order by Most_Profit desc
	;


 --Track Customers:
 --Total number of customers?
 Select * from Customers;
 Select Count(CustomerID) as Total_Customar from  Customers;
 --Customers from Abbottabad?
 Select * from Customers
	where FullAddress LIKE '%Abbottabad%'; 


select * from SaleInvoices;
select * from SaleInvoiceDetails;
--Customer buying the most quantity of items? Top 5select Top(5) CustomerID, sum(Quantity) as Most_Quntity from SaleInvoices
	INNER JOIN SaleInvoiceDetails ON SaleInvoices.InvoiceId = SaleInvoiceDetails.SaleInvoiceID
	group by CustomerID
	order by Most_Quntity desc--Customers providing the most Profit? Top 5.
select Top(5) CustomerID, sum((SellPrice-CostPrice)*Quantity) as Most_Profit from SaleInvoices
	INNER JOIN SaleInvoiceDetails ON SaleInvoices.InvoiceId = SaleInvoiceDetails.SaleInvoiceID
	group by CustomerID
	order by Most_Profit desc
	;

