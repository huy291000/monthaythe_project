USE [master]
GO

CREATE DATABASE [STORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaborProtectionShopv3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LaborProtectionShopv3.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LaborProtectionShopv3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LaborProtectionShopv3_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STORE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [STORE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STORE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STORE] SET RECOVERY FULL 
GO
ALTER DATABASE [STORE] SET  MULTI_USER 
GO
ALTER DATABASE [STORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STORE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STORE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STORE', N'ON'
GO
USE [STORE]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[email] [nvarchar](50) NOT NULL,
	[password] [varchar](150) NULL,
	[roleid] [int] NULL,
 CONSTRAINT [PK_Tai_khoan] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[customerid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Loai_SP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nchar](10) NULL,
	[image] [nvarchar](20) NULL,
 CONSTRAINT [PK_Nhan_vien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fragrances](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Huong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Images_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_Note](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createday] [date] NULL,
	[employeeid] [int] NULL,
	[totalprice] [float] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Phieu_Nhap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_Note_Detail](
	[importnoteid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[number] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_CT_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[importnoteid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Nha_CC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[number] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[totalprice] [float] NULL,
	[customerid] [int] NULL,
	[employeeid] [int] NULL,
	[createday] [date] NULL,
	[address] [nvarchar](100) NULL,
	[status] [int] NULL,
	[namecustomer] [nvarchar](100) NULL,
	[phonenumber] [nchar](10) NULL,
	[ispaid] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Fragrance](
	[productid] [int] NOT NULL,
	[fragranceid] [int] NOT NULL,
 CONSTRAINT [PK_FragrancesDetail] PRIMARY KEY CLUSTERED 
(
	[productid] ASC,
	[fragranceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[categoryid] [int] NULL,
	[number] [int] NULL,
	[price] [float] NULL,
	[status] [int] NULL,
	[description] [nvarchar](max) NULL,
	[manufactureid] [int] NULL,
	[capacity] [nvarchar](10) NULL,
	[cost] [float] NULL,
 CONSTRAINT [PK_San_Pham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion_Detail](
	[promotionid] [int] NULL,
	[productid] [int] NULL,
	[code] [nchar](10) NULL,
	[percent] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'admin@gmail.com', N'$2a$10$5Uw7di7EkolorhvcG5.auOOQsqSwHiNUrHaD//TgOcjuXocVbQEda', 3)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'adminhuy@gmail.com', N'$2a$10$jWExtgk68aDfFHtQyiL0f.VNR7LcYl5TTZWgKfeJcETbjWdWH8LmC', 2)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'hai@gmail.com', N'$2a$10$EEriCg9OE8h9A1.YoVSSzu.GqUzGc66FknwYAHlNIPltcPAmWr.zW', 1)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'haobh123@gmail.com', N'$2a$10$XTOkjA2mtX04KhtXbnfSyuXyJkUr3cbo3VNW.ocVG42mKozVGih0G', 2)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'hoanghao@yopmail.com', N'$2a$10$8FMuIjV3sQqyBTn0Ws0Im.WInXqWNk5OJ5O7dQjxW1Vfhk2Fpq4rK', 1)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'huyadmin@gmail.com', N'$2a$10$BHUraW3cNkdfy05IKq.udenaUXtkQ0fjIaZ2XTe8HLUQwiZrPp8qK', 2)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'huydomail@gmail.com', N'$2a$10$d0xt2yfEAKU2vnX.QPIXFefE3yohtARnnrI7sLz8SeZiGIG60SvI6', 1)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'huyem@gmail.com', N'$2a$10$ug9MIib8Nh7UWXxNAGHVJeOFiYEp2xcivIQmlDOZSZ4nAHwp8Zlly', 2)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'lalala@gmail.com', N'$2a$10$5Uw7di7EkolorhvcG5.auOOQsqSwHiNUrHaD//TgOcjuXocVbQEda', 1)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'ngoai@gmail.com', N'$2a$10$vVZxd4sPiYlNZbGlpKSNr.a9ewBInPJ8vwTlRFErVOi46LYTTeC0W', 2)
INSERT [dbo].[Accounts] ([email], [password], [roleid]) VALUES (N'nh@gmail.com', N'$2a$10$Daa4pj9cp/79cUZ7z6PCNu2M3LcR4D6/1DM/tpND9Y3jeMgwWcX0O', 2)
INSERT [dbo].[Cart] ([customerid], [productid], [number]) VALUES (1010, 3008, 1)
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (1, N'Găng tay', N'bền')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (2, N'Dây an toàn', N'466')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (3, N'Kính bảo hộ', N'desc')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (4, N'Mũ bảo hộ', N'123')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (6, N'Giày bảo hộ', N'123')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (7, N'Quần áo bảo hộ lao động', N'mmsa12')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([id], [name], [gender], [email], [address], [phone]) VALUES (1009, N'Hao Customer', 1, N'hoanghao@yopmail.com', N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'0388315303')
INSERT [dbo].[Customers] ([id], [name], [gender], [email], [address], [phone]) VALUES (1010, N'Đỗ Phước Đạt Huy', 1, N'huydomail@gmail.com', N'324, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'0935438167')
INSERT [dbo].[Customers] ([id], [name], [gender], [email], [address], [phone]) VALUES (1011, N'huy', 1, N'lalala@gmail.com', N'123, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'0935438167')
INSERT [dbo].[Customers] ([id], [name], [gender], [email], [address], [phone]) VALUES (1012, N'admin', 1, N'admin@gmail.com', N'44, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'1234567899')
INSERT [dbo].[Customers] ([id], [name], [gender], [email], [address], [phone]) VALUES (1013, N'hai', 1, N'hai@gmail.com', N'11, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'1234567896')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([id], [name], [gender], [email], [address], [phone], [image]) VALUES (2, N'Hảo', 0, N'haobh123@gmail.com', N'Q9', N'123456789 ', NULL)
INSERT [dbo].[Employees] ([id], [name], [gender], [email], [address], [phone], [image]) VALUES (2004, N'mnh', 0, N'nh@gmail.com', N'125, Phường Chính Gián, Quận Thanh Khê, Đà Nẵng', N'0234581235', NULL)
INSERT [dbo].[Employees] ([id], [name], [gender], [email], [address], [phone], [image]) VALUES (2005, N'huy', 1, N'huyem@gmail.com', N'329, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'0935438167', NULL)
INSERT [dbo].[Employees] ([id], [name], [gender], [email], [address], [phone], [image]) VALUES (2006, N'Đỗ Phước Đạt Huy', 1, N'huyadmin@gmail.com', N'329, Phường Bến Nghé, Quận 1, Hồ Chí Minh', N'0935438167', NULL)
INSERT [dbo].[Employees] ([id], [name], [gender], [email], [address], [phone], [image]) VALUES (2007, N'dat huy', 1, N'adminhuy@gmail.com', N'123, Phường Cống Vị, Quận Ba Đình, Hà Nội', N'0935438167', NULL)
INSERT [dbo].[Employees] ([id], [name], [gender], [email], [address], [phone], [image]) VALUES (2008, N'ngoai', 1, N'ngoai@gmail.com', N'123, Xã Hoàng Sa, Huyện Hoàng Sa, Đà Nẵng', N'1234567812', NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Fragrances] ON 

INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (1, N'Polycarbonate', N'Độ trong suốt cao hơn, chịu va đập cực tốt, mỏng và nhẹ, khả năng ngăn tia tử ngoại (UV) đến 380nm')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (3, N'Vải Ninomax (vải cháy chậm)', N'Vải mềm mượt, mặc cực mát. Dày, và chậm cháy thích hợp cho công ty dầu khí và công ty hàn xì cơ khí.')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (4, N'Vải Pangrim Hàn Quốc', N'Vải có hàm lượng cotton cao gần 100%, sợi vải dày. Mềm mượt mặc mát.')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (5, N'Kaki Thành Công (83% cotton/17% PE)', N'Bền cực bền, dày cực dày, thấm hút mồ hôi tốt, phù hợp với các doanh nghiệp có cường độ lao động cao.')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (6, N'Vải Kaki 65/35 (65% cotton/35% PE)', N'Thấm hút mồi hôi tốt, độ bền cao, khi vải may lên quần áo bảo hộ lao động mặc rất đẹp. Giá thành hợp lý.')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (7, N'Vải Xi', N'Giá thành tương đối rẻ, mềm, nhẹ nhàng, vải lên quần áo bảo hộ lao động đẹp, mặc tương đối bền.')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (8, N'Vải Dlin', N'Giá thành rất rẻ, siêu rẻ, nhẹ nhàng.')
INSERT [dbo].[Fragrances] ([id], [name], [description]) VALUES (9, N'Nhựa ABE', N'Cứng, rắn nhưng không giòn, cách điện, không thấm nước, bền với nhiệt độ và hóa chất vì vậy không làm biến dạng sản phẩm')
SET IDENTITY_INSERT [dbo].[Fragrances] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5016, 3009, N'images\product\imageujvihl4zquan-ao-ads-bhld-111.jpg.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5017, 3008, N'images\product\imageez9vmqhsday1.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5018, 3007, N'images\product\imagef4jl32nkday2.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5019, 2007, N'images\product\imagegd9irpvmday2.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5021, 1009, N'images\product\image5q3evvg3kinh2.jpg')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5023, 1008, N'images\product\imagevnjp4s29kinh1.jpeg')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5024, 1007, N'images\product\imagek97wbja4quan-ao-6.jpg')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5025, 7, N'images\product\imagewumjqmf3giay3.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5028, 6, N'images\product\imageasnta8eggiay1.jpg.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5030, 5, N'images\product\imagethnybg14giay2.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5031, 4, N'images\product\imagepk42csngmu1.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5032, 3, N'images\product\image6ckwo167mu2.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5033, 2, N'images\product\image6p79teggmu3.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5034, 1, N'images\product\imagentha3oufgang2.webp')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5035, 3010, N'images\product\imagea5vux6ccgang1.jpg')
INSERT [dbo].[Images] ([id], [productid], [path]) VALUES (5036, 6, N'images\product\imageybsobwaegiay2.webp')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Import_Note] ON 

INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (6005, CAST(N'2021-12-11' AS Date), 2, 1000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (6006, CAST(N'2021-12-11' AS Date), 2, 1000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (6007, CAST(N'2021-12-11' AS Date), 2, 2000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (6008, CAST(N'2021-12-10' AS Date), 2, 5000000, 0)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (6009, CAST(N'2021-12-11' AS Date), 2, 2500000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (6010, CAST(N'2021-12-11' AS Date), 2, 6000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (7005, CAST(N'2021-12-11' AS Date), 2, 6000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (7006, CAST(N'2021-12-11' AS Date), 2, 15000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (7007, CAST(N'2021-12-11' AS Date), 2, 2000000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (7008, CAST(N'2023-08-13' AS Date), 2005, 240000, 0)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (7009, CAST(N'2023-08-13' AS Date), 2005, 120000, 2)
INSERT [dbo].[Import_Note] ([id], [createday], [employeeid], [totalprice], [status]) VALUES (7010, CAST(N'2023-08-13' AS Date), 2005, 2000000, 2)
SET IDENTITY_INSERT [dbo].[Import_Note] OFF
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (6005, 1007, 10, 100000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (6006, 1007, 5, 200000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (6007, 2, 10, 200000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (6008, 7, 20, 250000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (6009, 6, 10, 250000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (6010, 5, 20, 300000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (7005, 3008, 20, 300000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (7006, 1009, 50, 300000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (7007, 3007, 10, 200000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (7008, 3010, 20, 12000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (7009, 3010, 10, 12000)
INSERT [dbo].[Import_Note_Detail] ([importnoteid], [productid], [number], [price]) VALUES (7010, 3009, 10, 200000)
SET IDENTITY_INSERT [dbo].[Manufactures] ON 

INSERT [dbo].[Manufactures] ([id], [name], [email], [phone], [address], [description]) VALUES (1, N'Bảo Hộ Lao Động Hanko', N'channel@gmail.com', N'0388315304', N'TP Hồ Chí Minh', NULL)
INSERT [dbo].[Manufactures] ([id], [name], [email], [phone], [address], [description]) VALUES (3, N'Bảo Hộ Lao Động Đại An', N'bathbodyword@gmail.com', N'0388315303', N'TP Hồ Chí Minh', NULL)
INSERT [dbo].[Manufactures] ([id], [name], [email], [phone], [address], [description]) VALUES (4, N'Bảo Hộ Lao Động Thiên Bằng', N'test2@gmail.com', N'0396906925', N'TP Hồ Chí Minh', NULL)
INSERT [dbo].[Manufactures] ([id], [name], [email], [phone], [address], [description]) VALUES (6, N'Bảo Hộ Lao Động Việt Nam', N'tandt@gmail.com', N'0388315303', N'TP Hồ Chí Minh', NULL)
INSERT [dbo].[Manufactures] ([id], [name], [email], [phone], [address], [description]) VALUES (7, N'Bảo Hộ Lao Động Thái Sơn', N'huydomail@gmail.com', N'0935438167', N'TP Hồ Chí Minh', NULL)
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (2005, 1007, 2, 250000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3005, 2, 1, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3006, 2, 1, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3006, 1007, 1, 250000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3007, 2, 1, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3008, 1007, 2, 250000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3009, 2, 1, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3010, 1007, 2, 250000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3011, 3008, 10, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3012, 5, 5, 700000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3013, 3007, 5, 400000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3013, 3008, 5, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3014, 3008, 1, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3015, 3008, 2, 300000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3016, 1009, 3, 400000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3017, 1009, 1, 400000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3017, 3010, 3, 20000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3018, 3010, 1, 20000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3019, 3010, 3, 20000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3020, 3009, 2, 250000)
INSERT [dbo].[Order_Detail] ([orderid], [productid], [number], [price]) VALUES (3021, 3009, 3, 250000)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (2005, 500000, 1009, 2, CAST(N'2021-12-10' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 4, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3005, 300000, 1009, 2, CAST(N'2021-12-09' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh B', 4, N'Dee Dee', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3006, 550000, 1009, NULL, CAST(N'2021-12-09' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 1, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3007, 300000, 1009, NULL, CAST(N'2021-12-10' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 1, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3008, 500000, 1009, NULL, CAST(N'2021-12-08' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 1, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3009, 300000, 1009, NULL, CAST(N'2021-12-07' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 1, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3010, 500000, 1009, NULL, CAST(N'2021-12-06' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 1, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3011, 3000000, 1009, 2, CAST(N'2021-12-10' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 3, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3012, 3500000, 1009, 2, CAST(N'2021-12-10' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 2, N'Hao Customer', N'0388315303', 0)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3013, 3500000, 1009, 2, CAST(N'2021-12-11' AS Date), N'145, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 4, N'Hao Customer', N'0388315303', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3014, 300000, 1010, NULL, CAST(N'2023-08-12' AS Date), N'324, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 4, N'Đỗ Phước Đạt Huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3015, 600000, 1010, NULL, CAST(N'2023-08-12' AS Date), N'324, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 0, N'Đỗ Phước Đạt Huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3016, 1200000, 1010, NULL, CAST(N'2023-08-12' AS Date), N'324, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 4, N'Đỗ Phước Đạt Huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3017, 460000, 1011, NULL, CAST(N'2023-08-13' AS Date), N'123, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 0, N'huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3018, 20000, 1011, 2005, CAST(N'2023-08-13' AS Date), N'123, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 4, N'huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3019, 60000, 1011, 2005, CAST(N'2023-08-13' AS Date), N'123, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 3, N'huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3020, 500000, 1011, 2005, CAST(N'2023-08-13' AS Date), N'123, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 4, N'huy', N'0935438167', 1)
INSERT [dbo].[Orders] ([id], [totalprice], [customerid], [employeeid], [createday], [address], [status], [namecustomer], [phonenumber], [ispaid]) VALUES (3021, 750000, 1010, NULL, CAST(N'2023-08-13' AS Date), N'324, Phường Bến Nghé, Quận 1, Hồ Chí Minh', 1, N'Đỗ Phước Đạt Huy', N'0935438167', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (1, 3)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (2, 1)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (2, 9)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3, 1)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3, 9)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (4, 1)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (4, 9)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (5, 4)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (6, 4)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (7, 3)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (1007, 5)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (1007, 6)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (1008, 1)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (1008, 9)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (1009, 9)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (2007, 4)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3007, 4)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3008, 3)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3008, 8)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3009, 5)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3009, 6)
INSERT [dbo].[Product_Fragrance] ([productid], [fragranceid]) VALUES (3010, 8)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (1, N'Găng tay chịu nhiệt 1000 độ', 1, 0, 1000000, 1, N'', 1, N'10', 0)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (2, N'Mũ bảo hộ lao động VNXK N20', 4, 9, 80000, 1, N'', 6, N'10', 60000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (3, N'Mũ bảo hộ Nhật Quang N40 lót xốp', 4, 0, 150000, 1, N'', 7, N'10', 0)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (4, N'Mũ bảo hộ lao động nhập khẩu 3M-H701R', 4, 0, 200000, 1, N'', 7, N'10', 0)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (5, N'Giày bảo hộ nhập khẩu Hàn Quốc ZIBEN ZB-188', 6, 15, 1650000, 1, N'Giày bảo hộ nhập khẩu Hàn Quốc, ZIBEN 188 chính hãng.', 1, N'42', 1000000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (6, N'Giày bảo hộ K2-14 Hàn Quốc', 6, 10, 1950000, 1, N'Giày bảo hộ lao động K2-14 là mẫu giày bảo hộ bán chạy nhất của thương hiệu K2 đến từ Hàn Quốc.', 4, N'42', 1500000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (7, N'Giày bảo hộ siêu nhẹ, TUBO GD01', 6, 0, 300000, 1, N'', 3, N'42', 0)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (1007, N'Đồng phục bảo hộ lao động VNXK Mã TQ-05', 7, 13, 250000, 1, N'', 6, N'8', 200000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (1008, N'Kính bảo hộ King’s KY152 – Chống tia UV 99,99%', 3, 0, 50000, 1, N'', 3, N'10', 0)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (1009, N'Kính bảo hộ chống hóa chất 3M 1621AF', 3, 48, 400000, 1, N'', 6, N'10', 300000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (2007, N'Dây an toàn bán thân COV Hàn Quốc 2 móc nhỏ', 2, 0, 400000, 1, N'Bộ khóa được cấu tạo với 4 khóa điều chỉnh được độ dài của dây', 3, N'5', 0)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (3007, N'Dây an toàn bán thân COV Hàn Quốc 2 móc lớn', 2, 5, 400000, 1, N'Việc sử dụng dây an toàn điện lực đúng cách là rất quan trọng để đảm bảo tính an toàn và hiệu quả của công việc trên dây dẫn điện cao thế.', 1, N'10', 200000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (3008, N'Dây an toàn điện lực', 2, 4, 300000, 1, N'Việc sử dụng dây an toàn điện lực đúng cách là rất quan trọng để đảm bảo tính an toàn và hiệu quả của công việc trên dây dẫn điện cao thế.', 7, N'10', 300000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (3009, N'Quần áo bảo hộ công nhân vải Kaki', 7, 8, 250000, 1, N'Thiết kế: Rộng rãi, tiện dụng, có dây phản quang
Size: 5-9 (S-XXL)', 4, N'8', 200000)
INSERT [dbo].[Products] ([id], [name], [categoryid], [number], [price], [status], [description], [manufactureid], [capacity], [cost]) VALUES (3010, N'Găng tay bảo hộ sợi len', 1, 9, 20000, 1, N'', 6, N'10', 12000)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Role] ([id], [name]) VALUES (0, N'Out')
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Customer')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Saler')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'Admin')
SET ANSI_PADDING ON

GO

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [IX_Customers] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO

ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [IX_employees] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([email])
REFERENCES [dbo].[Customers] ([email])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Accounts] NOCHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [FK_Accounts_Employees] FOREIGN KEY([email])
REFERENCES [dbo].[Employees] ([email])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Accounts] NOCHECK CONSTRAINT [FK_Accounts_Employees]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Tai_khoan_Quyen] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Tai_khoan_Quyen]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[Import_Note]  WITH CHECK ADD  CONSTRAINT [FK_Phieu_Nhap_Nhan_vien] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Import_Note] CHECK CONSTRAINT [FK_Phieu_Nhap_Nhan_vien]
GO
ALTER TABLE [dbo].[Import_Note_Detail]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuNhap_Phieu_Nhap] FOREIGN KEY([importnoteid])
REFERENCES [dbo].[Import_Note] ([id])
GO
ALTER TABLE [dbo].[Import_Note_Detail] CHECK CONSTRAINT [FK_CT_PhieuNhap_Phieu_Nhap]
GO
ALTER TABLE [dbo].[Import_Note_Detail]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuNhap_San_Pham] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Import_Note_Detail] CHECK CONSTRAINT [FK_CT_PhieuNhap_San_Pham]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Product_Fragrance]  WITH CHECK ADD  CONSTRAINT [FK_FragrancesDetail_Fragrances] FOREIGN KEY([fragranceid])
REFERENCES [dbo].[Fragrances] ([id])
GO
ALTER TABLE [dbo].[Product_Fragrance] CHECK CONSTRAINT [FK_FragrancesDetail_Fragrances]
GO
ALTER TABLE [dbo].[Product_Fragrance]  WITH CHECK ADD  CONSTRAINT [FK_FragrancesDetail_Products] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Product_Fragrance] CHECK CONSTRAINT [FK_FragrancesDetail_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Loai_SP] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_San_Pham_Loai_SP]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Nha_CC] FOREIGN KEY([manufactureid])
REFERENCES [dbo].[Manufactures] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_San_Pham_Nha_CC]
GO
ALTER TABLE [dbo].[Promotion_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_Detail_Promotion] FOREIGN KEY([promotionid])
REFERENCES [dbo].[Promotion] ([id])
GO
ALTER TABLE [dbo].[Promotion_Detail] CHECK CONSTRAINT [FK_Promotion_Detail_Promotion]
GO
USE [master]
GO
ALTER DATABASE [STORE] SET  READ_WRITE 
GO
