---1.ROW_NUMER()
--2. RANK()
--3. DENSE_RANK()


--Requirements:
--1. Which product has max sales quantity
with cte as (
select productid,sum(orderqty) as quantity_sold 
from [SalesLT].[SalesOrderDetail] 
group by productid
)
select name,productnumber,quantity_sold,[Product].productid from [SalesLT].[Product]
inner join cte on cte.productid=[SalesLT].[Product].productid
order by quantity_sold desc

----2.top 3 sales order / product
with cte as (
select productid,orderqty,row_number() over(partition by productid order by orderqty desc) as row_num 
from [SalesLT].[SalesOrderDetail] )
select * from cte where row_num<=3


--3. top 10 selling products
with cte as (
select productid,sum(orderqty) as quantity_sold 
from [SalesLT].[SalesOrderDetail] 
group by productid
),
cte2 as (
select name,productnumber,quantity_sold,[Product].productid ,
row_number() over(order by quantity_sold desc) as row_num
from [SalesLT].[Product]
inner join cte on cte.productid=[SalesLT].[Product].productid
)
select * from cte2 where row_num<=10

--3. top 10 rank selling products
with cte as (
select productid,sum(orderqty) as quantity_sold 
from [SalesLT].[SalesOrderDetail] 
group by productid
),
cte2 as (
select name,productnumber,quantity_sold,[Product].productid ,
rank() over(order by quantity_sold desc) as row_num
from [SalesLT].[Product]
inner join cte on cte.productid=[SalesLT].[Product].productid
)
select * from cte2 where row_num<=10

--3. top 10 equivalent selling products
with cte as (
select productid,sum(orderqty) as quantity_sold 
from [SalesLT].[SalesOrderDetail] 
group by productid
),
cte2 as (
select name,productnumber,quantity_sold,[Product].productid ,
dense_rank() over(order by quantity_sold desc) as row_num
from [SalesLT].[Product]
inner join cte on cte.productid=[SalesLT].[Product].productid
)
select * from cte2 where row_num<=10

----Requirement: latest order placed by each customer with their order product and customer details how much amount-- CST
--latest customer data
with cte as (
select productid,customerid,orderqty,(orderqty*unitprice) as orderamt,row_number() over(partition by customerid order by salesorderdetailid desc) as row_num from 
[SalesLT].[SalesOrderDetail]
inner join [SalesLT].[SalesOrderHeader] on [SalesLT].[SalesOrderHeader].salesorderid=[SalesLT].[SalesOrderDetail].salesorderid)
--main query
select cte.productid,cte.customerid,name as productname,concat(firstname,middlename) as customername,orderqty,orderamt from cte 
inner join [SalesLT].[Product] on [SalesLT].[Product].productid=cte.productid
inner join [SalesLT].[Customer] on [SalesLT].[Customer].customerid=cte.customerid
where row_num=1
order by orderamt desc