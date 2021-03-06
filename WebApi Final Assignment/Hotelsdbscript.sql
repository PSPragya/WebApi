USE [master]
GO
/****** Object:  Database [Hotelsdb]    Script Date: 12-01-2021 10:52:12 ******/
CREATE DATABASE [Hotelsdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotelsdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hotelsdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotelsdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hotelsdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hotelsdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotelsdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotelsdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotelsdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotelsdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotelsdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotelsdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotelsdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotelsdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotelsdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotelsdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotelsdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotelsdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotelsdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotelsdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotelsdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotelsdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotelsdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotelsdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotelsdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotelsdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotelsdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotelsdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotelsdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotelsdb] SET RECOVERY FULL 
GO
ALTER DATABASE [Hotelsdb] SET  MULTI_USER 
GO
ALTER DATABASE [Hotelsdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotelsdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotelsdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotelsdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotelsdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotelsdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hotelsdb', N'ON'
GO
ALTER DATABASE [Hotelsdb] SET QUERY_STORE = OFF
GO
USE [Hotelsdb]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 12-01-2021 10:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Bookingdate] [datetime] NOT NULL,
	[Roomid] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 12-01-2021 10:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Pincode] [int] NOT NULL,
	[Contactno] [int] NOT NULL,
	[Contactperson] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
	[Facebook] [nvarchar](50) NOT NULL,
	[Twitter] [nvarchar](50) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[Createddate] [datetime] NOT NULL,
	[Createdby] [nvarchar](50) NULL,
	[Updatedate] [datetime] NOT NULL,
	[Updatedby] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roomslist]    Script Date: 12-01-2021 10:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roomslist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
	[Createddate] [datetime] NOT NULL,
	[Createdby] [nvarchar](50) NULL,
	[Updateddate] [datetime] NOT NULL,
	[Updatedby] [nvarchar](50) NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_Roomslist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([Id], [Status], [Bookingdate], [Roomid], [IsActive]) VALUES (1, N'Checkin Pending', CAST(N'2021-01-25T00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[Bookings] ([Id], [Status], [Bookingdate], [Roomid], [IsActive]) VALUES (2, N'Checkin Pending', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 12, 1)
INSERT [dbo].[Bookings] ([Id], [Status], [Bookingdate], [Roomid], [IsActive]) VALUES (3, N'Checkin Pending', CAST(N'2021-01-26T00:00:00.000' AS DateTime), 17, 1)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([Id], [Name], [Address], [City], [Pincode], [Contactno], [Contactperson], [Website], [Facebook], [Twitter], [IsActive], [Createddate], [Createdby], [Updatedate], [Updatedby]) VALUES (1004, N'Sayaji', N'Fatehgunj', N'Vadodara', 390020, 123456789, N'Mr.X', N'abc@gmail.com', N'Mr.X', N'Xworld', 1, CAST(N'2021-01-12T09:38:28.877' AS DateTime), N'Sayaji', CAST(N'2021-01-12T09:38:30.133' AS DateTime), NULL)
INSERT [dbo].[Hotels] ([Id], [Name], [Address], [City], [Pincode], [Contactno], [Contactperson], [Website], [Facebook], [Twitter], [IsActive], [Createddate], [Createdby], [Updatedate], [Updatedby]) VALUES (1006, N'Taj hotel', N'Coloba', N'Mumbai', 4000001, 123456789, N'Tata', N'taj@gmail.com', N'tajhotel', N'Taj', 1, CAST(N'2021-01-12T09:44:32.237' AS DateTime), N'Tata', CAST(N'2021-01-12T09:44:32.237' AS DateTime), NULL)
INSERT [dbo].[Hotels] ([Id], [Name], [Address], [City], [Pincode], [Contactno], [Contactperson], [Website], [Facebook], [Twitter], [IsActive], [Createddate], [Createdby], [Updatedate], [Updatedby]) VALUES (1007, N'Fairmount hotel', N'Kukas', N'Jaipur', 302028, 123, N'mr.palital', N'fairmount@gmail.com', N'Fairmount', N'Fairmount', 1, CAST(N'2021-01-12T09:49:55.690' AS DateTime), N'Palital', CAST(N'2021-01-12T10:10:07.610' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Hotels] OFF
GO
SET IDENTITY_INSERT [dbo].[Roomslist] ON 

INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (9, N'1004', N'Small', 1500.0000, N'Vadodara', 1, CAST(N'2021-01-12T10:18:55.863' AS DateTime), N'Sayaji', CAST(N'2021-01-12T10:18:57.260' AS DateTime), N'Sayaji', 1004)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (10, N'1001', N'Big', 5000.0000, N'Vadodara', 1, CAST(N'2021-01-12T10:20:30.797' AS DateTime), N'Sayaji', CAST(N'2021-01-12T10:20:30.797' AS DateTime), N'Sayaji', 1004)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (11, N'1002', N'Medium', 3000.0000, N'Vadodara', 1, CAST(N'2021-01-12T10:20:56.977' AS DateTime), N'Sayaji', CAST(N'2021-01-12T10:20:56.977' AS DateTime), N'Sayaji', 1004)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (12, N'101', N'Big', 7000.0000, N'Jaipur', 1, CAST(N'2021-01-12T10:21:42.710' AS DateTime), N'Palital', CAST(N'2021-01-12T10:21:42.710' AS DateTime), N'Palital', 1006)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (13, N'102', N'Medium', 5000.0000, N'Jaipur', 1, CAST(N'2021-01-12T10:22:05.173' AS DateTime), N'Palital', CAST(N'2021-01-12T10:22:05.173' AS DateTime), N'Palital', 1006)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (14, N'103', N'Smal', 3000.0000, N'Jaipur', 1, CAST(N'2021-01-12T10:22:25.923' AS DateTime), N'Palital', CAST(N'2021-01-12T10:22:25.923' AS DateTime), N'Palital', 1006)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (15, N'1', N'Medium', 3000.0000, N'Coloba', 1, CAST(N'2021-01-12T10:23:46.397' AS DateTime), N'Tata', CAST(N'2021-01-12T10:23:46.397' AS DateTime), N'Tata', 1007)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (16, N'2', N'Small', 1500.0000, N'Coloba', 1, CAST(N'2021-01-12T10:24:08.713' AS DateTime), N'Tata', CAST(N'2021-01-12T10:24:08.713' AS DateTime), N'Tata', 1007)
INSERT [dbo].[Roomslist] ([Id], [Name], [Category], [Price], [City], [IsActive], [Createddate], [Createdby], [Updateddate], [Updatedby], [hotelID]) VALUES (17, N'3', N'Big', 7000.0000, N'Coloba', 1, CAST(N'2021-01-12T10:24:32.123' AS DateTime), N'Tata', CAST(N'2021-01-12T10:24:32.123' AS DateTime), N'Tata', 1007)
SET IDENTITY_INSERT [dbo].[Roomslist] OFF
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([Roomid])
REFERENCES [dbo].[Roomslist] ([Id])
GO
ALTER TABLE [dbo].[Roomslist]  WITH CHECK ADD FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotels] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Hotelsdb] SET  READ_WRITE 
GO
