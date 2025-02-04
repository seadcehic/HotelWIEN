USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 23.02.2019. 22:40:04 ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY FULL 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hotel', N'ON'
GO
ALTER DATABASE [Hotel] SET QUERY_STORE = OFF
GO
USE [Hotel]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[AutorizacijskiToken]    Script Date: 23.02.2019. 22:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorizacijskiToken](
	[AutorizacijskiTokenID] [int] IDENTITY(1,1) NOT NULL,
	[Vrijednost] [nvarchar](max) NULL,
	[VrijemeEvidentiranja] [datetime] NULL,
	[IpAdresa] [nvarchar](max) NULL,
	[DeviceInfo] [nvarchar](max) NULL,
	[TuristId] [int] NULL,
 CONSTRAINT [PK_dbo.AutorizacijskiToken] PRIMARY KEY CLUSTERED 
(
	[AutorizacijskiTokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacije]    Script Date: 23.02.2019. 22:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacije](
	[RezervacijaId] [int] IDENTITY(1,1) NOT NULL,
	[DatumPocetka] [datetime] NOT NULL,
	[DatumZavrsetka] [datetime] NOT NULL,
	[SobaId] [int] NOT NULL,
	[TuristId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Rezervacije] PRIMARY KEY CLUSTERED 
(
	[RezervacijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soba]    Script Date: 23.02.2019. 22:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soba](
	[SobaId] [int] IDENTITY(1,1) NOT NULL,
	[NazivSobe] [nvarchar](max) NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Soba] PRIMARY KEY CLUSTERED 
(
	[SobaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turist]    Script Date: 23.02.2019. 22:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turist](
	[TuristId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](max) NULL,
	[Prezime] [nvarchar](max) NULL,
	[Telefon] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[KorisnickoIme] [nvarchar](max) NULL,
	[LozinkaSalt] [nvarchar](max) NULL,
	[LozinkaHash] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Turist] PRIMARY KEY CLUSTERED 
(
	[TuristId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23.02.2019. 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AutorizacijskiToken] ON 

INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (1, N'3edadf51-14d3-438f-9939-e882d67c76ee', CAST(N'2019-02-21T16:39:59.093' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (2, N'0d8f4aac-3412-4afe-ad99-0c7ca0958e95', CAST(N'2019-02-21T16:49:24.930' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (3, N'652eb601-8db8-45c5-82ab-2118bdf858c4', CAST(N'2019-02-21T17:24:58.667' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (4, N'3fa49919-b96a-4103-a81a-bb91e606cf8f', CAST(N'2019-02-21T17:35:39.847' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (5, N'553dc1e8-7349-4e46-aa5b-3efdf49bffa6', CAST(N'2019-02-21T17:44:21.873' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (6, N'036aa140-cafc-459b-b18e-b93b41f5ee17', CAST(N'2019-02-21T17:44:55.507' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (7, N'04751c0d-8f57-486b-a1be-269fff9b309b', CAST(N'2019-02-21T17:47:18.457' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (8, N'7879b04e-d562-4515-b897-ff21f1616293', CAST(N'2019-02-21T17:48:41.783' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (9, N'ede8dc03-f253-4d81-927b-60edb1d9f403', CAST(N'2019-02-21T17:50:23.237' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (10, N'561ea285-b3bf-433c-872b-d587615dc529', CAST(N'2019-02-21T17:52:00.653' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (11, N'f9526897-b7ea-4dbc-8cd4-9f6bb9a8e50b', CAST(N'2019-02-21T17:53:37.203' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (12, N'5fcfc35a-4a34-4284-9b03-32d3dd5eb62c', CAST(N'2019-02-21T18:54:57.487' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (13, N'b0cc9f7e-9fd8-4899-b59b-85033a9e6f64', CAST(N'2019-02-21T19:02:33.737' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (14, N'e6839cc4-af00-434a-9ca6-df99de84b94e', CAST(N'2019-02-21T19:13:28.030' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (15, N'65c747a8-a7c7-423a-b708-37a9b3e5ce7e', CAST(N'2019-02-21T19:16:21.930' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (16, N'8fbe5601-37fe-49ec-b311-162cc4ec4975', CAST(N'2019-02-21T19:18:54.017' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (17, N'577a9e51-5824-4c14-a01d-6ab55152bfa5', CAST(N'2019-02-21T19:20:49.157' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (18, N'd8559b44-db6e-46af-b113-a00bfbc8d46b', CAST(N'2019-02-21T19:21:48.510' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (19, N'69ca2c99-b286-4422-9681-a95cf44480f8', CAST(N'2019-02-21T19:22:57.543' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (20, N'0104bcbb-ad13-493a-a58e-ba022ce79712', CAST(N'2019-02-21T19:24:16.727' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (22, N'6ae6a5da-2d47-4c26-9dc7-37f73b83c42d', CAST(N'2019-02-21T19:27:27.187' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (23, N'031a5194-c795-4062-98c6-7ed1b9b16734', CAST(N'2019-02-21T19:30:02.847' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (24, N'76b01d8e-31ac-4f5e-88a1-204befcc98b8', CAST(N'2019-02-21T19:30:56.873' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (25, N'11b21ff4-b858-4915-be6e-2c3313fc968e', CAST(N'2019-02-21T19:31:55.490' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (26, N'f47b7c40-cbe0-4a8d-9746-384766aafade', CAST(N'2019-02-21T19:33:26.240' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (27, N'f8bc9197-4216-45ee-81d7-4474020309bd', CAST(N'2019-02-21T19:34:45.080' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (28, N'58795b15-5c30-41c2-9f67-68039d33bafa', CAST(N'2019-02-21T19:35:25.497' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (29, N'fa95b204-9663-4900-8d75-96ffba7d0da8', CAST(N'2019-02-21T19:35:49.427' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (30, N'25b63cf6-3b0a-441e-97a0-ce56c786b259', CAST(N'2019-02-21T19:37:07.680' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (31, N'c42b4e03-8d6f-4bf2-903b-8d317967e7aa', CAST(N'2019-02-21T19:53:43.567' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (32, N'd30580e6-258a-49d1-8745-e5bb11bedf8c', CAST(N'2019-02-21T19:55:48.337' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (33, N'2ca45af7-6ae6-4e45-af3b-b880a534d7fb', CAST(N'2019-02-21T19:59:32.493' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (34, N'2376a2aa-f519-436e-865e-9649d1407560', CAST(N'2019-02-21T20:01:38.940' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (35, N'ff2c6e4f-17c6-4794-b1e2-f6d4707f8cca', CAST(N'2019-02-21T20:06:36.307' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (36, N'c94d7ea9-531d-441d-ad0a-f7eccea91644', CAST(N'2019-02-21T20:24:29.247' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (37, N'f49b6694-8630-4d5c-9ce5-4e86c58543a4', CAST(N'2019-02-21T20:32:21.750' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (38, N'5b81021a-0a2a-4444-9e6c-d0afe2fbfec1', CAST(N'2019-02-21T23:42:27.980' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (39, N'e01868e0-b3b3-4d3a-ae5d-a41a4ba65703', CAST(N'2019-02-22T00:25:39.333' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (41, N'd0c3cb7e-2a4f-4b96-a69b-2a8b0ad1e872', CAST(N'2019-02-22T00:35:13.503' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (42, N'e8909e1e-d921-47fd-9030-eb01d05f9b89', CAST(N'2019-02-22T01:02:48.207' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (43, N'415a7b58-a621-4892-b0e7-9c8c4902d7ab', CAST(N'2019-02-22T02:06:53.070' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (44, N'6237c8a8-c949-4cf3-96d2-14fc5992d152', CAST(N'2019-02-22T13:46:06.810' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (45, N'204632b4-7356-40dc-be56-61846cfdf21e', CAST(N'2019-02-22T13:54:43.627' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (46, N'd85c4911-2872-4cb1-9978-89e921448ed5', CAST(N'2019-02-22T14:02:34.510' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (47, N'69bc2f5b-d356-4d6c-986c-679e68b0eb0e', CAST(N'2019-02-22T14:12:52.630' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (48, N'2dc8bd82-1830-433f-b4ec-f9404c3f6743', CAST(N'2019-02-22T14:16:51.400' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (49, N'ef7fb1f9-2db0-4f31-9d4d-bb975dd402f2', CAST(N'2019-02-22T14:20:21.210' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (50, N'ea490d53-1905-4439-9130-01542793b956', CAST(N'2019-02-22T14:21:00.157' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (51, N'9929f478-d31e-4317-8b77-7c50c0b9c226', CAST(N'2019-02-22T14:23:47.440' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (52, N'807e8065-4b63-43c1-940a-890fcffcbbb0', CAST(N'2019-02-22T14:24:44.333' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (53, N'0a956029-ca65-43b6-aa3d-bd2cbd59c926', CAST(N'2019-02-22T14:25:18.393' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (54, N'5ad7f957-ddf6-44bd-ac47-c3b37bfecaa5', CAST(N'2019-02-22T14:43:16.970' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (55, N'ee91d859-8b72-4289-bafd-03943029d51e', CAST(N'2019-02-22T14:46:15.537' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (56, N'0a96c8ec-91bb-48be-b7e1-9b9fcafd5fef', CAST(N'2019-02-22T14:47:41.053' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (57, N'27031835-33d9-4cdf-b624-e063bc8c1f9f', CAST(N'2019-02-22T14:48:55.723' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (58, N'd95b36c1-ad5e-41fd-ada4-cadeecf19569', CAST(N'2019-02-22T14:49:39.030' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (59, N'16c73bc5-7768-41db-8838-2b9a7dd8bfd7', CAST(N'2019-02-22T14:54:12.357' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (60, N'fd874434-c4bc-412b-a65d-d6e8877083c4', CAST(N'2019-02-22T14:55:36.673' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (61, N'f5b6a3f8-bc3b-48f6-a0d3-bc1550c287c1', CAST(N'2019-02-22T14:58:26.277' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (62, N'147a2501-535f-4863-9cca-acc5775b340c', CAST(N'2019-02-22T15:11:30.670' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (63, N'3e487232-dc93-483a-ba87-b059d1ba1aaa', CAST(N'2019-02-22T15:26:16.120' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (64, N'f540fdc4-6d82-4ebc-aac0-15bc19044cd7', CAST(N'2019-02-22T15:29:16.020' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (65, N'94db18e3-ecd1-4338-922e-8931e43eeff5', CAST(N'2019-02-22T15:32:56.453' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (66, N'136610e1-e618-4513-ae8d-e0ffdf9d8d98', CAST(N'2019-02-22T15:34:14.363' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (67, N'bd1bd5ca-0a81-41c2-b33b-84c2b0782198', CAST(N'2019-02-22T15:36:21.887' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (68, N'4bb9e4ea-fc17-4e84-bfb7-c7bffbc234bc', CAST(N'2019-02-22T15:37:22.623' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (69, N'3082ce16-880b-4ea0-a7bb-cb15e49f4e30', CAST(N'2019-02-22T15:39:29.403' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (70, N'f220f3df-b174-4fb7-8232-4199ef3814fc', CAST(N'2019-02-22T15:40:15.823' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (71, N'2fc149f7-c401-4447-89a7-e5ab108ebf01', CAST(N'2019-02-22T15:41:49.947' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (72, N'91aece0f-0aa9-4cc1-b74e-ee7ebec84bdf', CAST(N'2019-02-22T15:43:11.173' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (73, N'bf1b98a8-791b-4360-927e-997bcca79ce4', CAST(N'2019-02-22T15:45:38.643' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (74, N'92ddf999-6997-4238-9fac-295d3f6f4b5c', CAST(N'2019-02-22T15:48:02.033' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (75, N'dc8e43e7-ff95-413a-a60e-3b41e40e37dd', CAST(N'2019-02-22T15:49:50.983' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (76, N'ed747ac4-f37c-4da4-b5be-3b0f8aa1c1ce', CAST(N'2019-02-22T15:51:35.900' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (77, N'7f441f48-f7be-49b2-8c2f-22abbff88035', CAST(N'2019-02-22T15:54:17.940' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (79, N'70bad312-173d-4113-9d53-938d483f28cc', CAST(N'2019-02-22T15:59:41.393' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (80, N'c2ea78f5-8d39-4367-848b-0c1d410743f7', CAST(N'2019-02-22T16:22:56.463' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (81, N'89b8231d-cc54-42f3-a9f2-e7c54895cc82', CAST(N'2019-02-22T16:24:00.360' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (82, N'42678e51-3161-4c1b-a1b1-5d50e37a1f04', CAST(N'2019-02-22T16:25:12.897' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (83, N'308f93b1-562f-40ee-95b8-85737cc7cf32', CAST(N'2019-02-22T16:26:22.367' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (84, N'f7c3c984-0771-470b-8866-c2af0b48ee05', CAST(N'2019-02-22T16:28:26.083' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (85, N'ca1e53d4-0728-41cb-aab2-64d504116cad', CAST(N'2019-02-22T16:30:00.977' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (86, N'248fd1dc-dd15-4a8c-822a-f38fcf99807b', CAST(N'2019-02-22T16:30:53.107' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (87, N'd657925e-5fb2-47cc-8940-e8b76ae7c9c5', CAST(N'2019-02-22T16:35:24.203' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (88, N'2f71c386-e1e8-4385-bb88-025978bb11c5', CAST(N'2019-02-22T16:37:16.047' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (89, N'bfc93447-d709-49d3-ab49-c21159528a9f', CAST(N'2019-02-22T16:40:16.433' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (90, N'd98024f6-74c5-454b-81d3-3bdf0ea93a88', CAST(N'2019-02-22T16:48:00.750' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (91, N'82dc2346-3acc-47d1-8785-a5973b8f7d56', CAST(N'2019-02-22T16:55:01.367' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (92, N'ccceea0a-2f17-4746-9c47-f648f3551de5', CAST(N'2019-02-22T17:02:09.027' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (93, N'0b1e1602-45d5-4027-a08e-907216d9ec93', CAST(N'2019-02-22T17:02:43.400' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (94, N'd3571bb4-41a9-4d29-978f-98559834353a', CAST(N'2019-02-22T17:03:15.150' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (95, N'7291c044-d4e3-4f1e-b792-4b8d2e1511a9', CAST(N'2019-02-22T17:04:37.203' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (96, N'cbf7f175-d8c9-4b71-8e65-ec38aa82cb3d', CAST(N'2019-02-23T20:47:31.317' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (97, N'dbdf72b2-8c2d-4aec-b07b-2f36aaf61d0b', CAST(N'2019-02-23T20:50:35.797' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (98, N'ff29f254-2a38-42b5-97de-8c9e94182932', CAST(N'2019-02-23T20:54:06.683' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (99, N'cc4489e3-36f0-4fb5-a7ec-946976a169af', CAST(N'2019-02-23T20:56:34.363' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (100, N'5a0fcc38-d438-4e6b-831c-62d3db583f94', CAST(N'2019-02-23T20:58:28.453' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [TuristId]) VALUES (103, N'4ceae28e-1466-43bd-8138-ff36c3c3286b', CAST(N'2019-02-23T21:21:09.423' AS DateTime), N'...', NULL, 1)
SET IDENTITY_INSERT [dbo].[AutorizacijskiToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervacije] ON 

INSERT [dbo].[Rezervacije] ([RezervacijaId], [DatumPocetka], [DatumZavrsetka], [SobaId], [TuristId]) VALUES (10, CAST(N'2019-02-22T00:00:00.000' AS DateTime), CAST(N'2019-02-24T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Rezervacije] ([RezervacijaId], [DatumPocetka], [DatumZavrsetka], [SobaId], [TuristId]) VALUES (11, CAST(N'2019-02-23T00:00:00.000' AS DateTime), CAST(N'2019-02-24T00:00:00.000' AS DateTime), 5, 1)
SET IDENTITY_INSERT [dbo].[Rezervacije] OFF
SET IDENTITY_INSERT [dbo].[Soba] ON 

INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (4, N'Soba 1', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (5, N'Soba 2', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (6, N'Soba 3', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (7, N'Soba 4', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (8, N'Soba 5', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (9, N'Soba 6', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (10, N'Soba 7', CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Soba] ([SobaId], [NazivSobe], [Cijena]) VALUES (11, N'Soba 8', CAST(20.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Soba] OFF
SET IDENTITY_INSERT [dbo].[Turist] ON 

INSERT [dbo].[Turist] ([TuristId], [Ime], [Prezime], [Telefon], [Email], [KorisnickoIme], [LozinkaSalt], [LozinkaHash]) VALUES (1, N'Sead', N'Cehic', N'33', N'ddd', N'test', N'test', N'test')
INSERT [dbo].[Turist] ([TuristId], [Ime], [Prezime], [Telefon], [Email], [KorisnickoIme], [LozinkaSalt], [LozinkaHash]) VALUES (2, N'Adil', N'Joldic', N'062111222', N'adil@edu.fit.ba', N'profa', N'Profa5', NULL)
SET IDENTITY_INSERT [dbo].[Turist] OFF
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201902211404458_initial', N'HotelWIEN_API.Migrations.Configuration', 0x1F8B0800000000000400DD5B4B6FE33610BE17E87F10746A8BAC95642FDBC0DE45EA24ADB19B07E2645BF41230D2D8E146A25C91329214FD653DF427F52F947A9A124589926CC75DEC65C3C737A3E1BCC819FFFBF73FC30F4F9E6B2C21A0D82723F360B06F1A406CDFC1643E3243367BF3CEFCF0FEDB6F86A78EF7647CCED6BD8DD6F19D848ECC07C616479645ED07F0101D78D80E7CEACFD8C0F63D0B39BE75B8BFFFA37570600187303996610CAF43C2B007F11FFCCFB14F6C58B010B9E7BE032E4DC7F9CC3446352E900774816C1899BFF80CDC5F27A71777C7579341B2DE348E5D8C382F537067A68108F119629CD3A35B0A5316F8643E5DF001E4DE3C2F80AF9B219742FA0547ABE5BA1FB37F187D8CB5DA9841D92165BED712F0E06D2A1DABBCBD938CCD5C7A5C7EA75CCEEC39FAEA588623F338647E805F908DBFD0477CE33F02A752A67B347683684FB5B40715187B4661E55EAE2A5CA3A27F7BC638745918C08840C802E4EE1957E1BD8BED8FF01C038C48E8BA22EB9C793E5718E0435781BF80803D5FC34CFD419313D3B08A5056192B47AA8749A43021ECEDA1695C7016D1BD0BB9FE08129BF2EDF03310081003E70A3106013FFE8903F109480C95C87F0EF01770884F594693AB2DB741D338474F9F80CCD9C3C8E4FF358D33FC044E3692F2714B303759BE8905216891F2E0748963DE0244BEA08CE80967FE861B6613C66471EC0440D1C6993D8125B6614266FEC649DD8401A66CE2940EBDB4E9022DF13C3EF2CAEDA6710D6E3C4D1FF022714855F672972D3F0B7CEFDA77AB35305D7537F5C3C0E61F70E3372EBD41C11C5891EDA1B57203B5CE2163AAA53F48B6BD9E0B589D5C5BAB579CF9060D7D1219D78635F92A8017BC053A37E0C22C8A521BA673EA21EC6E9CCA476E52946F78F4B771469FFC174C1ED114B99BF7F829AD5F107D58332D6DCF720D2F102C238705ADDD8BB0F7F57CCC8A09D4C5D194B66FCBDBF0781E7A57BE0DECB122C64B8435C07E47CB80AE056EEADF6BC8A253CC6E425106F188A7CA102EE8E05DB26815B8CB7352B896165405E98EB985882DE714F26C2D73EBC82112E9B434F168D3EBD976A6896D8D5A4F83D767CD17E8052F39D1CD47A731D706B23271B0B1877804E689858DD3978277A631B551F49D4D06A7529D634A7D1BC792515FC232A52EB27B4A1C433F6B4E64A5C8C4B9F4B85AE1055724CEE3C8FC41928D16B1CC660462993916F1F70783038904D74508222540EE989B37D76E4C98ACB898D878815C6D6E4A08AD92E7E8DC728AE59913580089B456FB14FAB292532CD96893E48696A066F5DA27F978951AA81DFEEAF00B098FBE86294385009D78D822E64159C0C34B72C2D37306C6B19DBC448D11B591239B3EB74E670DDAA8E25CE7E0AB1D702B0D549D493FF25BD6BA065F5717CDD7AA796D7DDA6E69DF2BF940F5E9EC9CEF4BE231DFC3F80E08521692F40B0389A731D08A34EE96429AC9D1349328EB53843C0556F7DCBC4A07EAC2B2A4A945E44C1325B06CA2617FC14C2490C26C0352E28F258864B8B45738905A21E5B9BCB0A1F935B1AC39ADD2A4FCB314A726E965ABBC4840571C9055948D86DCE44B992CADFAA0AE17D605DE6BF4422F8E0B58950AD24F0A6AAD690A33BA81A6A72CD6A815D9B5227763ABAAA195940DB3F2A2A5A82F0ECFD162C12F5042BD311D31A649B171FC66DABE06E72518964D2B4A7139B739256E3A680EA5594E9A737A8603CA4E1043F728BA548D1D4F5A263B6D85B3CAE8A9FDB27C829947CBF646FF176345735DB022F6A56067FCABBD287AC697E206E723A1C4A561E4A240AF8C37F6DDD0232D0A867534C45A9D082C8EB74493CA7112AEB4429FC2AA5827A2AE46F591C46A9C88258EEBA3AD521E114B9D0845965C521E2955927456CA368BE6A0652C4A7FD9D23EAA71344C42B5717D9255EA4EF4B05B501BB9385CB73F2F458918F9600B5DC94A4D850FCA06F571D2529288920EE963940A452256694A1FB3500E12110B13ADF192924F055E32B1331626A612BDCDAC064CC3D66A77ABC45D2AEF8802AF2D1CD561166B3705775B986989281470244C614E1F357B3D11D1542F2A6A94FF4D30505C225AEA68158A8672566FDBECC9085507114818D6C7CAEA0A225036B6E51396AE0FE52539F5FC1A51BA2E0CD3D4BDB96751CAE593255141C58FB23A9EC74F9F29036F102D184CFF70C72E4FE9D96AC1392278069425852EF370FFE0B0D4F4B83B0D8816A58E5B71F569E842EC50B8DB46EF1F8E8EA1B170D7B26E2DB7FB91250AEC07147CE7A1A7EF45BCBE2D7D0EE79895EAF33A98E516BF5E0CCA6D7CBDE0CA65FFF88CA4B7CA0971E06964FE196F3A3226BFDD65FBF68CCB801BD591B16FFC554FBB6DEB5C07255E5FF7DA4654556886EA7566A5A6B47EE75F6C3CEB8555682EEB8554D940D60BB1A2496C1D786223580BBC4ECD5E1D0C6213AD561B318DAAEEAA2A77DBA3BBAA335CB13745D74126BB54EEB1534BD6BA7C738BC692EA9EA40E9AB89EC6A08DE89ED40BD4CB3114FB7D9C1DEEF7C9CA04DDFA6C6A4B56FD3B853A95AE95AF82DBEBD5D9BD0A758FEE9CA4ACB6CD7E99CA5257F79E8C4E5AA47850D874AFCD57D55FA3ED5BBE3AEDD9B60F6AAB413BD01D23D76315CF85FD3B5F92D7211E87EFA3EB72126737D222534568FDED335554D6D65F5305BE539D37C543A86975684E4FDA75E8BC7E438D7870CA8E17B507D46B35D98D8E996EA7BCDECF6DD11023BF5C737F29FC269F3B6C8AE72B88E817FA04EC82A7CCD744CF7A99CB2E71942D295D37CE81217EB345C701C33364333E6D03A5F16F193E23378C9F65EEC19990CB902D42C63F19BC7BB7F00389C8F1D7D18FBB7E8A3C0F2F17F1AF67D6F1099C4D1C5DCE2FC94F21769D9CEFB38AFB9002228A28E98D303A4B16DD0CE7CF39D2854F348152F1E581F006BC85CBC1E82599A22574E1ED96C2279823FB392B40A8419A0FA228F6E10946F3007934C558EDE77F721D76BCA7F7FF019D1185549A420000, N'6.1.3-40302')
/****** Object:  Index [IX_TuristId]    Script Date: 23.02.2019. 22:40:05 ******/
CREATE NONCLUSTERED INDEX [IX_TuristId] ON [dbo].[AutorizacijskiToken]
(
	[TuristId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SobaId]    Script Date: 23.02.2019. 22:40:05 ******/
CREATE NONCLUSTERED INDEX [IX_SobaId] ON [dbo].[Rezervacije]
(
	[SobaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TuristId]    Script Date: 23.02.2019. 22:40:05 ******/
CREATE NONCLUSTERED INDEX [IX_TuristId] ON [dbo].[Rezervacije]
(
	[TuristId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AutorizacijskiToken]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AutorizacijskiToken_dbo.Turist_TuristId] FOREIGN KEY([TuristId])
REFERENCES [dbo].[Turist] ([TuristId])
GO
ALTER TABLE [dbo].[AutorizacijskiToken] CHECK CONSTRAINT [FK_dbo.AutorizacijskiToken_dbo.Turist_TuristId]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rezervacije_dbo.Soba_SobaId] FOREIGN KEY([SobaId])
REFERENCES [dbo].[Soba] ([SobaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_dbo.Rezervacije_dbo.Soba_SobaId]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rezervacije_dbo.Turist_TuristId] FOREIGN KEY([TuristId])
REFERENCES [dbo].[Turist] ([TuristId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_dbo.Rezervacije_dbo.Turist_TuristId]
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
