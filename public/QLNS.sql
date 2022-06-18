Create database QLNS
go
use QLNS
go
Create table Banner(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Images nvarchar(150),
Status bit,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Blog(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Description nvarchar(200),
Images nvarchar(150),
Status bit,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Account(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Email nvarchar(150),
Phone nvarchar(150),
Address nvarchar(150),
Birthday nvarchar(150),
Gender bit,
Role bit,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Category(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Description nvarchar(200),
Status bit,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Product(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
CategoryID int foreign key references Category(ID),
Description nvarchar(200),
Status bit,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Orders(
ID int identity primary key,
Code nvarchar(50),
Name nvarchar(150),
Email varchar(150),
Phone varchar(150),
Address nvarchar(150),
TotalQuantity int,
TotalPrice float,
Status bit,
AccountID int foreign key references Account(ID),
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)

go
Create table OrderDetail(
ID int identity primary key,
ProductID int foreign key references Product(ID),
OrderID int foreign key references Orders(ID),
Price float,
Quantity int,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Favorite(
ID int identity primary key,
ProductID int foreign key references Product(ID),
AccountID int foreign key references Account(ID),
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Rating(
ID int identity primary key,
ProductID int foreign key references Product(ID),
AccountID int foreign key references Account(ID),
Star float,
Description nvarchar(200),
Status bit,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)