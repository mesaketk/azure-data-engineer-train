----Common Table Expressions

with cte as (
SELECT SalesLT.Product.ProductID,ListPrice,OrderQty,LineTotal,((ListPrice*OrderQty)-LineTotal) AS ' Discount Amount'
FROM SalesLT.Product JOIN SalesLT.SalesOrderDetail
ON SalesLT.Product.ProductID=SalesLT.SalesOrderDetail.ProductID
ON SalesLT.Product.ProductID=SalesLT.SalesOrderDetail.ProductID
),
cte2 as (select * from [SalesLT].[Customer])
select * from cte
inner join cte2 on 


with cte as (select [SalesLT].[SalesOrderDetail].[productid] from SalesLT.SalesOrderDetail) 
SELECT *
FROM SalesLT.Product 
inner join cte
on cte.productid=Product.productid

