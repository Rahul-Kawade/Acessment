USE [master]
GO
/****** Object:  Database [ContactsDB]    Script Date: 22-Sep-21 5:05:28 PM ******/
CREATE DATABASE [ContactsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContactsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ContactsDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContactsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ContactsDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ContactsDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContactsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContactsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContactsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContactsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContactsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContactsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContactsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContactsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContactsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContactsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContactsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContactsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContactsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContactsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContactsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContactsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContactsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContactsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContactsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContactsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContactsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContactsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContactsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContactsDB] SET  MULTI_USER 
GO
ALTER DATABASE [ContactsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContactsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContactsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContactsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ContactsDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ContactsDB]
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 22-Sep-21 5:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactDetails](
	[Contactid] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [numeric](18, 0) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ContactDetails] PRIMARY KEY CLUSTERED 
(
	[Contactid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ContactDetails] ON 

INSERT [dbo].[ContactDetails] ([Contactid], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (1, N'Rahul', N'Kawade', N'rahuldkawade@gmail.com', CAST(8329839539 AS Numeric(18, 0)), 1)
INSERT [dbo].[ContactDetails] ([Contactid], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (2, N'Mike', N'Spngberb', N'mikes@gmail.com', CAST(8965412378 AS Numeric(18, 0)), 1)
INSERT [dbo].[ContactDetails] ([Contactid], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (3, N'Amol', N'Raut', N'amolraut@yahoo.com', CAST(9796325142 AS Numeric(18, 0)), 1)
INSERT [dbo].[ContactDetails] ([Contactid], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (4, N'Nilesh', N'Pawar', N'nileshpawar@gmail.com', CAST(7845126932 AS Numeric(18, 0)), 1)
INSERT [dbo].[ContactDetails] ([Contactid], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (5, N'Swapneel', N'Salunkhe', N'swp.sal@gmail.com', CAST(8526985652 AS Numeric(18, 0)), 1)
INSERT [dbo].[ContactDetails] ([Contactid], [FirstName], [LastName], [Email], [PhoneNumber], [Status]) VALUES (6, N'test', N'last', N'rahusl@gmail.com', CAST(458963527 AS Numeric(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[ContactDetails] OFF
/****** Object:  StoredProcedure [dbo].[pr_insertContactDeatils]    Script Date: 22-Sep-21 5:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_insertContactDeatils]
@FirstName varchar(20),
@LastName varchar(20),
@Email varchar(50),
@PhoneNumber int

As 
begin
set nocount on;

INSERT INTO [dbo].[ContactDetails]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[PhoneNumber])
     VALUES
           (@FirstName,
           @LastName,
           @Email,
           @PhoneNumber)
end



GO
USE [master]
GO
ALTER DATABASE [ContactsDB] SET  READ_WRITE 
GO
