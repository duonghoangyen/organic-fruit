Create database QLNS;
go
use QLNS;
go
Create table Banner(
ID int identity primary key,
Code nvarchar(50) not null,
Name nvarchar(150) not null,
Images nvarchar(150) not null,
Status bit default 1,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Blog(
ID int identity primary key,
Code nvarchar(50) not null,
Name nvarchar(150) not null,
Description nvarchar(200) not null,
Images nvarchar(150) not null,
Status bit default 1,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Account(
ID int identity primary key,
Code nvarchar(50) not null,
Name nvarchar(150) not null,
Email nvarchar(150) not null,
Phone nvarchar(150) not null,
Address nvarchar(150) not null,
Birthday nvarchar(150) not null,
Gender bit default 1,
Images nvarchar(150) null,
Role bit default 1,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Category(
ID int identity primary key,
Code nvarchar(50) not null,
Name nvarchar(150) not null,
Description nvarchar(200) not null,
Status bit default 1,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Product(
ID int identity primary key,
Code nvarchar(50) not null,
Name nvarchar(150) not null,
CategoryID int foreign key references Category(ID) not null,
Description nvarchar(200) not null,
Images nvarchar(150) not null,
Price float not null,
SalePrice float,
Status bit default 1,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Orders(
ID int identity primary key,
Code nvarchar(50) not null,
Name nvarchar(150) not null,
Email varchar(150) not null,
Phone varchar(150) not null,
Address nvarchar(150) not null,
TotalQuantity int ,
TotalPrice float,
Status bit default 1,
AccountID int foreign key references Account(ID),
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)

go
Create table OrderDetail(
ID int identity primary key,
ProductID int foreign key references Product(ID) not null,
OrderID int foreign key references Orders(ID) not null,
Price float not null,
Quantity int not null,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Favorite(
ID int identity primary key,
ProductID int foreign key references Product(ID) not null,
AccountID int foreign key references Account(ID) not null,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)
go
Create table Rating(
ID int identity primary key,
ProductID int foreign key references Product(ID) not null,
AccountID int foreign key references Account(ID) not null,
Star float not null,
Description nvarchar(200) not null,
Status bit default 1,
CreatedDate date DEFAULT GETDATE(),
ModiredDate date DEFAULT GETDATE()
)