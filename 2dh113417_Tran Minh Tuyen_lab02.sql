use master 
if exists(select * from sysdatabases where name='saleManager')
drop database saleManager
go
create database saleManager
go
use saleManager

create table CUSTOMER
(
	CustomerId int constraint PK_CUSTOMER primary key,
    FirstName nvarchar(10), 
    LastName nvarchar(20), 
    City nvarchar(40), 
    Phone char(10), 
);
create table CUSTOMERORDER 
(
    OrderId int constraint PK_CUSTOMERORDER primary key,
	CustomerId int ,
	OrderDate date ,
	TotalAmount int,
);

create table ORDERITEM 
(
	OrderItemId int constraint PK_ORDERITEM primary key,
	OrderID int ,
	ProductId int, 
	UnitPrice decimal (12, 1) ,
	Quantity int ,
);
create table PRODUCT 
(
		ProductId int constraint PK_PRODUCT primary key,
		ProductName nvarchar (50) ,
		SupplierId int ,
		UnitPrice int ,
		Unit nvarchar (20),
		IsDiscontiued bit ,
);
create table SUPPLIER 
(
	SupplierId int constraint PK_SUPPLIER primary key,
	CompanyName nvarchar(40),
	ContactFirstName nvarchar(10),
	ContactLastName nvarchar (20),
	CompanyAdress nvarchar(40),
	Phone char (40),
);

alter table CUSTOMER add Female bit default 1;

exec sp_columns CUSTOMER
exec sp_tables
exec sp_columns CUSTOMERORDER
exec sp_columns ORDERITEM
exec sp_columns SUPPLIER