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
        TotalQuantity int,
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
INSERT INTO
    Category (Code, Name, Description)
values
(
        N 'NK342',
        N'Trái cây nhập khẩu',
        N'Trái cây được nhập khẩu từ các nước khác nhau'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N 'TN236',
        N'Trái cây trong nước',
        N'Trái cây đặc sản của các vùng miền trong nước'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N'GQ872',
        N'Giỏ quà',
        N'Trái cây hoặc đồ khô được đóng thành giỏ'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N'TP895',
        N'Thực phẩm',
        N'Thực phẩm ăn uống hàng ngày'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N'ĐK357',
        N'Đồ khô',
        N'Thực phẩm khô và các loại hạt'
    );

Go
INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00001',
        N 'Nho Đen Nam Phi',
        100000,
        N'nhodennamphi1.jpg',
        1,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00002',
        N 'Nho Úc Sweetglobe',
        175000,
        N'nhoxanhuc1.jpg',
        1,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00003',
        N'Quýt Baby Đài Loan',
        75000,
        N'quytbabydailoan1.jpg',
        1,
        N'Mỏng vỏ, thơm, tươi, ngọt đậm. 1kg khoảng 8-9 quả'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00005',
        N'Dưa Lưới Đài Loan',
        160000,
        N'dualuoidailoan1.jpg',
        1,
        N'Ruột cam, ngọt lịm, thơm, thanh mát  '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00006',
        N 'Nho xanh Nam Phi',
        155000,
        N'nhoxanhnamphi1.png',
        1,
        N ' Nho có dáng thuôn, vỏ mỏng, màu xanh hổ phách bắt mắt. Thịt nho giòn tan, không hạt, vị ngọt đậm đà rất ngon. '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00007',
        N'Hồng Xiêm Xuân Đỉnh',
        45000,
        N'hongxiemxuandinh1.jfif',
        2,
        N 'Hồng xiêm Xuân Đỉnh có hương thơm và vị ngọt rất đặc biệt. Những miếng hồng xiêm khi cắt màu mật ong óng ả,thịt hồng mịn'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00008',
        N'Bơ Sáp Quốc Minh',
        75000,
        N'bosapquocminh1.jpg',
        2,
        N'Cơm bơ: vàng màu mỡ gà, dẻo và béo dừng ở mức độ vừa phải, thích hợp cho ăn sống hoặc xay sinh tố, ăn salad '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00009',
        N 'Ổi Nữ Hoàng',
        30000,
        N'oinuhoang1.jpg',
        2,
        N 'Ổi nữ hoàng quả to, xanh, giòn, ăn vào có vị chua ngọt, hạt rất ít. Một đĩa Ổi Nữ Hoàng kèm chèn muối ớt cay nồng sẽ là sự kết hợp hoàn hảo cho bữa ăn vặt thơm ngon, tốt cho sức khỏe. '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00010',
        N'Xoài Keo',
        28000,
        N'xoaikeo1.jfif',
        2,
        N'Loại trái cây phổ biến được ưa chuộng giàu chất xơ, vitamin, khoáng chất thiết yếu giúp cung cấp chất dinh dưỡng cho cơ thể con người và mang lại nhiều lợi ích tuyệt vời cho hệ tiêu hóa, tim mạch, giúp mắt sáng, làm đẹp da. Xoài keo có quả chắc giòn giòn chua ngọt thơm ngon được nhiều người ưa thích '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00011',
        N'Vú Sữa Tím',
        45000,
        N'vusuatim1.jpg',
        2,
        N'Không chỉ thơm và ngọt, vú sữa có nhiều công dụng đối với sức khỏe  '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00012',
        N'Vải Thiều Thanh Hà',
        30000,
        N'vaithieuthanhha1.jpg',
        2,
        N'Thịt nhiều, cùi dầy, hạt nhỏ,mùi thơm đặc trưng, khi ăn bạn sẽ cảm nhận được vị ngọt, thanh mát. '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00013',
        N'Bưởi Da Xanh',
        80000,
        N'buoidaxanh1.jpg',
        2,
        N' chắc quả, vỏ thì lại mỏng,hạt thì rất ít '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00014',
        N'Cam Sành Tiền Giang',
        50000,
        N'camsanhtiengiang1.png',
        2,
        N'Vỏ cam sành màu xanh đến xanh vàng khi chín, sần và dầy 3-5mm, tép màu vàng cam đậm, nhiều nước, vị ngọt chua mùi rất thơm và khá nhiều hạt '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00015',
        N'Chôm chôm nhãn',
        175000,
        N'nhoxanhuc1.jpg',
        2,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00016',
        N'Giỏ trái cây GR10',
        550000,
        N'giotraicay1.jpg',
        3,
        N '2 cam mỹ/Úc Premier
2 quýt Úc S36
1 Lê Hàn quốc premium
1 kiwi vàng
0.5 kg nho xanh/đen/đỏ Mỹ/Úc/Nam Phi
1 táo xanh Mỹ/Pháp
giỏ mây
nơ và vật dụng trang trí '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00017',
        N'Giỏ trái cây GQTC1',
        1540000,
        N'giotraicay2.jpg',
        3,
        N 'Nho xanh nhập khẩu 1kg (Mỹ, Úc, Nam Phi)
Nho đỏ/kẹo/đen nhập khẩu 1kg (Mỹ, Úc, Nam Phi)
2 kiwi vàng New Zealand/Pháp
4 táo Envy
3 lê Nam Phi
3 lê Hàn Quốc Premier
3 cam vàng Úc Premier
giỏ mây cao cấp
nơ và vật dụng trang trí '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00018',
        N'Giỏ trái cây GQTC21',
        750000,
        N'giotraicay3.jpg',
        3,
        N '1 lê Hàn Quốc Premier
8 táo gala Mỹ S90 (hoặc tương đương)
0.5kg nho xanh/đỏ/đen Mỹ
2 cam vàng Úc Premier
3 lê Nam Phi
2 Quýt Úc
giỏ cạp L
nơ và vật dụng trang trí '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00019',
        N'Hộp trái cây HT4',
        490000,
        N'hoptraicay1.jpg',
        3,
        N ' Táo queen, Breeze NZ hoặc tương đương
Nho xanh Mỹ/nho đen Mỹ
Cam Úc
Lê Hàn Quốc Premier
Kiwi xanh hoặc tương đương
Hộp quà in giấy mỹ thuật thơm
Nơ và vật dụng trang trí'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00019',
        N'Hộp trái cây HQTC4',
        1600000,
        N'hoptraicay2.jpg',
        3,
        N 'Dâu tây Hàn Quốc 700gr loại 1
Nho xanh Mỹ/Úc/Nam Phi 2kg
Hoa trang trí
1 cành hồng đẹp thơm
hộp quà in giấy mỹ thuật thơm
nơ và vật dụng trang trí'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00020',
        N'Miến Gogi Hàn Quốc',
        850000,
        N'miengogihanquoc1.jpg',
        5,
        N'Miến khoai lang Gogi - Hàn Quốc 1kg'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00021',
        N'Bột Cacao Choco Quick Kruger Hộp 800G',
        135000,
        N'botcacao1.png',
        5,
        N'ột ca cao pha sữa trẻ em Choco Quick Kkhông chứa chất tạo màu, tạo vị và chất làm ngọt nhân tạo,là bột sô cô la hoà tan, bổ sung chất xơ, tăng hấp thụ Calcium, hổ trợ tiêu hoá.'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00022',
        N 'Ruốc Cá Hồi Soboro 160g Nhật Bản',
        95000,
        N'ruoccahoi.jpg',
        5,
        N'Ruốc cá hồi là thực phẩm rất giàu omega 3 – DHA, có hàm lượng dinh dưỡng cao cũng như hương vị thơm ngon, rất tốt cho sự phát triển của trẻ và đặc biệt tốt cho não bộ.'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00023',
        N 'Dầu Ăn Hạt Cải Nhật Bản',
        78000,
        N'dauanhatcai1.jpg',
        5,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00024',
        N'Sữa Kid Essentials Úc 800g',
        570000,
        N'sua1.jpg',
        5,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00025',
        N'Sữa Devondale 1Kg Úc',
        260000,
        N'sua2.jpg',
        5,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00026',
        N 'Kiwi Vàng Newzealand 500g',
        110000,
        N'kiwivang1.jpg',
        1,
        N''
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00027',
        N 'Kiwi Xanh Newzealand 500g',
        190000,
        N'kiwixanh1.jpg',
        1,
        N''
    );

select
    *
from
    Product