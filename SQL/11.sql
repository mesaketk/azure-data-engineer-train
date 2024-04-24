--indexing
performace optimaztion technique

pros:
it will improve the query perf.
con:
1. reduce write performace
2. consume more mem


--simple index
one column
PK
--composite index
multiple columns


drop table custaddress
--DDL
create table custaddress(customerid integer,firstname varchar(100),address varchar(100),city varchar(100),stateprovince varchar(100),country varchar(100))

--DML
insert into custaddress
select [SalesLT].[CustomerAddress].customerid,firstname,addressline1,city,stateprovince,countryregion from 
[SalesLT].[Customer] 
join [SalesLT].[CustomerAddress] on [SalesLT].[CustomerAddress].customerid=[SalesLT].[Customer].customerid
join [SalesLT].[Address] on [SalesLT].[CustomerAddress].addressid=[SalesLT].[Address].addressid

select * from custaddress 
where country='United States' and stateprovince='California'



select country,stateprovince, count(1)
from custaddress
group by 
country,stateprovince


create index region_index on custaddress(country,stateprovince)--composite

Clustered Index
data stored in sorted manner in physical mem
--read very fast
--writes very slow
Non-Clusterd Index.
data not stored in sorted manner in physical mem
--Partitioning
physically stored in structured manner

partition:
before partition
/data
after partition on country:
/data/United States
/data/Canada
/data/India
---distribute compute
master node--coordinator-1
worker node--processing happens---3
1-10
2-8
3-7




