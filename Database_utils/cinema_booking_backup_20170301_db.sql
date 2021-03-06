USE [master]
GO
/****** Object:  Database [cinema_booking]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Cinema]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[ItemType]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 3/1/2017 2:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[idlanguage] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](45) NULL,
	[desc] [nchar](100) NULL,
	[acronym] [nchar](3) NULL,
	[isMovieLanguage] [nchar](1) NULL,
 CONSTRAINT [PK_language] PRIMARY KEY CLUSTERED 
(
	[idlanguage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[MovieProjection]    Script Date: 3/1/2017 2:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieProjection](
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[ProjectionTime]    Script Date: 3/1/2017 2:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectionTime](
	[idprojection_time] [int] IDENTITY(1,1) NOT NULL,
	[idmovie_projection] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_ProjectionTime] PRIMARY KEY CLUSTERED 
(
	[idprojection_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Seat]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[TheatreRoom]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 3/1/2017 2:00:15 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/1/2017 2:00:15 PM ******/
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

ALTER TABLE [dbo].[MovieCategory]  WITH CHECK ADD  CONSTRAINT [FK_MovieCategory_Category] FOREIGN KEY([idcategory])
REFERENCES [dbo].[Category] ([idcategory])
GO

ALTER TABLE [dbo].[MovieCategory] CHECK CONSTRAINT [FK_MovieCategory_Category]
GO

ALTER TABLE [dbo].[MovieCategory]  WITH CHECK ADD  CONSTRAINT [FK_MovieCategory_Movie] FOREIGN KEY([idmovie])
REFERENCES [dbo].[Movie] ([idmovie])
GO

ALTER TABLE [dbo].[MovieCategory] CHECK CONSTRAINT [FK_MovieCategory_Movie]
GO

ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([iditem_type])
REFERENCES [dbo].[ItemType] ([iditem_type])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
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
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Item] FOREIGN KEY([iditem])
REFERENCES [dbo].[Item] ([iditem])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Item]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([idorder])
REFERENCES [dbo].[Order] ([idorder])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[ProjectionTime]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionTime_MovieProjection] FOREIGN KEY([idmovie_projection])
REFERENCES [dbo].[MovieProjection] ([idmovie_projection])
GO
ALTER TABLE [dbo].[ProjectionTime] CHECK CONSTRAINT [FK_ProjectionTime_MovieProjection]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is the primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'idperson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Values should be ''M'' or ''F''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'gender'
GO
USE [master]
GO
ALTER DATABASE [cinema_booking] SET  READ_WRITE 
GO
