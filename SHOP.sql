create database SHOP
use master
/****** Object:  Table [dbo].[Categories]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int]  NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Order_Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address][nvarchar](50) not null,
	[Datetime] datetime,
	[Total] float
	 CONSTRAINT [PK_Order_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Feedback][nvarchar](50) null,
	[Address][nvarchar](max),
	[Phone] [nvarchar](11),
	[Role] [nvarchar](20) null,
	[Rank] float,-- lưu điểm đánh giá của khách hàng
	[CountRank] float,-- lưu số lần đánh giá.
	[Count] float-- đếm lượt đăng tin của người bán.
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterRoles]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Masters]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters](
	[Id] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ID_Seller] [nvarchar](20) not null,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [float],
	[Status][nvarchar](20) -- tình trạng bao gồm đã đặt hàng, đã xác nhận, đã giao( cái này do người bán cập nhật)
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[RequireDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Amount] [float] NOT NULL
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](20),
	[Name] [nvarchar](40) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Size] [nvarchar] (50) NOT NULL,
	[Color] [nvarchar] (50) NOT NULL,
	[Amount] [float] not null
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleActions]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
	[WebActionId] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
GO
/****** Object:  Table [dbo].[WebActions]    Script Date: 7/10/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1000, N'Áo sơ mi')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1001, N'Áo Thun')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1002, N'Áo Khoác')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1003, N'Quần Jeans')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1004, N'Quần Kakis')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1005, N'Quần Shorts')

INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email],[Phone],[Address]) VALUES (N'KH001',N'061095',N'Thach Thi Kieu Linh',N'nlinh6894@gmail.com','0981862446',N'236/25/2- Điện Biên Phủ- p17- Quận Bình Thạnh')
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email],[Phone],[Address]) VALUES (N'KH002', N'061095', N'Huynh Du Nguyen', N'huynhdunguyen22@gmail.com', '0981862447',N'236/25/6- Điện Biên Phủ- p17- Quận Bình Thạnh')
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email],[Phone],[Address]) VALUES (N'KH003', N'061095', N'Pham Tuan Anh', N'anhpham140195@gmail.com','0981862448',N'236/25/7- Điện Biên Phủ- p17- Quận Bình Thạnh')

SET IDENTITY_INSERT [dbo].[MasterRoles] ON 

INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (106, N'nnghiem', N'admin')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (107, N'lththao', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (109, N'ndthienlong', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (110, N'ndhoanglong', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (157, N'songlong2k', N'super')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (158, N'songlong2k', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (165, N'999', N'super')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (166, N'999', N'user')
SET IDENTITY_INSERT [dbo].[MasterRoles] OFF
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'999', N'999', N'999', N'999', N'999')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'lththao', N'songlong', N'Lê Thị Hương Thảo', N'lththao@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'ndhoanglong', N'songlong', N'Nguyễn Đình Hoàng Long', N'ndhoanglong@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'ndthienlong', N'songlong', N'Nguyễn Đình Thiên Long', N'ndthienlong@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'nnghiem', N'songlong', N'Nguyễn Nghiệm', N'nghiemn@fpt.edu.vn', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'songlong2k', N'songlong', N'Song Long 2000', N'songlong2k@gmail.com', N'0913745789')
--SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1001, 'KH001',N'Abercrombie Men Shirt', 450, N'1001.jpg', 1, 1000, N'Áo sơ mi thương hiệu Abercrombie nhập khẩu. Được thiết kế sọc caro trắng đen tay dài form Muscle fit',N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1002,'KH001', N'Abercrombie Men Shirt'       , 450, N'1002.jpg', 1, 1000, N'Áo sơ mi thương hiệu Abercrombie nhập khẩu. Được thiết kế sọc caro đỏ, xanh tay dài, form Muscle fit',N' S, M, L, XL',N'Đỏ',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1003,'KH001', N'CALVIN KLEIN MEN SHIRT'      , 400, N'1003.jpg', 1, 1000, N'Áo sơ mi thương hiệu CALVIN KLEIN nhập khẩu .Được thiết kế tay dài , form rộng  '                                       ,N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1004,'KH001', N'ASOS MEN COTTON SHIRT'       , 500, N'1004.jpg', 1, 1000, N'Áo sơ mi thương hiệu ASOS nhập khẩu .Thiết kế với form Slim fit, chất khakis bông tuyết  '                              ,N' S, M, L, XL',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1005,'KH001', N'DRDENIM JEANSMAKERS SHIRT'   , 550, N'1005.jpg', 1, 1000, N'Áo sơ mi thương hiệu DRDENIM nhập khẩu. Thiết kế caro lớn xám trắng và đen  '                                           ,N' S, M, L, XL',N'Xám',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1006,'KH001', N'ATHL HOLLISTER MEN SHIRT'    , 350, N'1006.jpg', 1, 1000, N'Áo sơ mi thương hiệu HOLLISTER nhập khẩu.Thiết kế chất cotton bông, caro, với nhiều màu khác nhau  '                    ,N' S, M, L, XL',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1007,'KH001', N'TOPMAN SHIRT IN LONG SLEEVE' , 550, N'1007.jpg', 1, 1000, N'Áo sơ mi thương hiệu TOPMAN nhập khẩu .Áo sơ mi có thiết kế cổ bẻ, tay dài, mang đến phong cách thời trang, lich lãm . ',N' S, M, L, XL',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1008,'KH001', N'TOPMAN SHIRT IN LONG SLEEVE' , 550, N'1008.jpg', 1, 1000, N'Áo sơ mi thương hiệu TOPMAN nhập khẩu .Áo sơ mi có thiết kế cổ bẻ, tay dài, mang đến phong cách thời trang, lich lãm . ',N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1009,'KH001', N'Sơ mi MANGO HN'              , 400, N'1009.jpg', 1, 1000, N'Áo sơ mi thương hiệu MANGO  nhập khẩu. Thiết kế form Muscle fit  '                                                      ,N' S, M, L, XL',N'Trắng xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1010,'KH001', N'Z.A.R.A TEXTURED WEAVE SHIRT', 450, N'1010.jpg', 1, 1000, N'Áo sơ mi thương hiệu Z.A.R.A nhập khẩu.Thiết kể sơ mi dài tay giả jean  '                                               ,N' S, M, L, XL',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1011,'KH001', N'Z.A.R.A PRINT SHIRT'         , 400, N'1011.jpg', 1, 1000, N'Áo sơ mi thương hiệu Z.A.R.A  nhập khẩu .Thiết kế với màu xanh chấm bi trắng   '                                        ,N' S, M, L, XL',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1012,'KH001', N'H.M DENIM SHIRT'             , 500, N'1012.jpg', 1, 1000, N'Áo sơ mi thương hiệu DENIM  nhập khẩu .Thiết kể giả jean  '                                                             ,N' S, M, L, XL',N'Xám',1)

INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1013,'KH001', N'POLO T-SHIRT'                , 200, N'1013.jpg', 1, 1001, N'Áo thun POLO có cổ tay ngắn  '                               ,N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1014, 'KH001',N'ABERCROMBIE T-SHIRT 150'     , 150, N'1014.jpg', 1, 1001, N'Áo thun Abercombie-v-neck cổ tim '                           ,N' S, M, L, XL',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1015,'KH001', N'PULL AND BEAR T-SHIRT'       , 250, N'1015.jpg', 1, 1001, N'Áo thun PULL AND BEAR cổ tròn , form body , cotton '         ,N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1016,'KH001', N'HOLLISTER HENLEY T-SHIRT'    , 300, N'1016.jpg', 1, 1001, N'Áo thun HOLLISTER  cổ tròn, cotton'                          ,N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1017,'KH001', N'ABERCOMBIE MEN T-SHIRT'      , 250, N'1017.jpg', 1, 1001, N'Áo thun ABERCOMBIE chất cotton mịn, form muscle fit'         ,N' S, M, L, XL', N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1018,'KH001', N'ZARA MAN T-SHIRT'            , 250, N'1018.jpg', 1, 1001, N'Áo thun ZARA chất cotton, form muscle fit. chấm bi trắng  '  ,N' S, M, L, XL',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1019,'KH001', N'F.PERRY POLO SHIRT PRINT'    , 250, N'1019.jpg', 1, 1001, N'Áo thun POLO chất vải mịn, có cổ viền trắng'                 ,N' S, M, L, XL',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1020,'KH001', N' ABERCROMBIE HG T8'          , 280, N'1020.jpg', 1, 1001, N'Áo thun ABERCROMBIE cổ tròn, vải mịn form body'              ,N' S, M, L, XL',N'Xám',1)

INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1021,'KH001', N'Z.A.R.A SUEDETTE BOMBER'     , 480, N'1021.jpg',1, 1002, N'Áo khoác vải nỉ Z.A.R.A không nón'               ,N' S, M, L, XL',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1022,'KH001', N'Z.A.R.A LIGHT BOMBER'        , 450, N'1022.jpg', 1, 1002, N'Áo khoác vải dù Z.A.R.A không nón '              ,N' S, M, L, XL',N'Xanh đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1023,'KH001', N'TOP.MAN COTTON BOMBER'       , 380,N'1023.jpg',  1, 1002, N'Áo khoác vải cotton TOP.MAN không nón  '         ,N' S, M, L, XL',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1024,'KH001', N'J.JONES DENIM PRINTED SHIRTS', 320, N'1024.jpg', 1, 1002, N'Áo khoác jean DENIM '                            ,N' S, M, L, XL',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1025,'KH001', N'M.A.N.G.O CONCEALED HOOD'    , 550, N'1025.jpg', 1, 1002, N'Áo khoác vải dù MANGO không nón'                 ,N' S, M, L, XL',N'Đỏ',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1026,'KH001', N'M.A.N.G.O CONCEALED HOOD'    , 550, N'1026.jpg', 1, 1002, N'Áo khoác vải dù MANGO có nón'                    ,N' S, M, L, XL',N'Xanh',1)

INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1027,'KH001', N'DENIM BEN STEVEN JEANS  '    , 550, N'1026.jpg', 1, 1003, N'Quần Jean DENIM giả nhăn'                                                    ,N' 28-36',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1028,'KH001', N'ZARA MAN JEAN           '    , 450, N'1026.jpg', 1, 1003, N'Quần Jean Z.A.R.A giả nhăn và rách'                                          ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1029,'KH001', N'TOP MAN JEAN            '    , 450, N'1026.jpg', 1, 1003, N'Quần Jean TOPMEN form thẳng'                                                 ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1030,'KH001', N'ABERCOMBIE SKINNY JEAN  '    , 500, N'1026.jpg', 1, 1003, N'Quần Jean ABERCOMBIE Chất Jean pha Spandex co giãn thoải mái, tiện dụng.'    ,N' 28-36',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1031,'KH001', N'HOLLISTER JEAN          '    , 500, N'1026.jpg', 1, 1003, N'Quần Jean HOLISTER .Chất Jean pha thun wash đỉnh cao Form skinny    '        ,N' 28-36',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1032,'KH001', N'ABERCROMBIE JEAN        '    , 500, N'1026.jpg', 1, 1003, N'Quần Jean ABERCOMBIE Chất Jean pha thun wash.Form skinny'                    ,N' 28-36',N'Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1033,'KH001', N'DENIM SPAO JEANS        '    , 400, N'1026.jpg', 1, 1003, N'Quần Jean DENIM Form slim fit'                                               ,N' 28-36',N'Xanh Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1034,'KH001', N'TOPMEN SKINNY JEAN      '    , 400, N'1026.jpg', 1, 1003, N'Quần Jean TOPMEN form skinny'                                                ,N' 28-36',N'Xanh Đen',1)

INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1035,'KH001', N'TOPMEN SKINNY TROUSER   '    , 350, N'1026.jpg', 1, 1004, N'Quần Khakis TOPMEN form skinny'                                   ,N' 28-36',N'Xanh Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1036,'KH001', N'Z.A.R.A MEN CHINO       '    , 350, N'1026.jpg', 1, 1004, N'Quần Khakis ZARA form skinny'                                     ,N' 28-36',N'Xanh ',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1037,'KH001', N'M.A.N.G.O SLIM FIT CHINO'    , 350, N'1026.jpg', 1, 1004, N'Quần Khakis MANGO form slim fit'                                  ,N' 28-36',N'Xanh Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1038,'KH001', N'CANVIN KLEIN MEN        '    , 380, N'1026.jpg', 1, 1004, N'Quần Khakis CANVIN KLEIN Chất vải kaki pha spandex dày mịn.'      ,N' 28-36',N' Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1039,'KH001', N'Z.A.R.A COMFORT SUIT    '    , 400, N'1026.jpg', 1, 1004, N'Quần Khakis ZARA form slim fit'                                   ,N' 28-36',N' Đen',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1040,'KH001', N'CANVIN KLEIN Coloured   '    , 350, N'1026.jpg', 1, 1004, N'Quần Khakis CANVIN KLEIN vải kaki dày mịn'                        ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1041,'KH001', N'DR.DENIM HEYWOOD        '    , 350, N'1026.jpg', 1, 1004, N'Quần Khakis DENIM vải kaki trơn'                                  ,N' 28-36',N'Trắng',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1042,'KH001', N'PnB Basic Chinos        '    , 350, N'1026.jpg', 1, 1004, N'Quần Khakis ASOS vải kaki dày bóng'                               ,N' 28-36',N'Đỏ',1)

INSERT [dbo].[Products]([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1043,'KH001', N'SHORT JEAN HOLLISTER    '    , 350, N'1026.jpg',1, 1005, N'Quần HOLISTER short vải jean      '                               ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1044,'KH001', N'DENIM PRPS SHORT        '    , 250, N'1026.jpg', 1, 1005, N'Quần DENIM short vải kaki bóng'                                   ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1045,'KH001', N'MANGO MAN JEAN          '    , 350, N'1026.jpg', 1, 1005, N'Quần MANGO short vải jean'                                        ,N' 28-36',N'Xám',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1046,'KH001', N'ZARA MAN JEANS          '    , 350, N'1026.jpg', 1, 1005, N'Quần ZARA short vải jean giả rách '                               ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1047,'KH001', N'ZARA SHORT JEAN         '    , 350, N'1026.jpg', 1, 1005, N'Quần ZARA short vải jean nhăn'                                    ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1048,'KH001', N'HOLLISTER SHORT KHAKIS  '    , 250, N'1026.jpg', 1, 1005, N'Quần HOLISTER short vải kakis'                                    ,N' 28-36',N'Xanh',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1049,'KH001', N'MANGO MAN SHORT         '    , 250, N'1026.jpg', 1, 1005, N'Quần MANGO short vải kakis form slim'                             ,N' 28-36',N'Xám',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1050,'KH001', N'Z.A.R.A BASIC           '    , 280, N'1026.jpg', 1, 1005, N'Quần ZARA short cotton có họa tiết'                               ,N' 28-36',N'Xám',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1051,'KH001', N'T.O.P.M.A.N STRETCH     '    , 300, N'1026.jpg', 1, 1005, N'Quần TOPMEN short vải kakis form skinny'                          ,N' 28-36',N'Nâu',1)
INSERT [dbo].[Products]  ([Id],[CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1052,'KH001', N'A.S.O.S PRINTED         '    , 280, N'1026.jpg', 1, 1005, N'Quần ASOS short vải dù có họa tiết'                               ,N' 28-36',N'Xanh',1)


SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[RoleActions] ON 

INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (946, N'admin', 2)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (947, N'admin', 3)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (948, N'admin', 4)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (949, N'admin', 5)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (950, N'admin', 8)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (951, N'admin', 9)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (952, N'admin', 10)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (953, N'admin', 11)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (954, N'admin', 12)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (955, N'admin', 13)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (956, N'admin', 14)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (957, N'admin', 15)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (958, N'admin', 16)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (959, N'admin', 17)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (960, N'admin', 18)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (961, N'admin', 19)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (962, N'admin', 20)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (963, N'admin', 21)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (964, N'admin', 22)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (965, N'admin', 23)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (966, N'admin', 24)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (967, N'admin', 25)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (968, N'admin', 26)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (969, N'admin', 27)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (970, N'admin', 28)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (971, N'admin', 43)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (972, N'admin', 44)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (973, N'admin', 45)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (974, N'admin', 46)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (975, N'admin', 47)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (976, N'admin', 48)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (977, N'admin', 49)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (978, N'admin', 50)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (979, N'admin', 51)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (989, N'super', 2)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (990, N'super', 3)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (991, N'super', 4)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (992, N'super', 5)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (993, N'super', 8)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (994, N'super', 9)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (995, N'super', 10)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (996, N'super', 11)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (997, N'super', 12)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (998, N'super', 13)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (999, N'super', 14)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1000, N'super', 15)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1001, N'super', 16)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1002, N'super', 17)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1003, N'super', 18)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1004, N'super', 19)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1005, N'super', 20)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1006, N'super', 21)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1007, N'super', 22)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1008, N'super', 23)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1009, N'super', 24)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1010, N'super', 25)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1011, N'super', 26)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1012, N'super', 27)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1013, N'super', 28)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1014, N'super', 43)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1024, N'user', 9)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1025, N'user', 12)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [WebActionId]) VALUES (1026, N'user', 13)
SET IDENTITY_INSERT [dbo].[RoleActions] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'admin', N'Administrators')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'super', N'Supervisors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'user', N'Users')
SET IDENTITY_INSERT [dbo].[WebActions] ON 

INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (2, N'product/insert', N'Sản phẩm - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (3, N'product/update', N'Sản phẩm - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (4, N'product/delete', N'Sản phẩm - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (5, N'product/edit', N'Sản phẩm - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (8, N'product/index', N'Sản phẩm - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (9, N'category/insert', N'Loại sản phẩm - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (10, N'category/update', N'Loại sản phẩm - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (11, N'category/delete', N'Loại sản phẩm - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (12, N'category/edit', N'Loại sản phẩm - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (13, N'category/index', N'Loại sản phẩm - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (14, N'supplier/insert', N'Nhà cung cấp - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (15, N'supplier/update', N'Nhà cung cấp - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (16, N'supplier/delete', N'Nhà cung cấp - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (17, N'supplier/edit', N'Nhà cung cấp - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (18, N'supplier/index', N'Nhà cung cấp - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (19, N'customer/insert', N'Khách hàng - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (20, N'customer/update', N'Khách hàng - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (21, N'customer/delete', N'Khách hàng - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (22, N'customer/edit', N'Khách hàng - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (23, N'customer/index', N'Khách hàng - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (24, N'order/insert', N'Đơn hàng - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (25, N'order/update', N'Đơn hàng - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (26, N'order/delete', N'Đơn hàng - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (27, N'order/edit', N'Đơn hàng - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (28, N'order/index', N'Đơn hàng - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (43, N'inventory/bycategory', N'Hàng tồn theo loại')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (44, N'inventory/bysupplier', N'Hàng tồn theo nhà cung cấp')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (45, N'revenue/byproduct', N'Doanh số từng mặt hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (46, N'revenue/bycategory', N'Doanh số từng loại hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (47, N'revenue/bysupplier', N'Doanh số từng nhà cung cấp')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (48, N'revenue/bycustomer', N'Doanh số từng khách hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (49, N'revenue/byyear', N'Doanh số từng năm')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (50, N'revenue/byquarter', N'Doanh số từng quí')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (51, N'revenue/bymonth', N'Doanh số từng tháng')
SET IDENTITY_INSERT [dbo].[WebActions] OFF
GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_FullName]  DEFAULT (N'Nguyễn Nghiệm') FOR [FullName]
GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_Mobile]  DEFAULT ((913745789)) FOR [Mobile]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Amount__381A47C8]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Roles]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_Loai1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_HangHoa_Loai1]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Masters] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions] FOREIGN KEY([WebActionId])
REFERENCES [dbo].[WebActions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_Permissions_Actions]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
/*EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chủng loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'NameVN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đã kích hoạt hay chưa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Activated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CustomerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày cần có hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'RequireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên người nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Receiver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú thêm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả đơn vị tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitBrief'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên công ty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Logo nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Logo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại liên lạc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Phone'
GO*/
