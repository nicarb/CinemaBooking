USE [master]
GO
/****** Object:  Database [cinema_booking]    Script Date: 2/28/2017 8:07:19 PM ******/
IF EXISTS(select * from sys.databases where name='cinema_booking')
DROP DATABASE [cinema_booking]
GO
/****** Object:  Database [cinema_booking]    Script Date: 2/24/2017 1:19:27 AM ******/
CREATE DATABASE [cinema_booking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cinema_booking', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\cinema_booking.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cinema_booking_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\cinema_booking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cinema_booking] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cinema_booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cinema_booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cinema_booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cinema_booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cinema_booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cinema_booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [cinema_booking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cinema_booking] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [cinema_booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cinema_booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cinema_booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cinema_booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cinema_booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cinema_booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cinema_booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cinema_booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cinema_booking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cinema_booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cinema_booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cinema_booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cinema_booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cinema_booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cinema_booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cinema_booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cinema_booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cinema_booking] SET  MULTI_USER 
GO
ALTER DATABASE [cinema_booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cinema_booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cinema_booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cinema_booking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [cinema_booking]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[idcategory] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[desc] [text] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[idcategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema](
	[idcinema] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[desc] [text] NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_cinema] PRIMARY KEY CLUSTERED 
(
	[idcinema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[idlanguage] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[desc] [nchar](100) NULL,
	[acronym] [nchar](3) NULL,
 CONSTRAINT [PK_language] PRIMARY KEY CLUSTERED 
(
	[idlanguage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[idmovie] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](100) NULL,
	[plot] [varchar](500) NULL,
	[length] [smallint] NULL,
	[iddirector] [int] NULL,
	[idwriter] [int] NULL,
	[release_year] [date] NULL,
	[idlanguage] [int] NULL,
	[rating] [tinyint] NULL,
	[cover] [image] NULL,
 CONSTRAINT [PK_movie] PRIMARY KEY CLUSTERED 
(
	[idmovie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCategory](
	[idmovie_category] [int] IDENTITY(1,1) NOT NULL,
	[idmovie] [int] NOT NULL,
	[idcategory] [int] NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_movie_category] PRIMARY KEY CLUSTERED 
(
	[idmovie_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[idperson] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[surname] [nchar](45) NULL,
	[birthdate] [date] NULL,
	[gender] [char](1) NULL,
	[address] [nchar](200) NULL,
	[email] [nchar](100) NULL,
	[update_date] [datetime] NULL,
	[insertion_date] [datetime] NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[idperson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[idrole] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[desc] [nchar](100) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[idrole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheatreRoom]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheatreRoom](
	[idtheatre_room] [int] IDENTITY(1,1) NOT NULL,
	[idmovie] [int] NULL,
	[name] [nvarchar](50) NULL,
	[desc] [text] NULL,
	[rows_nr] [int] NULL,
	[seats_per_row] [int] NULL,
	[idcinema] [int] NULL,
 CONSTRAINT [PK_TheatreRoom] PRIMARY KEY CLUSTERED 
(
	[idtheatre_room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[idperson] [int] NULL,
	[username] [nchar](30) NULL,
	[password] [nchar](130) NULL,
	[isactive] [bit] NULL,
	[update_date] [datetime] NULL,
	[insertion_date] [datetime] NULL,
	[role] [nchar](1) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_iddirector_movie_idperson_person] FOREIGN KEY([iddirector])
REFERENCES [dbo].[Person] ([idperson])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_iddirector_movie_idperson_person]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_idlanguage_movie_idlanguage_language] FOREIGN KEY([idlanguage])
REFERENCES [dbo].[Language] ([idlanguage])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_idlanguage_movie_idlanguage_language]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_idwriter_movie_idperson_person] FOREIGN KEY([idwriter])
REFERENCES [dbo].[Person] ([idperson])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_idwriter_movie_idperson_person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is the primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'idperson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Values should be ''M'' or ''F''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'gender'
GO
/****** Object:  Table [dbo].[TheatreRoom]    Script Date: 3/1/2017 12:25:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TheatreRoom](
	[idtheatre_room] [int] IDENTITY(1,1) NOT NULL,
	[idmovie] [int] NULL,
	[name] [nvarchar](50) NULL,
	[desccription] [text] NULL,
	[rows_nr] [int] NULL,
	[seats_per_row] [int] NULL,
	[idcinema] [int] NULL,
 CONSTRAINT [PK_TheatreRoom] PRIMARY KEY CLUSTERED 
(
	[idtheatre_room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Movie_projection]    Script Date: 3/1/2017 12:25:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Movie_projection](
	[idmovie_projection] [int] IDENTITY(1,1) NOT NULL,
	[idmovie] [int] NULL,
	[idtheatre_room] [int] NULL,
	[description] [nvarchar](max) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_Movie_projection] PRIMARY KEY CLUSTERED 
(
	[idmovie_projection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movie_projection]  WITH CHECK ADD  CONSTRAINT [FK_Movie_projection_Movie] FOREIGN KEY([idmovie])
REFERENCES [dbo].[Movie] ([idmovie])
GO
ALTER TABLE [dbo].[Movie_projection] CHECK CONSTRAINT [FK_Movie_projection_Movie]

GO
/****** Object:  Table [dbo].[ProjectionTime]    Script Date: 3/1/2017 12:31:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProjectionTime](
	[idprojection_time] [int] IDENTITY(1,1) NOT NULL,
	[idmovie_projection] [int] NULL,
	[idmovie] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_ProjectionTime] PRIMARY KEY CLUSTERED 
(
	[idprojection_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProjectionTime]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionTime_Movie] FOREIGN KEY([idmovie])
REFERENCES [dbo].[Movie] ([idmovie])
GO
ALTER TABLE [dbo].[ProjectionTime] CHECK CONSTRAINT [FK_ProjectionTime_Movie]
GO
ALTER TABLE [dbo].[ProjectionTime]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionTime_MovieProjection] FOREIGN KEY([idmovie_projection])
REFERENCES [dbo].[MovieProjection] ([idmovie_projection])
GO
ALTER TABLE [dbo].[ProjectionTime] CHECK CONSTRAINT [FK_ProjectionTime_MovieProjection]

GO
/****** Object:  Table [dbo].[Seat]    Script Date: 3/1/2017 11:06:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Seat](
	[idseat] [int] IDENTITY(1,1) NOT NULL,
	[idtheatre_room] [int] NULL,
	[row_nr] [int] NULL,
	[seat_nr] [int] NULL,
	[row_char] [nchar](1) NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[idseat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/1/2017 12:37:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Item](
	[iditem] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[description] [nchar](256) NULL,
	[unit_price] [decimal](18, 0) NULL,
	[iditem_type] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[iditem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([iditem_type])
REFERENCES [dbo].[ItemType] ([iditem_type])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 3/1/2017 12:38:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ticket](
	[idticket] [int] IDENTITY(1,1) NOT NULL,
	[iditem] [int] NULL,
	[idseat] [int] NULL,
	[iduser] [int] NULL,
	[idmovie_projection] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[barcode] [numeric](18, 0) NULL,
	[booking_time] [datetime] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[idticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Item] FOREIGN KEY([iditem])
REFERENCES [dbo].[Item] ([iditem])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Item]

GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Seat] FOREIGN KEY([idseat])
REFERENCES [dbo].[Seat] ([idseat])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Seat]

GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_User] FOREIGN KEY([iduser])
REFERENCES [dbo].[User] ([iduser])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_User]

GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_MovieProjection] FOREIGN KEY([idmovie_projection])
REFERENCES [dbo].[MovieProjection] ([idmovie_projection])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_MovieProjection]

GO

/****** Object:  Table [dbo].[ItemType]    Script Date: 3/1/2017 12:42:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ItemType](
	[iditem_type] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[description] [nchar](100) NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[iditem_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Item]    Script Date: 3/1/2017 12:43:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Item](
	[iditem] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[description] [nchar](256) NULL,
	[unit_price] [decimal](18, 0) NULL,
	[iditem_type] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[iditem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([iditem_type])
REFERENCES [dbo].[ItemType] ([iditem_type])
GO

ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/1/2017 1:52:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order](
	[idorder] [int] IDENTITY(1,1) NOT NULL,
	[idcustomer] [int] NULL,
	[idstaff] [int] NULL,
	[orderdate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_Customer] FOREIGN KEY([idcustomer])
REFERENCES [dbo].[User] ([iduser])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_Customer]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_Staff] FOREIGN KEY([idstaff])
REFERENCES [dbo].[User] ([iduser])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_Staff]
GO

/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/1/2017 1:57:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderDetail](
	[idorder_detail] [int] IDENTITY(1,1) NOT NULL,
	[idorder] [int] NULL,
	[iditem] [int] NULL,
	[unit_price] [decimal](18, 0) NULL,
	[quantity] [tinyint] NULL,
	[discount_percentage] [tinyint] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[idorder_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([idorder])
REFERENCES [dbo].[Order] ([idorder])
GO

ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO

USE [master]
GO
ALTER DATABASE [cinema_booking] SET  READ_WRITE 
GO
USE [cinema_booking]
GO
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Abkhazian', '', 'ABK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Achinese', '', 'ACE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Acoli', '', 'ACH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Adangme', '', 'ADA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Adyghe; Adygei', '', 'ADY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Afro-Asiatic languages', '', 'AFA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Afrihili', '', 'AFH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Afrikaans', '', 'AFR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ainu', '', 'AIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Akan', '', 'AKA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Akkadian', '', 'AKK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Albanian', '', 'ALB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Aleut', '', 'ALE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Algonquian languages', '', 'ALG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Southern Altai', '', 'ALT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Amharic', '', 'AMH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('English, Old (ca.450-1100)', '', 'ANG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Angika', '', 'ANP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Apache languages', '', 'APA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Arabic', '', 'ARA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Aragonese', '', 'ARG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Armenian', '', 'ARM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mapudungun; Mapuche', '', 'ARN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Arapaho', '', 'ARP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Artificial languages', '', 'ART');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Arawak', '', 'ARW');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Assamese', '', 'ASM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Asturian; Bable; Leonese; Asturleonese', '', 'AST');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Athapascan languages', '', 'ATH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Australian languages', '', 'AUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Avaric', '', 'AVA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Avestan', '', 'AVE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Awadhi', '', 'AWA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Aymara', '', 'AYM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Azerbaijani', '', 'AZE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Banda languages', '', 'BAD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bamileke languages', '', 'BAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bashkir', '', 'BAK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Baluchi', '', 'BAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bambara', '', 'BAM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Balinese', '', 'BAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Basque', '', 'BAQ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Basa', '', 'BAS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Baltic languages', '', 'BAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Beja; Bedawiyet', '', 'BEJ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Belarusian', '', 'BEL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bemba', '', 'BEM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bengali', '', 'BEN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Berber languages', '', 'BER');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bhojpuri', '', 'BHO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bihari languages', '', 'BIH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bikol', '', 'BIK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bini; Edo', '', 'BIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bislama', '', 'BIS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Siksika', '', 'BLA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bantu (Other)', '', 'BNT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bosnian', '', 'BOS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Braj', '', 'BRA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Breton', '', 'BRE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Batak languages', '', 'BTK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Buriat', '', 'BUA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Buginese', '', 'BUG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Bulgarian', '', 'BUL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Burmese', '', 'BUR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Blin; Bilin', '', 'BYN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Caddo', '', 'CAD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Central American Indian languages', '', 'CAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Galibi Carib', '', 'CAR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Catalan; Valencian', '', 'CAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Caucasian languages', '', 'CAU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Cebuano', '', 'CEB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Celtic languages', '', 'CEL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chamorro', '', 'CHA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chibcha', '', 'CHB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chechen', '', 'CHE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chagatai', '', 'CHG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chinese', '', 'CHI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chuukese', '', 'CHK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mari', '', 'CHM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chinook jargon', '', 'CHN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Choctaw', '', 'CHO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chipewyan; Dene Suline', '', 'CHP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Cherokee', '', 'CHR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chuvash', '', 'CHV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Cheyenne', '', 'CHY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chamic languages', '', 'CMC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Coptic', '', 'COP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Cornish', '', 'COR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Corsican', '', 'COS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Creoles and pidgins, English based', '', 'CPE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Creoles and pidgins, French-based', '', 'CPF');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Creoles and pidgins, Portuguese-based', '', 'CPP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Cree', '', 'CRE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Crimean Tatar; Crimean Turkish', '', 'CRH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Creoles and pidgins', '', 'CRP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kashubian', '', 'CSB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Cushitic languages', '', 'CUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Czech', '', 'CZE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dakota', '', 'DAK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Danish', '', 'DAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dargwa', '', 'DAR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Land Dayak languages', '', 'DAY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Delaware', '', 'DEL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Slave (Athapascan)', '', 'DEN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dogrib', '', 'DGR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dinka', '', 'DIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Divehi; Dhivehi; Maldivian', '', 'DIV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dogri', '', 'DOI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dravidian languages', '', 'DRA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lower Sorbian', '', 'DSB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Duala', '', 'DUA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dutch, Middle (ca.1050-1350)', '', 'DUM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dutch; Flemish', '', 'DUT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dyula', '', 'DYU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Dzongkha', '', 'DZO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Efik', '', 'EFI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Egyptian (Ancient)', '', 'EGY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ekajuk', '', 'EKA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Elamite', '', 'ELX');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('English', '', 'ENG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('English, Middle (1100-1500)', '', 'ENM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Esperanto', '', 'EPO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Estonian', '', 'EST');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ewe', '', 'EWE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ewondo', '', 'EWO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Fang', '', 'FAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Faroese', '', 'FAO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Fanti', '', 'FAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Fijian', '', 'FIJ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Filipino; Pilipino', '', 'FIL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Finnish', '', 'FIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Finno-Ugrian languages', '', 'FIU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Fon', '', 'FON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('French', '', 'FRE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('French, Middle (ca.1400-1600)', '', 'FRM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('French, Old (842-ca.1400)', '', 'FRO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Northern Frisian', '', 'FRR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Eastern Frisian', '', 'FRS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Western Frisian', '', 'FRY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Fulah', '', 'FUL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Friulian', '', 'FUR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ga', '', 'GAA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gayo', '', 'GAY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gbaya', '', 'GBA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Germanic languages', '', 'GEM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Georgian', '', 'GEO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('German', '', 'GER');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Geez', '', 'GEZ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gilbertese', '', 'GIL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gaelic; Scottish Gaelic', '', 'GLA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Irish', '', 'GLE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Galician', '', 'GLG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Manx', '', 'GLV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('German, Middle High (ca.1050-1500)', '', 'GMH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('German, Old High (ca.750-1050)', '', 'GOH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gondi', '', 'GON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gorontalo', '', 'GOR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gothic', '', 'GOT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Grebo', '', 'GRB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Greek, Ancient (to 1453)', '', 'GRC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Greek, Modern (1453-)', '', 'GRE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Guarani', '', 'GRN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Swiss German; Alemannic; Alsatian', '', 'GSW');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gujarati', '', 'GUJ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Gwich''in', '', 'GWI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Haida', '', 'HAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Haitian; Haitian Creole', '', 'HAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hausa', '', 'HAU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hawaiian', '', 'HAW');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hebrew', '', 'HEB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Herero', '', 'HER');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hiligaynon', '', 'HIL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Himachali languages; Western Pahari languages', '', 'HIM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hindi', '', 'HIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hittite', '', 'HIT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hmong; Mong', '', 'HMN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hiri Motu', '', 'HMO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Croatian', '', 'HRV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Upper Sorbian', '', 'HSB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hungarian', '', 'HUN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Hupa', '', 'HUP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Iban', '', 'IBA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Igbo', '', 'IBO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Icelandic', '', 'ICE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ido', '', 'IDO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sichuan Yi; Nuosu', '', 'III');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ijo languages', '', 'IJO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Inuktitut', '', 'IKU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Interlingue; Occidental', '', 'ILE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Iloko', '', 'ILO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Indic languages', '', 'INC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Indonesian', '', 'IND');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Indo-European languages', '', 'INE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ingush', '', 'INH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Inupiaq', '', 'IPK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Iranian languages', '', 'IRA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Iroquoian languages', '', 'IRO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Italian', '', 'ITA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Javanese', '', 'JAV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lojban', '', 'JBO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Japanese', '', 'JPN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Judeo-Persian', '', 'JPR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Judeo-Arabic', '', 'JRB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kara-Kalpak', '', 'KAA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kabyle', '', 'KAB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kachin; Jingpho', '', 'KAC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kalaallisut; Greenlandic', '', 'KAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kamba', '', 'KAM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kannada', '', 'KAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Karen languages', '', 'KAR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kashmiri', '', 'KAS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kanuri', '', 'KAU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kawi', '', 'KAW');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kazakh', '', 'KAZ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kabardian', '', 'KBD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Khasi', '', 'KHA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Khoisan languages', '', 'KHI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Central Khmer', '', 'KHM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Khotanese; Sakan', '', 'KHO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kikuyu; Gikuyu', '', 'KIK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kinyarwanda', '', 'KIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kirghiz; Kyrgyz', '', 'KIR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kimbundu', '', 'KMB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Konkani', '', 'KOK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Komi', '', 'KOM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kongo', '', 'KON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Korean', '', 'KOR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kosraean', '', 'KOS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kpelle', '', 'KPE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Karachay-Balkar', '', 'KRC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Karelian', '', 'KRL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kru languages', '', 'KRO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kurukh', '', 'KRU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kuanyama; Kwanyama', '', 'KUA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kumyk', '', 'KUM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kurdish', '', 'KUR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kutenai', '', 'KUT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ladino', '', 'LAD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lahnda', '', 'LAH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lamba', '', 'LAM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lao', '', 'LAO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Latin', '', 'LAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Latvian', '', 'LAV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lezghian', '', 'LEZ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Limburgan; Limburger; Limburgish', '', 'LIM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lingala', '', 'LIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lithuanian', '', 'LIT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mongo', '', 'LOL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lozi', '', 'LOZ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Luxembourgish; Letzeburgesch', '', 'LTZ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Luba-Lulua', '', 'LUA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Luba-Katanga', '', 'LUB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ganda', '', 'LUG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Luiseno', '', 'LUI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lunda', '', 'LUN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Luo (Kenya and Tanzania)', '', 'LUO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lushai', '', 'LUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Macedonian', '', 'MAC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Madurese', '', 'MAD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Magahi', '', 'MAG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Marshallese', '', 'MAH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Maithili', '', 'MAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Makasar', '', 'MAK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Malayalam', '', 'MAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mandingo', '', 'MAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Maori', '', 'MAO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Austronesian languages', '', 'MAP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Marathi', '', 'MAR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Masai', '', 'MAS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Malay', '', 'MAY');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Moksha', '', 'MDF');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mandar', '', 'MDR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mende', '', 'MEN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Irish, Middle (900-1200)', '', 'MGA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mi''kmaq; Micmac', '', 'MIC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Minangkabau', '', 'MIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Uncoded languages', '', 'MIS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mon-Khmer languages', '', 'MKH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Malagasy', '', 'MLG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Maltese', '', 'MLT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Manchu', '', 'MNC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Manipuri', '', 'MNI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Manobo languages', '', 'MNO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mohawk', '', 'MOH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mongolian', '', 'MON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mossi', '', 'MOS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Multiple languages', '', 'MUL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Munda languages', '', 'MUN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Creek', '', 'MUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mirandese', '', 'MWL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Marwari', '', 'MWR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Mayan languages', '', 'MYN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Erzya', '', 'MYV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nahuatl languages', '', 'NAH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('North American Indian languages', '', 'NAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Neapolitan', '', 'NAP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nauru', '', 'NAU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Navajo; Navaho', '', 'NAV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ndebele, South; South Ndebele', '', 'NBL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ndebele, North; North Ndebele', '', 'NDE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ndonga', '', 'NDO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nepali', '', 'NEP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nepal Bhasa; Newari', '', 'NEW');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nias', '', 'NIA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Niger-Kordofanian languages', '', 'NIC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Niuean', '', 'NIU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Norwegian Nynorsk; Nynorsk, Norwegian', '', 'NNO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('BokmÃ¥l, Norwegian; Norwegian BokmÃ¥l', '', 'NOB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nogai', '', 'NOG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Norse, Old', '', 'NON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Norwegian', '', 'NOR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('N''Ko', '', 'NQO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pedi; Sepedi; Northern Sotho', '', 'NSO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nubian languages', '', 'NUB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Chichewa; Chewa; Nyanja', '', 'NYA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nyamwezi', '', 'NYM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nyankole', '', 'NYN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nyoro', '', 'NYO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nzima', '', 'NZI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Occitan (post 1500); ProvenÃ§al', '', 'OCI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ojibwa', '', 'OJI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Oriya', '', 'ORI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Oromo', '', 'ORM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Osage', '', 'OSA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ossetian; Ossetic', '', 'OSS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Turkish, Ottoman (1500-1928)', '', 'OTA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Otomian languages', '', 'OTO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Papuan languages', '', 'PAA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pangasinan', '', 'PAG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pahlavi', '', 'PAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pampanga; Kapampangan', '', 'PAM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Panjabi; Punjabi', '', 'PAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Papiamento', '', 'PAP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Palauan', '', 'PAU');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Persian, Old (ca.600-400 B.C.)', '', 'PEO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Persian', '', 'PER');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Philippine languages', '', 'PHI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Phoenician', '', 'PHN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pali', '', 'PLI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Polish', '', 'POL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pohnpeian', '', 'PON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Portuguese', '', 'POR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Prakrit languages', '', 'PRA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('ProvenÃ§al, Old (to 1500)', '', 'PRO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Pushto; Pashto', '', 'PUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Quechua', '', 'QUE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Rajasthani', '', 'RAJ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Rapanui', '', 'RAP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Rarotongan; Cook Islands Maori', '', 'RAR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Romance languages', '', 'ROA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Romansh', '', 'ROH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Romany', '', 'ROM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Romanian; Moldavian; Moldovan', '', 'RUM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Rundi', '', 'RUN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Aromanian; Arumanian; Macedo-Romanian', '', 'RUP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Russian', '', 'RUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sandawe', '', 'SAD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sango', '', 'SAG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Yakut', '', 'SAH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('South American Indian (Other)', '', 'SAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Salishan languages', '', 'SAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Samaritan Aramaic', '', 'SAM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sanskrit', '', 'SAN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sasak', '', 'SAS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Santali', '', 'SAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sicilian', '', 'SCN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Scots', '', 'SCO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Selkup', '', 'SEL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Semitic languages', '', 'SEM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Irish, Old (to 900)', '', 'SGA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sign Languages', '', 'SGN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Shan', '', 'SHN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sidamo', '', 'SID');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sinhala; Sinhalese', '', 'SIN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Siouan languages', '', 'SIO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sino-Tibetan languages', '', 'SIT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Slavic languages', '', 'SLA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Slovak', '', 'SLO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Slovenian', '', 'SLV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Southern Sami', '', 'SMA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Northern Sami', '', 'SME');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sami languages', '', 'SMI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Lule Sami', '', 'SMJ');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Inari Sami', '', 'SMN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Samoan', '', 'SMO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Skolt Sami', '', 'SMS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Shona', '', 'SNA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sindhi', '', 'SND');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Soninke', '', 'SNK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sogdian', '', 'SOG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Somali', '', 'SOM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Songhai languages', '', 'SON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sotho, Southern', '', 'SOT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Spanish; Castilian', '', 'SPA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sardinian', '', 'SRD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sranan Tongo', '', 'SRN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Serbian', '', 'SRP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Serer', '', 'SRR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Nilo-Saharan languages', '', 'SSA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Swati', '', 'SSW');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sukuma', '', 'SUK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sundanese', '', 'SUN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Susu', '', 'SUS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sumerian', '', 'SUX');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Swahili', '', 'SWA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Swedish', '', 'SWE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Classical Syriac', '', 'SYC');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Syriac', '', 'SYR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tahitian', '', 'TAH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tai languages', '', 'TAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tamil', '', 'TAM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tatar', '', 'TAT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Telugu', '', 'TEL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Timne', '', 'TEM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tereno', '', 'TER');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tetum', '', 'TET');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tajik', '', 'TGK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tagalog', '', 'TGL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Thai', '', 'THA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tibetan', '', 'TIB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tigre', '', 'TIG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tigrinya', '', 'TIR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tiv', '', 'TIV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tokelau', '', 'TKL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Klingon; tlhIngan-Hol', '', 'TLH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tlingit', '', 'TLI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tamashek', '', 'TMH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tonga (Nyasa)', '', 'TOG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tonga (Tonga Islands)', '', 'TON');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tok Pisin', '', 'TPI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tsimshian', '', 'TSI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tswana', '', 'TSN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tsonga', '', 'TSO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Turkmen', '', 'TUK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tumbuka', '', 'TUM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tupi languages', '', 'TUP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Turkish', '', 'TUR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Altaic languages', '', 'TUT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tuvalu', '', 'TVL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Twi', '', 'TWI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Tuvinian', '', 'TYV');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Udmurt', '', 'UDM');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ugaritic', '', 'UGA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Uighur; Uyghur', '', 'UIG');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Ukrainian', '', 'UKR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Umbundu', '', 'UMB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Undetermined', '', 'UND');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Urdu', '', 'URD');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Uzbek', '', 'UZB');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Vai', '', 'VAI');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Venda', '', 'VEN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Vietnamese', '', 'VIE');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('VolapÃ¼k', '', 'VOL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Votic', '', 'VOT');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Wakashan languages', '', 'WAK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Walamo', '', 'WAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Waray', '', 'WAR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Washo', '', 'WAS');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Welsh', '', 'WEL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Sorbian languages', '', 'WEN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Walloon', '', 'WLN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Wolof', '', 'WOL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Kalmyk; Oirat', '', 'XAL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Xhosa', '', 'XHO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Yao', '', 'YAO');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Yapese', '', 'YAP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Yiddish', '', 'YID');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Yoruba', '', 'YOR');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Yupik languages', '', 'YPK');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Zapotec', '', 'ZAP');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Blissymbols; Blissymbolics; Bliss', '', 'ZBL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Zenaga', '', 'ZEN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Standard Moroccan Tamazight', '', 'ZGH');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Zhuang; Chuang', '', 'ZHA');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Zande languages', '', 'ZND');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Zulu', '', 'ZUL');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('Zuni', '', 'ZUN');
INSERT INTO [dbo].[Language] ([name],[desc],[acronym]) VALUES ('No linguistic content; Not applicable', '', 'ZXX');
GO
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Fantasy' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Action' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Science fiction' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Drama' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Romance' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Crime' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Thriller' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Mystery' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('History' ,'');
INSERT INTO [dbo].[Category]([name],[desc]) VALUES ('Musical' ,'');
GO
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('arber','fama','1987-04-21','M','bla bla','arberfama@gmail.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Vali','Pine','1994-06-10','F','bla bla','vanjelapine@gmail.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Xhuliana','Hima','','F','bla bla','xhulihima@hotmail.it', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Mario','Rossi','','M','askdfj','unknown@unknown.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Chris','McKay','','M','ksdfasd','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('James','Mangold','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('James','Foley','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Chad','Stahelski','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Zhang','Yimou','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Theodore','Melfi','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Garth','Jennings','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO [dbo].[Person] ([name] ,[surname] ,[birthdate] ,[gender] ,[address] ,[email] ,[update_date] ,[insertion_date]) VALUES ('Peter','Berg','','M','','', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
GO
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('The Lego Batman Movie','There are big changes brewing in Gotham, but if Batman (Will Arnett) wants to save the city from the Joker''s (Zach Galifianakis) hostile takeover, he may have to drop the lone vigilante thing, try to work with others and maybe, just maybe, learn to lighten up. Maybe his superhero sidekick Robin (Michael Cera) and loyal butler Alfred (Ralph Fiennes) can show him a thing or two.',129,5,NULL,'2017-02-09',120,77);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('Logan','In the near future, a weary Logan (Hugh Jackman) cares for an ailing Professor X (Patrick Stewart) at a remote outpost on the Mexican border. His attempt to hide from the outside world gets upended when X introduces him to a young mutant named Laura (Dafne Keen). Logan must now protect the girl and battle the dark forces that want to capture her.',141,6,NULL,'2017-02-03',120,96);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('Fifty Shades Darker','When a wounded Christian Grey tries to entice a cautious Ana Steele back into his life, she demands a new arrangement before she will give him another chance. As the two begin to build trust and find stability, shadowy figures from Christian''s past start to circle the couple, determined to destroy their hopes for a future together.',118,7,NULL,'2017-02-09',120,49);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('John Wick: Chapter 2','Legendary hitman John Wick is forced back out of retirement by a former associate plotting to seize control of a shadowy international assassins'' guild. Bound by a blood oath to help him, John travels to Rome where he squares off against some of the world''s deadliest killers.',122,8,NULL,'2017-02-02',120,83);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('The Great Wall','The Great Wall is a 2016 monster film directed by Zhang Yimou and starring Matt Damon, who plays a European mercenary in China during the Song dynasty. He encounters the Great Wall of China and meets Chinese soldiers who defend against monsters.',120,9,NULL,'2016-12-16',120,63);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('Hidden Figures','The incredible untold story of Katherine G. Johnson, Dorothy Vaughan and Mary Jackson - brilliant African-American women working at NASA, who served as the brains behind one of the greatest operations in history: the launch of astronaut John Glenn into orbit, a stunning achievement that restored the nation''s confidence, turned around the Space Race, and galvanized the world. The visionary trio crossed all gender and race lines to inspire generations to dream big.',127,10,NULL,'2016-12-25',120,74);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('Sing','Dapper Koala Buster Moon presides over a once-grand theater that has fallen on hard times. An eternal optimist, and a bit of a scoundrel, he loves his theater above all and will do anything to preserve it. Facing the crumbling of his life''s ambition, he takes one final chance to restore his fading jewel to its former glory by producing the world''s greatest singing competition. Five contestants emerge: a mouse, a timid elephant, a pig, a gorilla and a punk-rock porcupine.',110,11,NULL,'2016-12-08',120,73);
INSERT INTO [dbo].[Movie] ([title] ,[plot] ,[length] ,[iddirector] ,[idwriter] ,[release_year] ,[idlanguage] ,[rating] ) VALUES ('Patriots Day','Tragedy strikes on April 15, 2013, when two bombs explode during the Boston Marathon. In the aftermath of the attack, police Sgt. Tommy Saunders (Mark Wahlberg), FBI Special Agent Richard DesLauriers (Kevin Bacon) and Commissioner Ed Davis (John Goodman) join courageous survivors, first responders and other investigators in a race against the clock to hunt down the suspects and bring them to justice.',133,12,NULL,'2016-12-21',120,75);
GO
INSERT INTO [dbo].[User] ([idperson] ,[username] ,[password] ,[isactive] ,[update_date] ,[insertion_date] ,[role]) VALUES (1, 'nicarb', 'N9qvekqRuQpO6I89ZRMyDAKvnaRni/n/UibimibSlzPRogjxp28TDCaTqgy2M7tMBQ0ZJ7BT1yoTs6mcHMtW4w==', 'True', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'S');
INSERT INTO [dbo].[User] ([idperson] ,[username] ,[password] ,[isactive] ,[update_date] ,[insertion_date] ,[role]) VALUES (2, 'valipine', 'xpLlXXMUvSWfd7gwbIaAsJDfydJCdnqD+b2I12f6egnR1tw56fIpCvTNBpTbIG4rgzLMuSE74fb1Y/j5ZEkP1w==', 'True', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'A');
INSERT INTO [dbo].[User] ([idperson] ,[username] ,[password] ,[isactive] ,[update_date] ,[insertion_date] ,[role]) VALUES (3, 'xhulihima', 'WOr+WHQsH7yFgYyf/p/w+TWbDYciDgVzPbKicwrzeyD5FCevPfHFd3zCVCbz0ZvbckN3hdPf5mqolrp6wKM6/w==', 'True', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'A');
Go
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (1,1,'The Lego Batman Movie-Fantasy');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (1,2,'The Lego Batman Movie-Action');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (2,3,'Logan-Science fiction');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (2,4,'Logan-Drama');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (3,4,'Fifty Shades Darker-Drama');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (3,5,'Fifty Shades Darker-Romance');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (4,6,'John Wick: Chapter 2-Crime');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (4,7,'John Wick: Chapter 2-Thriller');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (5,1,'The Great Wall-Fantasy');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (5,8,'The Great Wall-Mystery');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (6,9,'Hidden Figures-History');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (6,4,'Hidden Figures-Drama');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (7,4,'Sing-Drama');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (7,10,'Sing-Musical');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (8,4,'Patriots Day-Drama');
INSERT INTO [dbo].[MovieCategory] ([idmovie] ,[idcategory] ,[description]) VALUES (8,7,'Patriots Day-Thriller');
GO
