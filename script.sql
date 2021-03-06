USE [master]
GO
/****** Object:  Database [fCarePlus]    Script Date: 6/27/2021 7:15:12 PM ******/
CREATE DATABASE [fCarePlus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fCarePlus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fCarePlus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fCarePlus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fCarePlus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [fCarePlus] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fCarePlus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fCarePlus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fCarePlus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fCarePlus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fCarePlus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fCarePlus] SET ARITHABORT OFF 
GO
ALTER DATABASE [fCarePlus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fCarePlus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fCarePlus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fCarePlus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fCarePlus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fCarePlus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fCarePlus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fCarePlus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fCarePlus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fCarePlus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fCarePlus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fCarePlus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fCarePlus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fCarePlus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fCarePlus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fCarePlus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fCarePlus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fCarePlus] SET RECOVERY FULL 
GO
ALTER DATABASE [fCarePlus] SET  MULTI_USER 
GO
ALTER DATABASE [fCarePlus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fCarePlus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fCarePlus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fCarePlus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fCarePlus] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'fCarePlus', N'ON'
GO
ALTER DATABASE [fCarePlus] SET QUERY_STORE = OFF
GO
USE [fCarePlus]
GO
/****** Object:  Table [dbo].[AccountsChart]    Script Date: 6/27/2021 7:15:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsChart](
	[ID] [uniqueidentifier] NOT NULL,
	[NameAR] [nvarchar](150) NOT NULL,
	[NameEN] [nvarchar](150) NOT NULL,
	[Number] [varchar](50) NOT NULL,
	[FK_Transaction_Type_ID] [smallint] NOT NULL,
	[Allow_Entry] [bit] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Creation_Date] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[Parent_ID] [uniqueidentifier] NULL,
	[Parent_Number] [varchar](50) NULL,
	[Chart_Level_Depth] [smallint] NOT NULL,
	[FK_Cost_Center_Type_ID] [smallint] NULL,
	[Branch_ID] [bigint] NOT NULL,
	[Org_ID] [bigint] NOT NULL,
	[FK_Work_Fields_ID] [uniqueidentifier] NULL,
	[noOfChilds] [smallint] NULL,
 CONSTRAINT [PK__Accounts__3214EC2748817F42] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JournalDetails]    Script Date: 6/27/2021 7:15:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalDetails](
	[JournalDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[FK_JournalHeadrer_ID] [int] NULL,
	[Creditor] [int] NULL,
	[Debit] [int] NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[AccountName] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Seller] [nvarchar](100) NULL,
 CONSTRAINT [PK_JournalDetails] PRIMARY KEY CLUSTERED 
(
	[JournalDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JournalHeader]    Script Date: 6/27/2021 7:15:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalHeader](
	[JournalHeadrerID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfEntry] [datetime] NULL,
	[ReferenceNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_JournalHeader] PRIMARY KEY CLUSTERED 
(
	[JournalHeadrerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountsChart] ADD  CONSTRAINT [DF__AccountsC__Statu__2DE6D218]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[JournalHeader] ADD  CONSTRAINT [DF_JournalHeader_DateOfEntry]  DEFAULT (getdate()) FOR [DateOfEntry]
GO
ALTER TABLE [dbo].[JournalDetails]  WITH CHECK ADD  CONSTRAINT [FK_JournalDetails_JournalHeader] FOREIGN KEY([FK_JournalHeadrer_ID])
REFERENCES [dbo].[JournalHeader] ([JournalHeadrerID])
GO
ALTER TABLE [dbo].[JournalDetails] CHECK CONSTRAINT [FK_JournalDetails_JournalHeader]
GO
USE [master]
GO
ALTER DATABASE [fCarePlus] SET  READ_WRITE 
GO
