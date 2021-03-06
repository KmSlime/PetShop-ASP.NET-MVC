USE [master]
GO
-- Author: Nguyễn Hồng Liêm aka Slime aka KM
/****** Object:  Database [PetShop]    Script Date: 15/10/2021 7:43:04 PM ******/
CREATE DATABASE [PetShop]
GO
ALTER DATABASE [PetShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetShop] SET RECOVERY FULL 
GO
ALTER DATABASE [PetShop] SET  MULTI_USER 
GO
ALTER DATABASE [PetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetShop', N'ON'
GO
ALTER DATABASE [PetShop] SET QUERY_STORE = OFF
GO
USE [PetShop]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
	[PetId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FullName] [nvarchar](250) NULL,
	[Gender] [bit] NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[TotalMoney] [decimal](18, 0) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Count] [int] NULL,
	[TotalPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentCategory]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_ParentCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[Image] [nvarchar](250) NULL,
	[Description] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[CategoryId] [bigint] NULL,
	[SupplierId] [bigint] NULL,
	[PetId] [int] NULL,
	[Status] [bit] NOT NULL,
	[PromotePrice] [decimal](18, 0) NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 15/10/2021 7:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'LiemAdmin', N'A123456')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'Tuan', N'A123456')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'Tu', N'A123456')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'Duy', N'A123456')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'Thanh', N'A123456')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'Dang', N'A123456')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (1, N'Thức ăn cho chó', 2, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (2, N'Thức ăn cho mèo', 2, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (8, N'Vòng cổ', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10006, N'Đồ dùng cho chó', 3, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10007, N'Đồ chơi cho mèo', 3, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10008, N'Đồ dùng cho mèo', 3, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10010, N'Quần áo cho chó', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10011, N'Hạt', 2, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10012, N'Pate', 2, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10013, N'Snack thưởng', 2, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10014, N'Thực phẩm chức năng', 2, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10015, N'Cát vệ sinh', 3, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10016, N'Khay vệ sinh', 3, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10017, N'Đồ cào móng', 3, 2)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10018, N'Chăm sóc tai mắt miệng', 3, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10019, N'Dây dắt', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10020, N'Rọ mõm', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10021, N'Yếm', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [ParentId], [PetId]) VALUES (10022, N'Địu chó', 1, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Username], [Password], [FullName], [Gender], [DateOfBirth], [Address], [Phone], [Email], [Status]) VALUES (1, N'LiemClient', N'A123456', N'Nguyễn Hồng Liêm', 1, CAST(N'1999-08-11T00:00:00.000' AS DateTime), N'somewhere(else)', N'777', N'nguyenLiem@gmail.com', 1)
INSERT [dbo].[Customer] ([Id], [Username], [Password], [FullName], [Gender], [DateOfBirth], [Address], [Phone], [Email], [Status]) VALUES (18, N'Client2', N'a', N'Client2', 0, NULL, N'somewhere2', N'123', N'123@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerId], [CreatedDate], [TotalMoney], [StatusId]) VALUES (10032, 1, CAST(N'2021-10-15T04:30:44.670' AS DateTime), CAST(470000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Order] ([Id], [CustomerId], [CreatedDate], [TotalMoney], [StatusId]) VALUES (10033, 1, CAST(N'2021-10-15T04:31:18.197' AS DateTime), CAST(146000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [CreatedDate], [TotalMoney], [StatusId]) VALUES (10034, 18, CAST(N'2021-10-15T05:47:21.693' AS DateTime), CAST(602000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [CreatedDate], [TotalMoney], [StatusId]) VALUES (10035, 1, CAST(N'2021-10-15T05:50:05.840' AS DateTime), CAST(7189000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10036, 10032, 10019, 1, CAST(155000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10037, 10032, 10023, 1, CAST(315000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10038, 10033, 10009, 2, CAST(146000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10039, 10034, 10023, 1, CAST(315000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10040, 10034, 20048, 1, CAST(287000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10041, 10035, 20054, 1, CAST(226000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10042, 10035, 20056, 1, CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10043, 10035, 10019, 1, CAST(155000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10044, 10035, 10010, 1, CAST(324000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10045, 10035, 10017, 1, CAST(5800000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Count], [TotalPrice]) VALUES (10046, 10035, 10014, 1, CAST(484000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ParentCategory] ON 

INSERT [dbo].[ParentCategory] ([Id], [Name]) VALUES (1, N'Phụ kiện')
INSERT [dbo].[ParentCategory] ([Id], [Name]) VALUES (2, N'Thức ăn')
INSERT [dbo].[ParentCategory] ([Id], [Name]) VALUES (3, N'Đồ chơi')
SET IDENTITY_INSERT [dbo].[ParentCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Pet] ON 

INSERT [dbo].[Pet] ([Id], [Name]) VALUES (1, N'Chó')
INSERT [dbo].[Pet] ([Id], [Name]) VALUES (2, N'Mèo')
SET IDENTITY_INSERT [dbo].[Pet] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (22, N'Pate Cho Chó Monge Fresh Thịt Bò 100g', CAST(27000 AS Decimal(18, 0)), N'/Uploads/images/thuc-an-cho-cho-vi-bo-300x300.jpg', N'<p>- Thương hiệu đến từ Ý<br />
- Pate cao cấp dành cho chó với 80% thit bò tươi, khoáng chất và vitamin, sản phẩm mềm mại, tươi ngon hoàn toàn không chứa colourant, chất bảo quản và chất tạo màu.<br />
- Bổ sung protein, chất sơ và chất béo giúp cung cấp đầy đủ dưỡng chất cho sức khỏe và các hoạt động thường ngày của thú cưng<br />
- Phù hợp với chó ở mọi lứa tuổi.</p>
                                            ', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 220, 10012, 1, 1, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10009, N'Chén Sứ Vành Thấp Màu Vàng Pawise Feeding', CAST(73000 AS Decimal(18, 0)), N'/Uploads/images/chen-su-vanh-thap-mau-vang-pawise-feeding-1-300x300.jpg', N'<p>- Thương hiệu nổi tiếng ở Châu Âu và Mỹ<br />
- Chất liệu sứ cao cấp<br />
- Không bám mùi, dễ chà rửa</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 22, 10006, 1, 1, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10010, N'Thức Ăn Cho Chó Ăn Kiêng Royal Canin Obesity (1,5kg)', CAST(324000 AS Decimal(18, 0)), N'/Uploads/images/royal-canin-obesity-300x300.jpg', N'<p>- Xuất xứ: Nhập khẩu 100% từ Ph&aacute;p<br />
- C&ocirc;ng dụng:<br />
+ Hỗ trợ giảm trọng lượng cơ thể cho ch&oacute; bị thừa c&acirc;n.<br />
+ Bổ sung đầy đủ c&aacute;c dưỡng chất th&uacute;c đẩy ph&aacute;t triển cơ bắp, n&acirc;ng đỡ xương, ph&ograve;ng ngừa c&aacute;c chứng bệnh về khớp.<br />
+ D&agrave;nh cho ch&oacute; ăn ki&ecirc;ng<br />
+ Bổ sung EPA, DHA, Axit b&eacute;o cho da s&aacute;ng b&oacute;ng v&agrave; l&ocirc;ng mượt m&agrave;.<br />
- Th&iacute;ch hợp với mọi giống ch&oacute; trưởng th&agrave;nh tr&ecirc;n 10 th&aacute;ng tuổi.</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1, 1, 1, 1, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10011, N'Pate Cho Mèo Mẹ Và Con Royal Canin Mother & Babycat (195g)', CAST(65000 AS Decimal(18, 0)), N'/Uploads/images/pate-cho-meo-me-va-con-royal-canin-mother-babycat-1-300x300.jpg', N'<p>- Thức ăn cho m&egrave;o con tr&ecirc;n 1 th&aacute;ng tuổi<br />
- M&egrave;o mẹ mang thai v&agrave; cho con b&uacute; cũng c&oacute; thể sử dụng được<br />
- Sản phẩm nhập khẩu từ Ph&aacute;p</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11, 2, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10014, N'Đồ Chơi Rượt Bắt Pawise Play', CAST(484000 AS Decimal(18, 0)), N'/Uploads/images/do-choi-ruot-bat-pawise-play-1.jpg', N'<p>- Thương hiệu nổi tiếng ở Ch&acirc;u &Acirc;u v&agrave; Mỹ<br />
- K&iacute;ch th&iacute;ch sự t&ograve; m&ograve; của m&egrave;o<br />
- Hạn chế lười nh&aacute;t ở m&egrave;o.</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11, 10007, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10015, N'Chén Thông Minh Hình Cây Cho Mèo Hagen Catit', CAST(575000 AS Decimal(18, 0)), N'/Uploads/images/chen-thong-minh-hinh-cay-cho-meo-hagen-catit-1.jpg', N'<p>- Thương hiệu Canada<br />
- Thiết kế c&oacute; nhiều bậc gi&uacute;p tăng độ kh&oacute; khi lấy thức ăn<br />
- K&iacute;ch th&iacute;ch bản năng kiếm thức ăn tự nhi&ecirc;n ở m&egrave;o<br />
- Gi&uacute;p cải thiện sự ph&aacute;t triển ở m&egrave;o<br />
- Miệng ống mở rộng gi&uacute;p dễ đặt thức ăn<br />
- Ch&acirc;n đế cố định chắc chắn</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11, 10008, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10016, N'Chén Inox Chống Kiến Màu Cam Pugmarks Feedy (1.8l)', CAST(129000 AS Decimal(18, 0)), N'/Uploads/images/chen-inox-chong-kien-mau-cam-pugmarks-feedy-1-300x300.jpg', N'<p>- Thương hiệu Ấn Độ<br />
- Inox cao cấp, dễ ch&agrave; rữa v&agrave; kh&ocirc;ng b&aacute;m m&ugrave;i<br />
- Th&agrave;nh ch&eacute;n cao, kiến kh&ocirc;ng v&agrave;o v&agrave; l&agrave;m hỏng thức ăn được<br />
- 4 size</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 45, 10006, 1, 1, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10017, N'Nhà cây cho mèo', CAST(5800000 AS Decimal(18, 0)), N'/Uploads/images/nha-cay-cho-meo-cat-tree-80765.jpg', N'<p>Cat Tree đơn giản m&agrave; tinh tế với ch&acirc;n đế h&igrave;nh vu&ocirc;ng vững chắc kết hợp với một trụ ổ k&iacute;n đ&aacute;o v&agrave; cột c&agrave;o m&oacute;ng sẽ gi&uacute;p cho ch&uacute; m&egrave;o của bạn c&oacute; đầy đủ nhất những điều kiện cần thiết gi&uacute;p ch&uacute;ng cảm thấy y&ecirc;n t&acirc;m v&agrave; vui vẻ hơn. Sản phẩm c&oacute; thể th&aacute;o lắp để vệ sinh dễ d&agrave;ng, tiện lợi.</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11, 10007, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10019, N'Mũ cho chó mèo AMBABY', CAST(155000 AS Decimal(18, 0)), N'/Uploads/images/mu-cho-cho-meo-ambaby-pet-1jxs003-510x510.jpg', N'<p>Mũ cho ch&oacute; m&egrave;o AMBABY l&agrave; sản phẩm d&agrave;nh cho tất cả ch&oacute; m&egrave;o.</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 6, 10010, 1, 1, 1, CAST(139500 AS Decimal(18, 0)), 10)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10023, N'Sữa Tắm Cho Chó Con Furminator Shampoo', CAST(315000 AS Decimal(18, 0)), N'/Uploads/images/sua-tam-cho-cho-con-furminator-shampoo-1-300x300.jpg', N'<p>- Thương hiệu Mỹ<br />
- Chất x&uacute;c t&aacute;c dịu nhẹ, kh&ocirc;ng l&agrave;m cho th&uacute; cưng thấy kh&oacute; chịu<br />
- Khử m&ugrave;i tốt, c&oacute; hương thơm nh&egrave; nhẹ</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11, 10006, 1, 1, 1, CAST(283500 AS Decimal(18, 0)), 10)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (10071, N'test', CAST(1 AS Decimal(18, 0)), N'/Uploads/images/chen-inox-chong-kien-mau-cam-pugmarks-feedy-1-300x300.jpg', N'<p>Sp test</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 1, 1, 1, 1, CAST(97 AS Decimal(18, 0)), 13)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20046, N'Thức Ăn Cho Chó Con Royal Canin MINI Puppy (800g)', CAST(177000 AS Decimal(18, 0)), N'/Uploads/images/hat-cho-cho-con-royal-canin-mini-puppy-1-300x300.jpg', N'<p>- Thức ăn cho ch&oacute; con giống nhỏ<br />
- D&agrave;nh ri&ecirc;ng cho ch&oacute; con từ 2 đến 10 th&aacute;ng tuổi<br />
- Sản phẩm nhập khẩu từ Ph&aacute;p</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11, 1, 1, 1, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20047, N'Khay Vệ Sinh Ferplast Dama', CAST(377000 AS Decimal(18, 0)), N'/Uploads/images/khay-ve-sinh-ferplast-nip-plus-size-10-1-300x300.jpg', N'<p>- Khay vệ sinh cho m&egrave;o được nhập 100% từ &Yacute;<br />
- Khay vệ sinh mở gi&uacute;p tr&aacute;nh m&ugrave;i<br />
- Được thiết kế với 2 th&agrave;nh cao v&agrave; thấp gi&uacute;p ngăn c&aacute;t vương v&atilde;i</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10016, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20048, N'Khay Vệ Sinh Ferplast Nip Plus (20)', CAST(287000 AS Decimal(18, 0)), N'/Uploads/images/khay-ve-sinh-ferplast-nip-plus-size-10-1-300x300.jpg', N'<p>- Khay vệ sinh cho m&egrave;o được nhập 100% từ &Yacute;<br />
- Khay vệ sinh mở gi&uacute;p tr&aacute;nh m&ugrave;i<br />
- 2 size: 10, 20</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10016, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20049, N'Khay Vệ Sinh Ferplast Prima', CAST(439000 AS Decimal(18, 0)), N'/Uploads/images/khay-ve-sinh-ferplast-prima-mau-xanh-1-300x300.jpg', N'<p>- Khay vệ sinh cho m&egrave;o được nhập 100% từ &Yacute;<br />
- Khay vệ sinh k&iacute;n, gi&uacute;p m&ugrave;i h&ocirc;i kh&ocirc;ng bay ra ngo&agrave;i<br />
- Tặng k&egrave;m 1 miếng than hoạt t&iacute;nh khử m&ugrave;i.<br />
- 3 m&agrave;u: Xanh L&aacute;, Đen, Đỏ</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10016, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20050, N'Khay Vệ Sinh Ferplast Prima Cabrio', CAST(505000 AS Decimal(18, 0)), N'/Uploads/images/khay-ve-sinh-ferplast-prima-cabrio-mau-nau-1-300x300.jpg', N'<p>- Khay vệ sinh cho m&egrave;o được nhập 100% từ &Yacute;<br />
- Khay vệ sinh k&iacute;n, gi&uacute;p m&ugrave;i h&ocirc;i kh&ocirc;ng bay ra ngo&agrave;i<br />
- Tặng k&egrave;m 1 miếng than hoạt t&iacute;nh khử m&ugrave;i<br />
- 3 m&agrave;u: N&acirc;u, Xanh Dương, Tự Nhi&ecirc;n</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10016, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20051, N'Khay Vệ Sinh 41cm Mon Ami Hygiene', CAST(165000 AS Decimal(18, 0)), N'/Uploads/images/khay-ve-sinh-41cm-mon-ami-hygiene-1-300x300.jpg', N'<p>- Sản xuất tại Việt Nam<br />
- &Aacute;p dụng c&ocirc;ng nghệ nước ngo&agrave;i gi&uacute;p hạn chế m&ugrave;i h&ocirc;i chất thải<br />
- Vật liệu thiết kế gọn nh&eacute;, c&oacute; độ bền cao<br />
- Thiết kế để m&egrave;o dễ d&agrave;ng đi vệ sinh v&agrave; lấp chất thải</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10016, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20052, N'test', CAST(27000 AS Decimal(18, 0)), N'/Uploads/images/pate-cho-meo-me-va-con-royal-canin-mother-babycat-1-300x300.jpg', N'<p>ăewewqe</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 11111, 1, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20053, N'Cây Mèo Leo Pearl AFP Catzilla', CAST(1120000 AS Decimal(18, 0)), N'/Uploads/images/cay-meo-leo-pearl-afp-catzilla-a-300x300.jpg', N'<p>- Thiết kế từ Ph&aacute;p<br />
- Gi&uacute;p m&egrave;o kh&ocirc;ng căng thẳng, kh&ocirc;ng bị stress khi ở một m&igrave;nh<br />
- Được bện d&acirc;y thừng, gi&uacute;p m&egrave;o c&agrave;o m&oacute;ng khi chơi đ&ugrave;a</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10017, 1, 2, 1, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20054, N'Hộp Đa Dụng Flexi Multi Box', CAST(226000 AS Decimal(18, 0)), N'/Uploads/images/hop-da-dung-flexi-multi-box-1-300x300.jpg', N'<p>- D&ugrave;ng để chứa snack hoặc đồ mang theo khi dắt ch&oacute;<br />
- Ph&ugrave; hợp với c&aacute;i loại d&acirc;y dắt tự động<br />
- Đồ d&ugrave;ng cho ch&oacute; nhập khẩu từ Đức</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 10006, 1, 1, 1, CAST(214700 AS Decimal(18, 0)), 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20055, N'sản phẩm khuyến mãi 1', CAST(100000 AS Decimal(18, 0)), N'/Uploads/images/vongco.jpg', N'<p>sản phẩm khuyến m&atilde;i</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 111, 8, 1, 1, 1, CAST(90000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Image], [Description], [CreatedDate], [Quantity], [CategoryId], [SupplierId], [PetId], [Status], [PromotePrice], [Discount]) VALUES (20056, N'sản phẩm khuyến mãi 2', CAST(200000 AS Decimal(18, 0)), N'/Uploads/images/vongco.jpg', N'<p>sản phẩm khuyến m&atilde;i</p>
', CAST(N'2021-09-15T00:00:00.000' AS DateTime), 112, 8, 1, 1, 1, CAST(190000 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Đã xác nhận')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Phone], [Email], [Address]) VALUES (1, N'Royal Canin', N'123', N'abc@gmail.com', N'TP HCM')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_ParentCategory] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ParentCategory] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_ParentCategory]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Pet] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pet] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Pet]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Pet] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pet] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Pet]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
USE [master]
GO
ALTER DATABASE [PetShop] SET  READ_WRITE 
GO
