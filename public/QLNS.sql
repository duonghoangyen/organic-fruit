Create database QLNS;
go
use QLNS;
go
Create table Banner(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Images nvarchar(150),
Status bit,
CreatedDate date,
ModiredDate date
);
go
Create table Blog(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Description nvarchar(200),
Images nvarchar(150),
Status bit,
CreatedDate date,
ModiredDate date
);
go
Create table Account(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Email nvarchar(150),
Phone nvarchar(150),
Address nvarchar(150),
Birthday nvarchar(150),
Role bit,
Gender bit,
CreatedDate date,
ModiredDate date
);
go
Create table Category(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Description nvarchar(200),
Status bit,
CreatedDate date,
ModiredDate date
);
go
Create table Product(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
CategoryID int foreign key references Category(ID),
Description nvarchar(200),
Status bit,
CreatedDate date,
ModiredDate date
);
go
Create table Order(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Email nvarchar(150),
Phone nvarchar(150),
Address nvarchar(150),
TotalQuantity float,
TotalPrice float,
Status bit,
AccountID int foreign key references Account(ID),
CreatedDate date,
ModiredDate date
);

go
Create table OrderDetail(
ID int identity primary key,
ProductID int foreign key references Product(ID),
OrderID int foreign key references Order(ID),
Price float,
Quantity int,
CreatedDate date,
ModiredDate date
);
go
Create table OrderDetail(
ID int identity primary key,
ProductID int foreign key references Product(ID),
AccountID int foreign key references Account(ID),
Price float,
Quantity int,
CreatedDate date,
ModiredDate date
);
go
Create table Rating(
ID int identity primary key,
ProductID int foreign key references Product(ID),
AccountID int foreign key references Account(ID),
Star float,
Description nvarchar(200),
Status bit,
CreatedDate date,
ModiredDate date
);