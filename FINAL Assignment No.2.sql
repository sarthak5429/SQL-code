

--Q1) Create   Database Name as Order_Stores_Data 

create database Order_Stores_Data 

use Order_Stores_Data 




--Q2) Create two Table names as Orders_Table and Stores_Table


create table Orders_Table (OrderDate int	,Region varchar(20),	Rep varchar(20),	Order_Item varchar(20),	Units int,	Unit_Cost int,	Total_Price int,	Order_Id int)

alter table Orders_Table alter column OrderDate varchar(20)

create table Stores_Table (Store_Id int,	StoreType varchar(20),	Assortment int,	CompetitionDistance int,	Month int,	Year int,	PromoInterval varchar(20))





--Q3) Insert All records present here in the Orders_table and Stores_Table


insert into Orders_Table values ('1-6-21',	'East',	'Aruna',	'Pencil',	95,	 1.99, 	 189.05, 	1)


insert into Orders_Table values ('1-23-21',	'Central',	'Kivell',	'Eraser',	50,	 19.99, 	 999.50, 	2)


insert into Orders_Table values ('2-9-21',	'Central',	'Ganesh',	'-',	36,	 4.99, 	 179.64, 	3)


insert into Orders_Table values ('2-26-21',	'Central',	'Payal','-',		27, 19.99, 	 539.73, 	4)


insert into Orders_Table values ('3-15-21',	'West',	'Sorvino','-',		56,	 2.99, 	 167.44, 	5)


insert into Orders_Table values ('4-1-21',	'East'	,'Hitesh',	'Pencil',	60,	 4.99, 	 299.40, 	6)


insert into Orders_Table values ('4-18-21',	'Central',	'Akshita','-',		75,	 1.99, 	 149.25, 	7)


insert into Orders_Table values ('5-5-21',	'Central',	'Ruchika',	'Books',	90,	 4.99, 	 449.10, 	8)


insert into Orders_Table values ('5-22-21',	'West',	'Surbhi', '-',		32,	 1.99, 	 63.68, 	9)


insert into Orders_Table values ('6-8-21',	'East',	'Jones',	'Suitcase',	60,	 8.99, 	 539.40, 	10)
 



 
insert into stores_Table values (1,	'c',	30,	1270,	9,	2008,	'Jan')


 
insert into stores_Table values (2,	'a',	36,	570,	11,	2007,	'Feb')


 
insert into stores_Table values (3,	'a',	31,	14130,	12,	2006,	'Mar')


 
insert into stores_Table values (4,	'c',	25,	620,	9,	2009 ,'-')	


 
insert into stores_Table values (5,	'a',	20,	29910,	4,	2015,	'May')


 
insert into stores_Table values (6,	'a',	21,	310,	12,	2013,	'June')


 
insert into stores_Table values (7,	'a',	32,	24000,	4,	2013 ,'-')	


 
insert into stores_Table values (8,	'a',	35,	7520,	10,	2014,	'Aug')


 
insert into stores_Table values (9,	'a',	25,	2030,	8,	2000,'-')



insert into stores_Table values (10,	'a',	44,	3160,	9,	2009,	'Oct')


select * from stores_Table
go
select * from orders_Table




--Q3) Make Order_Id  Column as Primary Key.
 

alter table orders_table add primary key(order_id)



--Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.


alter table stores_table add store_names varchar(20)

update stores_table set store_names = 'Car' where Store_Id = 1

update stores_table set store_names = 'bikes' where Store_Id = 2

update stores_table set store_names = 'hardware' where Store_Id = 3

update stores_table set store_names = 'electrics' where Store_Id = 4

update stores_table set store_names = 'fibres' where Store_Id = 5

update stores_table set store_names = 'elastics' where Store_Id = 6

update stores_table set store_names = 'books' where Store_Id = 7

update stores_table set store_names = 'shoes' where Store_Id = 8

update stores_table set store_names = 'cloths' where Store_Id = 9

update stores_table set store_names = 'scraps' where Store_Id = 10




--Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table


select * from orders_table
alter table stores_table add foreign key (store_id) references Orders_Table(order_id)




--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet


update Orders_Table set order_item = 'compass' where order_id=3

update Orders_Table set order_item = 'torch' where order_id=4

update Orders_Table set order_item = 'phone' where order_id=5

update Orders_Table set order_item = 'laptop' where order_id=7

update Orders_Table set order_item = 'box' where order_id=9



--Q7) Update the missing records in the PromoInterval Column in Stores Table.


update Stores_Table set  promointerval= 'april' where store_id=4

update Stores_Table set  promointerval= 'july' where store_id=7

update Stores_Table set  promointerval= 'september' where store_id=9




--Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.


sp_rename 'Stores_Table.assortment','store_nos'





--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.


select * from Stores_Table

sp_rename 'orders_Table.order_item','item_name'

sp_rename 'orders_Table.rep','customers_names'





--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.


select unit_cost,order_id 
from Orders_Table
order by Unit_Cost desc 

select unit_cost,order_id,total_price 
from Orders_Table
order by total_price asc



--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.


sp_rename 'Orders_Table.customers_names','cus_name'

select count(cus_name) 
from Orders_Table
where region='east'
go
select count(cus_name) 
from Orders_Table
where region='west'
go
select count(cus_name) 
from Orders_Table
where region='central'



--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 



select sum(total_price)
from Orders_Table

select sum(unit_cost)
from Orders_Table




--Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.

create view Order_Stores_Tablesss
as
select Orders_Table.orderdate,Orders_Table.unit_cost,stores_table.StoreType,stores_table.year
from Orders_Table
join Stores_Table
on Orders_Table.Order_Id=stores_table.Store_Id

select * from Order_Stores_Tablesss




--Q14) Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9

select Item_name,Region
from Orders_Table
where Order_Id in (4 , 5, 6 ,9)




--Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160


select [year] from Stores_Table
where CompetitionDistance = 29910  




--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400

select Item_name 
from Orders_Table
where Total_Price between 200 and 400





--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

sp_rename 'stores_table.CompetitionDistance','CD'

select sum(cd)
from stores_table





--Q18) What is the Total Count of Stores_Type and CD columns

select count(StoreType),count(CD)
from Stores_Table





--Q19) Apply the Cross Join in  Orders_Table and Orders_Table.

select Orders_Table.Order_Id,Orders_Table.Item_name,Orders_Table.OrderDate,Orders_Table.Region,Stores_Table.store_nos,Stores_Table.PromoInterval,Stores_Table.Store_Id
from Orders_Table
full outer join stores_table
on Orders_Table.order_id = stores_table.store_id




--Q20) DROP both the databases

drop database Order_Stores_Data




