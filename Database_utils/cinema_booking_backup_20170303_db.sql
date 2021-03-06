USE [cinema_booking]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'gender'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'idperson'

GO
ALTER TABLE [dbo].[ProjectionTime] DROP CONSTRAINT [FK_ProjectionTime_TheatreRoom]
GO
ALTER TABLE [dbo].[ProjectionTime] DROP CONSTRAINT [FK_ProjectionTime_MovieProjection]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Item]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_User_Staff]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_User_Customer]
GO
ALTER TABLE [dbo].[MovieCategory] DROP CONSTRAINT [FK_MovieCategory_Movie]
GO
ALTER TABLE [dbo].[MovieCategory] DROP CONSTRAINT [FK_MovieCategory_Category]
GO
ALTER TABLE [dbo].[Movie] DROP CONSTRAINT [FK_idwriter_movie_idperson_person]
GO
ALTER TABLE [dbo].[Movie] DROP CONSTRAINT [FK_idlanguage_movie_idlanguage_language]
GO
ALTER TABLE [dbo].[Movie] DROP CONSTRAINT [FK_iddirector_movie_idperson_person]
GO
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_ItemType]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[TheatreRoom]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[TheatreRoom]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Seat]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[ProjectionTime]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[ProjectionTime]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Person]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[MovieProjection]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[MovieProjection]
GO
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[MovieCategory]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Movie]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Language]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[ItemType]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Item]
GO
/****** Object:  Table [dbo].[Cinema]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Cinema]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP TABLE [dbo].[Category]
GO
USE [master]
GO
/****** Object:  Database [cinema_booking]    Script Date: 3/3/2017 9:59:57 AM ******/
DROP DATABASE [cinema_booking]
GO
/****** Object:  Database [cinema_booking]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[Cinema]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[ItemType]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[MovieProjection]    Script Date: 3/3/2017 9:59:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieProjection](
	[idmovie_projection] [int] IDENTITY(1,1) NOT NULL,
	[idmovie] [int] NULL,
	[description] [nvarchar](max) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_Movie_projection] PRIMARY KEY CLUSTERED 
(
	[idmovie_projection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/3/2017 9:59:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[idorder] [int] IDENTITY(1,1) NOT NULL,
	[idcustomer] [int] NULL,
	[idstaff] [int] NULL,
	[orderdate] [datetime] NULL,
	[totalAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/3/2017 9:59:57 AM ******/
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
	[discount_percentage] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[idorder_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[ProjectionTime]    Script Date: 3/3/2017 9:59:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectionTime](
	[idprojection_time] [int] IDENTITY(1,1) NOT NULL,
	[idmovie_projection] [int] NULL,
	[idtheatre_room] [int] NULL,
	[projection_time] [datetime] NULL,
 CONSTRAINT [PK_ProjectionTime] PRIMARY KEY CLUSTERED 
(
	[idprojection_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[Seat]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[TheatreRoom]    Script Date: 3/3/2017 9:59:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheatreRoom](
	[idtheatre_room] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 3/3/2017 9:59:57 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/3/2017 9:59:57 AM ******/
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
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (1, N'Fantasy', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (2, N'Action', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (3, N'Science fiction', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (4, N'Drama', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (5, N'Romance', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (6, N'Crime', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (7, N'Thriller', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (8, N'Mystery', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (9, N'History', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (10, N'Musical', N'')
INSERT [dbo].[Category] ([idcategory], [name], [desc]) VALUES (11, N'Comedy', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (1, N'Abkhazian                                    ', N'                                                                                                    ', N'ABK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (2, N'Achinese                                     ', N'                                                                                                    ', N'ACE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (3, N'Acoli                                        ', N'                                                                                                    ', N'ACH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (4, N'Adangme                                      ', N'                                                                                                    ', N'ADA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (5, N'Adyghe; Adygei                               ', N'                                                                                                    ', N'ADY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (6, N'Afro-Asiatic languages                       ', N'                                                                                                    ', N'AFA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (7, N'Afrihili                                     ', N'                                                                                                    ', N'AFH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (8, N'Afrikaans                                    ', N'                                                                                                    ', N'AFR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (9, N'Ainu                                         ', N'                                                                                                    ', N'AIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (10, N'Akan                                         ', N'                                                                                                    ', N'AKA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (11, N'Akkadian                                     ', N'                                                                                                    ', N'AKK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (12, N'Albanian                                     ', N'                                                                                                    ', N'ALB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (13, N'Aleut                                        ', N'                                                                                                    ', N'ALE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (14, N'Algonquian languages                         ', N'                                                                                                    ', N'ALG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (15, N'Southern Altai                               ', N'                                                                                                    ', N'ALT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (16, N'Amharic                                      ', N'                                                                                                    ', N'AMH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (17, N'English, Old (ca.450-1100)                   ', N'                                                                                                    ', N'ANG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (18, N'Angika                                       ', N'                                                                                                    ', N'ANP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (19, N'Apache languages                             ', N'                                                                                                    ', N'APA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (20, N'Arabic                                       ', N'                                                                                                    ', N'ARA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (21, N'Aragonese                                    ', N'                                                                                                    ', N'ARG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (22, N'Armenian                                     ', N'                                                                                                    ', N'ARM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (23, N'Mapudungun; Mapuche                          ', N'                                                                                                    ', N'ARN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (24, N'Arapaho                                      ', N'                                                                                                    ', N'ARP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (25, N'Artificial languages                         ', N'                                                                                                    ', N'ART', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (26, N'Arawak                                       ', N'                                                                                                    ', N'ARW', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (27, N'Assamese                                     ', N'                                                                                                    ', N'ASM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (28, N'Asturian; Bable; Leonese; Asturleonese       ', N'                                                                                                    ', N'AST', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (29, N'Athapascan languages                         ', N'                                                                                                    ', N'ATH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (30, N'Australian languages                         ', N'                                                                                                    ', N'AUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (31, N'Avaric                                       ', N'                                                                                                    ', N'AVA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (32, N'Avestan                                      ', N'                                                                                                    ', N'AVE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (33, N'Awadhi                                       ', N'                                                                                                    ', N'AWA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (34, N'Aymara                                       ', N'                                                                                                    ', N'AYM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (35, N'Azerbaijani                                  ', N'                                                                                                    ', N'AZE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (36, N'Banda languages                              ', N'                                                                                                    ', N'BAD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (37, N'Bamileke languages                           ', N'                                                                                                    ', N'BAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (38, N'Bashkir                                      ', N'                                                                                                    ', N'BAK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (39, N'Baluchi                                      ', N'                                                                                                    ', N'BAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (40, N'Bambara                                      ', N'                                                                                                    ', N'BAM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (41, N'Balinese                                     ', N'                                                                                                    ', N'BAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (42, N'Basque                                       ', N'                                                                                                    ', N'BAQ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (43, N'Basa                                         ', N'                                                                                                    ', N'BAS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (44, N'Baltic languages                             ', N'                                                                                                    ', N'BAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (45, N'Beja; Bedawiyet                              ', N'                                                                                                    ', N'BEJ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (46, N'Belarusian                                   ', N'                                                                                                    ', N'BEL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (47, N'Bemba                                        ', N'                                                                                                    ', N'BEM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (48, N'Bengali                                      ', N'                                                                                                    ', N'BEN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (49, N'Berber languages                             ', N'                                                                                                    ', N'BER', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (50, N'Bhojpuri                                     ', N'                                                                                                    ', N'BHO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (51, N'Bihari languages                             ', N'                                                                                                    ', N'BIH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (52, N'Bikol                                        ', N'                                                                                                    ', N'BIK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (53, N'Bini; Edo                                    ', N'                                                                                                    ', N'BIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (54, N'Bislama                                      ', N'                                                                                                    ', N'BIS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (55, N'Siksika                                      ', N'                                                                                                    ', N'BLA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (56, N'Bantu (Other)                                ', N'                                                                                                    ', N'BNT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (57, N'Bosnian                                      ', N'                                                                                                    ', N'BOS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (58, N'Braj                                         ', N'                                                                                                    ', N'BRA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (59, N'Breton                                       ', N'                                                                                                    ', N'BRE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (60, N'Batak languages                              ', N'                                                                                                    ', N'BTK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (61, N'Buriat                                       ', N'                                                                                                    ', N'BUA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (62, N'Buginese                                     ', N'                                                                                                    ', N'BUG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (63, N'Bulgarian                                    ', N'                                                                                                    ', N'BUL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (64, N'Burmese                                      ', N'                                                                                                    ', N'BUR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (65, N'Blin; Bilin                                  ', N'                                                                                                    ', N'BYN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (66, N'Caddo                                        ', N'                                                                                                    ', N'CAD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (67, N'Central American Indian languages            ', N'                                                                                                    ', N'CAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (68, N'Galibi Carib                                 ', N'                                                                                                    ', N'CAR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (69, N'Catalan; Valencian                           ', N'                                                                                                    ', N'CAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (70, N'Caucasian languages                          ', N'                                                                                                    ', N'CAU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (71, N'Cebuano                                      ', N'                                                                                                    ', N'CEB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (72, N'Celtic languages                             ', N'                                                                                                    ', N'CEL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (73, N'Chamorro                                     ', N'                                                                                                    ', N'CHA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (74, N'Chibcha                                      ', N'                                                                                                    ', N'CHB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (75, N'Chechen                                      ', N'                                                                                                    ', N'CHE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (76, N'Chagatai                                     ', N'                                                                                                    ', N'CHG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (77, N'Chinese                                      ', N'                                                                                                    ', N'CHI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (78, N'Chuukese                                     ', N'                                                                                                    ', N'CHK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (79, N'Mari                                         ', N'                                                                                                    ', N'CHM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (80, N'Chinook jargon                               ', N'                                                                                                    ', N'CHN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (81, N'Choctaw                                      ', N'                                                                                                    ', N'CHO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (82, N'Chipewyan; Dene Suline                       ', N'                                                                                                    ', N'CHP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (83, N'Cherokee                                     ', N'                                                                                                    ', N'CHR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (84, N'Chuvash                                      ', N'                                                                                                    ', N'CHV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (85, N'Cheyenne                                     ', N'                                                                                                    ', N'CHY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (86, N'Chamic languages                             ', N'                                                                                                    ', N'CMC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (87, N'Coptic                                       ', N'                                                                                                    ', N'COP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (88, N'Cornish                                      ', N'                                                                                                    ', N'COR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (89, N'Corsican                                     ', N'                                                                                                    ', N'COS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (90, N'Creoles and pidgins, English based           ', N'                                                                                                    ', N'CPE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (91, N'Creoles and pidgins, French-based            ', N'                                                                                                    ', N'CPF', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (92, N'Creoles and pidgins, Portuguese-based        ', N'                                                                                                    ', N'CPP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (93, N'Cree                                         ', N'                                                                                                    ', N'CRE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (94, N'Crimean Tatar; Crimean Turkish               ', N'                                                                                                    ', N'CRH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (95, N'Creoles and pidgins                          ', N'                                                                                                    ', N'CRP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (96, N'Kashubian                                    ', N'                                                                                                    ', N'CSB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (97, N'Cushitic languages                           ', N'                                                                                                    ', N'CUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (98, N'Czech                                        ', N'                                                                                                    ', N'CZE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (99, N'Dakota                                       ', N'                                                                                                    ', N'DAK', NULL)
GO
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (100, N'Danish                                       ', N'                                                                                                    ', N'DAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (101, N'Dargwa                                       ', N'                                                                                                    ', N'DAR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (102, N'Land Dayak languages                         ', N'                                                                                                    ', N'DAY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (103, N'Delaware                                     ', N'                                                                                                    ', N'DEL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (104, N'Slave (Athapascan)                           ', N'                                                                                                    ', N'DEN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (105, N'Dogrib                                       ', N'                                                                                                    ', N'DGR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (106, N'Dinka                                        ', N'                                                                                                    ', N'DIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (107, N'Divehi; Dhivehi; Maldivian                   ', N'                                                                                                    ', N'DIV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (108, N'Dogri                                        ', N'                                                                                                    ', N'DOI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (109, N'Dravidian languages                          ', N'                                                                                                    ', N'DRA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (110, N'Lower Sorbian                                ', N'                                                                                                    ', N'DSB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (111, N'Duala                                        ', N'                                                                                                    ', N'DUA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (112, N'Dutch, Middle (ca.1050-1350)                 ', N'                                                                                                    ', N'DUM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (113, N'Dutch; Flemish                               ', N'                                                                                                    ', N'DUT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (114, N'Dyula                                        ', N'                                                                                                    ', N'DYU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (115, N'Dzongkha                                     ', N'                                                                                                    ', N'DZO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (116, N'Efik                                         ', N'                                                                                                    ', N'EFI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (117, N'Egyptian (Ancient)                           ', N'                                                                                                    ', N'EGY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (118, N'Ekajuk                                       ', N'                                                                                                    ', N'EKA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (119, N'Elamite                                      ', N'                                                                                                    ', N'ELX', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (120, N'English                                      ', N'                                                                                                    ', N'ENG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (121, N'English, Middle (1100-1500)                  ', N'                                                                                                    ', N'ENM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (122, N'Esperanto                                    ', N'                                                                                                    ', N'EPO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (123, N'Estonian                                     ', N'                                                                                                    ', N'EST', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (124, N'Ewe                                          ', N'                                                                                                    ', N'EWE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (125, N'Ewondo                                       ', N'                                                                                                    ', N'EWO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (126, N'Fang                                         ', N'                                                                                                    ', N'FAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (127, N'Faroese                                      ', N'                                                                                                    ', N'FAO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (128, N'Fanti                                        ', N'                                                                                                    ', N'FAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (129, N'Fijian                                       ', N'                                                                                                    ', N'FIJ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (130, N'Filipino; Pilipino                           ', N'                                                                                                    ', N'FIL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (131, N'Finnish                                      ', N'                                                                                                    ', N'FIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (132, N'Finno-Ugrian languages                       ', N'                                                                                                    ', N'FIU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (133, N'Fon                                          ', N'                                                                                                    ', N'FON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (134, N'French                                       ', N'                                                                                                    ', N'FRE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (135, N'French, Middle (ca.1400-1600)                ', N'                                                                                                    ', N'FRM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (136, N'French, Old (842-ca.1400)                    ', N'                                                                                                    ', N'FRO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (137, N'Northern Frisian                             ', N'                                                                                                    ', N'FRR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (138, N'Eastern Frisian                              ', N'                                                                                                    ', N'FRS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (139, N'Western Frisian                              ', N'                                                                                                    ', N'FRY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (140, N'Fulah                                        ', N'                                                                                                    ', N'FUL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (141, N'Friulian                                     ', N'                                                                                                    ', N'FUR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (142, N'Ga                                           ', N'                                                                                                    ', N'GAA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (143, N'Gayo                                         ', N'                                                                                                    ', N'GAY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (144, N'Gbaya                                        ', N'                                                                                                    ', N'GBA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (145, N'Germanic languages                           ', N'                                                                                                    ', N'GEM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (146, N'Georgian                                     ', N'                                                                                                    ', N'GEO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (147, N'German                                       ', N'                                                                                                    ', N'GER', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (148, N'Geez                                         ', N'                                                                                                    ', N'GEZ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (149, N'Gilbertese                                   ', N'                                                                                                    ', N'GIL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (150, N'Gaelic; Scottish Gaelic                      ', N'                                                                                                    ', N'GLA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (151, N'Irish                                        ', N'                                                                                                    ', N'GLE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (152, N'Galician                                     ', N'                                                                                                    ', N'GLG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (153, N'Manx                                         ', N'                                                                                                    ', N'GLV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (154, N'German, Middle High (ca.1050-1500)           ', N'                                                                                                    ', N'GMH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (155, N'German, Old High (ca.750-1050)               ', N'                                                                                                    ', N'GOH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (156, N'Gondi                                        ', N'                                                                                                    ', N'GON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (157, N'Gorontalo                                    ', N'                                                                                                    ', N'GOR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (158, N'Gothic                                       ', N'                                                                                                    ', N'GOT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (159, N'Grebo                                        ', N'                                                                                                    ', N'GRB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (160, N'Greek, Ancient (to 1453)                     ', N'                                                                                                    ', N'GRC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (161, N'Greek, Modern (1453-)                        ', N'                                                                                                    ', N'GRE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (162, N'Guarani                                      ', N'                                                                                                    ', N'GRN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (163, N'Swiss German; Alemannic; Alsatian            ', N'                                                                                                    ', N'GSW', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (164, N'Gujarati                                     ', N'                                                                                                    ', N'GUJ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (165, N'Gwich''in                                     ', N'                                                                                                    ', N'GWI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (166, N'Haida                                        ', N'                                                                                                    ', N'HAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (167, N'Haitian; Haitian Creole                      ', N'                                                                                                    ', N'HAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (168, N'Hausa                                        ', N'                                                                                                    ', N'HAU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (169, N'Hawaiian                                     ', N'                                                                                                    ', N'HAW', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (170, N'Hebrew                                       ', N'                                                                                                    ', N'HEB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (171, N'Herero                                       ', N'                                                                                                    ', N'HER', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (172, N'Hiligaynon                                   ', N'                                                                                                    ', N'HIL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (173, N'Himachali languages; Western Pahari languages', N'                                                                                                    ', N'HIM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (174, N'Hindi                                        ', N'                                                                                                    ', N'HIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (175, N'Hittite                                      ', N'                                                                                                    ', N'HIT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (176, N'Hmong; Mong                                  ', N'                                                                                                    ', N'HMN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (177, N'Hiri Motu                                    ', N'                                                                                                    ', N'HMO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (178, N'Croatian                                     ', N'                                                                                                    ', N'HRV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (179, N'Upper Sorbian                                ', N'                                                                                                    ', N'HSB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (180, N'Hungarian                                    ', N'                                                                                                    ', N'HUN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (181, N'Hupa                                         ', N'                                                                                                    ', N'HUP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (182, N'Iban                                         ', N'                                                                                                    ', N'IBA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (183, N'Igbo                                         ', N'                                                                                                    ', N'IBO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (184, N'Icelandic                                    ', N'                                                                                                    ', N'ICE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (185, N'Ido                                          ', N'                                                                                                    ', N'IDO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (186, N'Sichuan Yi; Nuosu                            ', N'                                                                                                    ', N'III', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (187, N'Ijo languages                                ', N'                                                                                                    ', N'IJO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (188, N'Inuktitut                                    ', N'                                                                                                    ', N'IKU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (189, N'Interlingue; Occidental                      ', N'                                                                                                    ', N'ILE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (190, N'Iloko                                        ', N'                                                                                                    ', N'ILO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (191, N'Indic languages                              ', N'                                                                                                    ', N'INC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (192, N'Indonesian                                   ', N'                                                                                                    ', N'IND', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (193, N'Indo-European languages                      ', N'                                                                                                    ', N'INE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (194, N'Ingush                                       ', N'                                                                                                    ', N'INH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (195, N'Inupiaq                                      ', N'                                                                                                    ', N'IPK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (196, N'Iranian languages                            ', N'                                                                                                    ', N'IRA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (197, N'Iroquoian languages                          ', N'                                                                                                    ', N'IRO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (198, N'Italian                                      ', N'                                                                                                    ', N'ITA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (199, N'Javanese                                     ', N'                                                                                                    ', N'JAV', NULL)
GO
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (200, N'Lojban                                       ', N'                                                                                                    ', N'JBO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (201, N'Japanese                                     ', N'                                                                                                    ', N'JPN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (202, N'Judeo-Persian                                ', N'                                                                                                    ', N'JPR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (203, N'Judeo-Arabic                                 ', N'                                                                                                    ', N'JRB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (204, N'Kara-Kalpak                                  ', N'                                                                                                    ', N'KAA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (205, N'Kabyle                                       ', N'                                                                                                    ', N'KAB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (206, N'Kachin; Jingpho                              ', N'                                                                                                    ', N'KAC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (207, N'Kalaallisut; Greenlandic                     ', N'                                                                                                    ', N'KAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (208, N'Kamba                                        ', N'                                                                                                    ', N'KAM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (209, N'Kannada                                      ', N'                                                                                                    ', N'KAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (210, N'Karen languages                              ', N'                                                                                                    ', N'KAR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (211, N'Kashmiri                                     ', N'                                                                                                    ', N'KAS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (212, N'Kanuri                                       ', N'                                                                                                    ', N'KAU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (213, N'Kawi                                         ', N'                                                                                                    ', N'KAW', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (214, N'Kazakh                                       ', N'                                                                                                    ', N'KAZ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (215, N'Kabardian                                    ', N'                                                                                                    ', N'KBD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (216, N'Khasi                                        ', N'                                                                                                    ', N'KHA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (217, N'Khoisan languages                            ', N'                                                                                                    ', N'KHI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (218, N'Central Khmer                                ', N'                                                                                                    ', N'KHM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (219, N'Khotanese; Sakan                             ', N'                                                                                                    ', N'KHO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (220, N'Kikuyu; Gikuyu                               ', N'                                                                                                    ', N'KIK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (221, N'Kinyarwanda                                  ', N'                                                                                                    ', N'KIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (222, N'Kirghiz; Kyrgyz                              ', N'                                                                                                    ', N'KIR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (223, N'Kimbundu                                     ', N'                                                                                                    ', N'KMB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (224, N'Konkani                                      ', N'                                                                                                    ', N'KOK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (225, N'Komi                                         ', N'                                                                                                    ', N'KOM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (226, N'Kongo                                        ', N'                                                                                                    ', N'KON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (227, N'Korean                                       ', N'                                                                                                    ', N'KOR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (228, N'Kosraean                                     ', N'                                                                                                    ', N'KOS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (229, N'Kpelle                                       ', N'                                                                                                    ', N'KPE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (230, N'Karachay-Balkar                              ', N'                                                                                                    ', N'KRC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (231, N'Karelian                                     ', N'                                                                                                    ', N'KRL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (232, N'Kru languages                                ', N'                                                                                                    ', N'KRO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (233, N'Kurukh                                       ', N'                                                                                                    ', N'KRU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (234, N'Kuanyama; Kwanyama                           ', N'                                                                                                    ', N'KUA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (235, N'Kumyk                                        ', N'                                                                                                    ', N'KUM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (236, N'Kurdish                                      ', N'                                                                                                    ', N'KUR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (237, N'Kutenai                                      ', N'                                                                                                    ', N'KUT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (238, N'Ladino                                       ', N'                                                                                                    ', N'LAD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (239, N'Lahnda                                       ', N'                                                                                                    ', N'LAH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (240, N'Lamba                                        ', N'                                                                                                    ', N'LAM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (241, N'Lao                                          ', N'                                                                                                    ', N'LAO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (242, N'Latin                                        ', N'                                                                                                    ', N'LAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (243, N'Latvian                                      ', N'                                                                                                    ', N'LAV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (244, N'Lezghian                                     ', N'                                                                                                    ', N'LEZ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (245, N'Limburgan; Limburger; Limburgish             ', N'                                                                                                    ', N'LIM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (246, N'Lingala                                      ', N'                                                                                                    ', N'LIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (247, N'Lithuanian                                   ', N'                                                                                                    ', N'LIT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (248, N'Mongo                                        ', N'                                                                                                    ', N'LOL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (249, N'Lozi                                         ', N'                                                                                                    ', N'LOZ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (250, N'Luxembourgish; Letzeburgesch                 ', N'                                                                                                    ', N'LTZ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (251, N'Luba-Lulua                                   ', N'                                                                                                    ', N'LUA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (252, N'Luba-Katanga                                 ', N'                                                                                                    ', N'LUB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (253, N'Ganda                                        ', N'                                                                                                    ', N'LUG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (254, N'Luiseno                                      ', N'                                                                                                    ', N'LUI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (255, N'Lunda                                        ', N'                                                                                                    ', N'LUN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (256, N'Luo (Kenya and Tanzania)                     ', N'                                                                                                    ', N'LUO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (257, N'Lushai                                       ', N'                                                                                                    ', N'LUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (258, N'Macedonian                                   ', N'                                                                                                    ', N'MAC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (259, N'Madurese                                     ', N'                                                                                                    ', N'MAD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (260, N'Magahi                                       ', N'                                                                                                    ', N'MAG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (261, N'Marshallese                                  ', N'                                                                                                    ', N'MAH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (262, N'Maithili                                     ', N'                                                                                                    ', N'MAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (263, N'Makasar                                      ', N'                                                                                                    ', N'MAK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (264, N'Malayalam                                    ', N'                                                                                                    ', N'MAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (265, N'Mandingo                                     ', N'                                                                                                    ', N'MAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (266, N'Maori                                        ', N'                                                                                                    ', N'MAO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (267, N'Austronesian languages                       ', N'                                                                                                    ', N'MAP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (268, N'Marathi                                      ', N'                                                                                                    ', N'MAR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (269, N'Masai                                        ', N'                                                                                                    ', N'MAS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (270, N'Malay                                        ', N'                                                                                                    ', N'MAY', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (271, N'Moksha                                       ', N'                                                                                                    ', N'MDF', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (272, N'Mandar                                       ', N'                                                                                                    ', N'MDR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (273, N'Mende                                        ', N'                                                                                                    ', N'MEN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (274, N'Irish, Middle (900-1200)                     ', N'                                                                                                    ', N'MGA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (275, N'Mi''kmaq; Micmac                              ', N'                                                                                                    ', N'MIC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (276, N'Minangkabau                                  ', N'                                                                                                    ', N'MIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (277, N'Uncoded languages                            ', N'                                                                                                    ', N'MIS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (278, N'Mon-Khmer languages                          ', N'                                                                                                    ', N'MKH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (279, N'Malagasy                                     ', N'                                                                                                    ', N'MLG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (280, N'Maltese                                      ', N'                                                                                                    ', N'MLT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (281, N'Manchu                                       ', N'                                                                                                    ', N'MNC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (282, N'Manipuri                                     ', N'                                                                                                    ', N'MNI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (283, N'Manobo languages                             ', N'                                                                                                    ', N'MNO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (284, N'Mohawk                                       ', N'                                                                                                    ', N'MOH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (285, N'Mongolian                                    ', N'                                                                                                    ', N'MON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (286, N'Mossi                                        ', N'                                                                                                    ', N'MOS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (287, N'Multiple languages                           ', N'                                                                                                    ', N'MUL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (288, N'Munda languages                              ', N'                                                                                                    ', N'MUN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (289, N'Creek                                        ', N'                                                                                                    ', N'MUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (290, N'Mirandese                                    ', N'                                                                                                    ', N'MWL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (291, N'Marwari                                      ', N'                                                                                                    ', N'MWR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (292, N'Mayan languages                              ', N'                                                                                                    ', N'MYN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (293, N'Erzya                                        ', N'                                                                                                    ', N'MYV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (294, N'Nahuatl languages                            ', N'                                                                                                    ', N'NAH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (295, N'North American Indian languages              ', N'                                                                                                    ', N'NAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (296, N'Neapolitan                                   ', N'                                                                                                    ', N'NAP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (297, N'Nauru                                        ', N'                                                                                                    ', N'NAU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (298, N'Navajo; Navaho                               ', N'                                                                                                    ', N'NAV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (299, N'Ndebele, South; South Ndebele                ', N'                                                                                                    ', N'NBL', NULL)
GO
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (300, N'Ndebele, North; North Ndebele                ', N'                                                                                                    ', N'NDE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (301, N'Ndonga                                       ', N'                                                                                                    ', N'NDO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (302, N'Nepali                                       ', N'                                                                                                    ', N'NEP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (303, N'Nepal Bhasa; Newari                          ', N'                                                                                                    ', N'NEW', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (304, N'Nias                                         ', N'                                                                                                    ', N'NIA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (305, N'Niger-Kordofanian languages                  ', N'                                                                                                    ', N'NIC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (306, N'Niuean                                       ', N'                                                                                                    ', N'NIU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (307, N'Norwegian Nynorsk; Nynorsk, Norwegian        ', N'                                                                                                    ', N'NNO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (308, N'BokmÃ¥l, Norwegian; Norwegian BokmÃ¥l        ', N'                                                                                                    ', N'NOB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (309, N'Nogai                                        ', N'                                                                                                    ', N'NOG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (310, N'Norse, Old                                   ', N'                                                                                                    ', N'NON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (311, N'Norwegian                                    ', N'                                                                                                    ', N'NOR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (312, N'N''Ko                                         ', N'                                                                                                    ', N'NQO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (313, N'Pedi; Sepedi; Northern Sotho                 ', N'                                                                                                    ', N'NSO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (314, N'Nubian languages                             ', N'                                                                                                    ', N'NUB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (315, N'Chichewa; Chewa; Nyanja                      ', N'                                                                                                    ', N'NYA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (316, N'Nyamwezi                                     ', N'                                                                                                    ', N'NYM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (317, N'Nyankole                                     ', N'                                                                                                    ', N'NYN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (318, N'Nyoro                                        ', N'                                                                                                    ', N'NYO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (319, N'Nzima                                        ', N'                                                                                                    ', N'NZI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (320, N'Occitan (post 1500); ProvenÃ§al              ', N'                                                                                                    ', N'OCI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (321, N'Ojibwa                                       ', N'                                                                                                    ', N'OJI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (322, N'Oriya                                        ', N'                                                                                                    ', N'ORI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (323, N'Oromo                                        ', N'                                                                                                    ', N'ORM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (324, N'Osage                                        ', N'                                                                                                    ', N'OSA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (325, N'Ossetian; Ossetic                            ', N'                                                                                                    ', N'OSS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (326, N'Turkish, Ottoman (1500-1928)                 ', N'                                                                                                    ', N'OTA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (327, N'Otomian languages                            ', N'                                                                                                    ', N'OTO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (328, N'Papuan languages                             ', N'                                                                                                    ', N'PAA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (329, N'Pangasinan                                   ', N'                                                                                                    ', N'PAG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (330, N'Pahlavi                                      ', N'                                                                                                    ', N'PAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (331, N'Pampanga; Kapampangan                        ', N'                                                                                                    ', N'PAM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (332, N'Panjabi; Punjabi                             ', N'                                                                                                    ', N'PAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (333, N'Papiamento                                   ', N'                                                                                                    ', N'PAP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (334, N'Palauan                                      ', N'                                                                                                    ', N'PAU', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (335, N'Persian, Old (ca.600-400 B.C.)               ', N'                                                                                                    ', N'PEO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (336, N'Persian                                      ', N'                                                                                                    ', N'PER', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (337, N'Philippine languages                         ', N'                                                                                                    ', N'PHI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (338, N'Phoenician                                   ', N'                                                                                                    ', N'PHN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (339, N'Pali                                         ', N'                                                                                                    ', N'PLI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (340, N'Polish                                       ', N'                                                                                                    ', N'POL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (341, N'Pohnpeian                                    ', N'                                                                                                    ', N'PON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (342, N'Portuguese                                   ', N'                                                                                                    ', N'POR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (343, N'Prakrit languages                            ', N'                                                                                                    ', N'PRA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (344, N'ProvenÃ§al, Old (to 1500)                    ', N'                                                                                                    ', N'PRO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (345, N'Pushto; Pashto                               ', N'                                                                                                    ', N'PUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (346, N'Quechua                                      ', N'                                                                                                    ', N'QUE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (347, N'Rajasthani                                   ', N'                                                                                                    ', N'RAJ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (348, N'Rapanui                                      ', N'                                                                                                    ', N'RAP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (349, N'Rarotongan; Cook Islands Maori               ', N'                                                                                                    ', N'RAR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (350, N'Romance languages                            ', N'                                                                                                    ', N'ROA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (351, N'Romansh                                      ', N'                                                                                                    ', N'ROH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (352, N'Romany                                       ', N'                                                                                                    ', N'ROM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (353, N'Romanian; Moldavian; Moldovan                ', N'                                                                                                    ', N'RUM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (354, N'Rundi                                        ', N'                                                                                                    ', N'RUN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (355, N'Aromanian; Arumanian; Macedo-Romanian        ', N'                                                                                                    ', N'RUP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (356, N'Russian                                      ', N'                                                                                                    ', N'RUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (357, N'Sandawe                                      ', N'                                                                                                    ', N'SAD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (358, N'Sango                                        ', N'                                                                                                    ', N'SAG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (359, N'Yakut                                        ', N'                                                                                                    ', N'SAH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (360, N'South American Indian (Other)                ', N'                                                                                                    ', N'SAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (361, N'Salishan languages                           ', N'                                                                                                    ', N'SAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (362, N'Samaritan Aramaic                            ', N'                                                                                                    ', N'SAM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (363, N'Sanskrit                                     ', N'                                                                                                    ', N'SAN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (364, N'Sasak                                        ', N'                                                                                                    ', N'SAS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (365, N'Santali                                      ', N'                                                                                                    ', N'SAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (366, N'Sicilian                                     ', N'                                                                                                    ', N'SCN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (367, N'Scots                                        ', N'                                                                                                    ', N'SCO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (368, N'Selkup                                       ', N'                                                                                                    ', N'SEL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (369, N'Semitic languages                            ', N'                                                                                                    ', N'SEM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (370, N'Irish, Old (to 900)                          ', N'                                                                                                    ', N'SGA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (371, N'Sign Languages                               ', N'                                                                                                    ', N'SGN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (372, N'Shan                                         ', N'                                                                                                    ', N'SHN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (373, N'Sidamo                                       ', N'                                                                                                    ', N'SID', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (374, N'Sinhala; Sinhalese                           ', N'                                                                                                    ', N'SIN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (375, N'Siouan languages                             ', N'                                                                                                    ', N'SIO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (376, N'Sino-Tibetan languages                       ', N'                                                                                                    ', N'SIT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (377, N'Slavic languages                             ', N'                                                                                                    ', N'SLA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (378, N'Slovak                                       ', N'                                                                                                    ', N'SLO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (379, N'Slovenian                                    ', N'                                                                                                    ', N'SLV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (380, N'Southern Sami                                ', N'                                                                                                    ', N'SMA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (381, N'Northern Sami                                ', N'                                                                                                    ', N'SME', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (382, N'Sami languages                               ', N'                                                                                                    ', N'SMI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (383, N'Lule Sami                                    ', N'                                                                                                    ', N'SMJ', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (384, N'Inari Sami                                   ', N'                                                                                                    ', N'SMN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (385, N'Samoan                                       ', N'                                                                                                    ', N'SMO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (386, N'Skolt Sami                                   ', N'                                                                                                    ', N'SMS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (387, N'Shona                                        ', N'                                                                                                    ', N'SNA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (388, N'Sindhi                                       ', N'                                                                                                    ', N'SND', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (389, N'Soninke                                      ', N'                                                                                                    ', N'SNK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (390, N'Sogdian                                      ', N'                                                                                                    ', N'SOG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (391, N'Somali                                       ', N'                                                                                                    ', N'SOM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (392, N'Songhai languages                            ', N'                                                                                                    ', N'SON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (393, N'Sotho, Southern                              ', N'                                                                                                    ', N'SOT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (394, N'Spanish; Castilian                           ', N'                                                                                                    ', N'SPA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (395, N'Sardinian                                    ', N'                                                                                                    ', N'SRD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (396, N'Sranan Tongo                                 ', N'                                                                                                    ', N'SRN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (397, N'Serbian                                      ', N'                                                                                                    ', N'SRP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (398, N'Serer                                        ', N'                                                                                                    ', N'SRR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (399, N'Nilo-Saharan languages                       ', N'                                                                                                    ', N'SSA', NULL)
GO
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (400, N'Swati                                        ', N'                                                                                                    ', N'SSW', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (401, N'Sukuma                                       ', N'                                                                                                    ', N'SUK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (402, N'Sundanese                                    ', N'                                                                                                    ', N'SUN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (403, N'Susu                                         ', N'                                                                                                    ', N'SUS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (404, N'Sumerian                                     ', N'                                                                                                    ', N'SUX', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (405, N'Swahili                                      ', N'                                                                                                    ', N'SWA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (406, N'Swedish                                      ', N'                                                                                                    ', N'SWE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (407, N'Classical Syriac                             ', N'                                                                                                    ', N'SYC', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (408, N'Syriac                                       ', N'                                                                                                    ', N'SYR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (409, N'Tahitian                                     ', N'                                                                                                    ', N'TAH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (410, N'Tai languages                                ', N'                                                                                                    ', N'TAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (411, N'Tamil                                        ', N'                                                                                                    ', N'TAM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (412, N'Tatar                                        ', N'                                                                                                    ', N'TAT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (413, N'Telugu                                       ', N'                                                                                                    ', N'TEL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (414, N'Timne                                        ', N'                                                                                                    ', N'TEM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (415, N'Tereno                                       ', N'                                                                                                    ', N'TER', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (416, N'Tetum                                        ', N'                                                                                                    ', N'TET', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (417, N'Tajik                                        ', N'                                                                                                    ', N'TGK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (418, N'Tagalog                                      ', N'                                                                                                    ', N'TGL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (419, N'Thai                                         ', N'                                                                                                    ', N'THA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (420, N'Tibetan                                      ', N'                                                                                                    ', N'TIB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (421, N'Tigre                                        ', N'                                                                                                    ', N'TIG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (422, N'Tigrinya                                     ', N'                                                                                                    ', N'TIR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (423, N'Tiv                                          ', N'                                                                                                    ', N'TIV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (424, N'Tokelau                                      ', N'                                                                                                    ', N'TKL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (425, N'Klingon; tlhIngan-Hol                        ', N'                                                                                                    ', N'TLH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (426, N'Tlingit                                      ', N'                                                                                                    ', N'TLI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (427, N'Tamashek                                     ', N'                                                                                                    ', N'TMH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (428, N'Tonga (Nyasa)                                ', N'                                                                                                    ', N'TOG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (429, N'Tonga (Tonga Islands)                        ', N'                                                                                                    ', N'TON', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (430, N'Tok Pisin                                    ', N'                                                                                                    ', N'TPI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (431, N'Tsimshian                                    ', N'                                                                                                    ', N'TSI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (432, N'Tswana                                       ', N'                                                                                                    ', N'TSN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (433, N'Tsonga                                       ', N'                                                                                                    ', N'TSO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (434, N'Turkmen                                      ', N'                                                                                                    ', N'TUK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (435, N'Tumbuka                                      ', N'                                                                                                    ', N'TUM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (436, N'Tupi languages                               ', N'                                                                                                    ', N'TUP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (437, N'Turkish                                      ', N'                                                                                                    ', N'TUR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (438, N'Altaic languages                             ', N'                                                                                                    ', N'TUT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (439, N'Tuvalu                                       ', N'                                                                                                    ', N'TVL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (440, N'Twi                                          ', N'                                                                                                    ', N'TWI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (441, N'Tuvinian                                     ', N'                                                                                                    ', N'TYV', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (442, N'Udmurt                                       ', N'                                                                                                    ', N'UDM', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (443, N'Ugaritic                                     ', N'                                                                                                    ', N'UGA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (444, N'Uighur; Uyghur                               ', N'                                                                                                    ', N'UIG', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (445, N'Ukrainian                                    ', N'                                                                                                    ', N'UKR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (446, N'Umbundu                                      ', N'                                                                                                    ', N'UMB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (447, N'Undetermined                                 ', N'                                                                                                    ', N'UND', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (448, N'Urdu                                         ', N'                                                                                                    ', N'URD', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (449, N'Uzbek                                        ', N'                                                                                                    ', N'UZB', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (450, N'Vai                                          ', N'                                                                                                    ', N'VAI', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (451, N'Venda                                        ', N'                                                                                                    ', N'VEN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (452, N'Vietnamese                                   ', N'                                                                                                    ', N'VIE', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (453, N'VolapÃ¼k                                     ', N'                                                                                                    ', N'VOL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (454, N'Votic                                        ', N'                                                                                                    ', N'VOT', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (455, N'Wakashan languages                           ', N'                                                                                                    ', N'WAK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (456, N'Walamo                                       ', N'                                                                                                    ', N'WAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (457, N'Waray                                        ', N'                                                                                                    ', N'WAR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (458, N'Washo                                        ', N'                                                                                                    ', N'WAS', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (459, N'Welsh                                        ', N'                                                                                                    ', N'WEL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (460, N'Sorbian languages                            ', N'                                                                                                    ', N'WEN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (461, N'Walloon                                      ', N'                                                                                                    ', N'WLN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (462, N'Wolof                                        ', N'                                                                                                    ', N'WOL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (463, N'Kalmyk; Oirat                                ', N'                                                                                                    ', N'XAL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (464, N'Xhosa                                        ', N'                                                                                                    ', N'XHO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (465, N'Yao                                          ', N'                                                                                                    ', N'YAO', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (466, N'Yapese                                       ', N'                                                                                                    ', N'YAP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (467, N'Yiddish                                      ', N'                                                                                                    ', N'YID', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (468, N'Yoruba                                       ', N'                                                                                                    ', N'YOR', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (469, N'Yupik languages                              ', N'                                                                                                    ', N'YPK', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (470, N'Zapotec                                      ', N'                                                                                                    ', N'ZAP', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (471, N'Blissymbols; Blissymbolics; Bliss            ', N'                                                                                                    ', N'ZBL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (472, N'Zenaga                                       ', N'                                                                                                    ', N'ZEN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (473, N'Standard Moroccan Tamazight                  ', N'                                                                                                    ', N'ZGH', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (474, N'Zhuang; Chuang                               ', N'                                                                                                    ', N'ZHA', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (475, N'Zande languages                              ', N'                                                                                                    ', N'ZND', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (476, N'Zulu                                         ', N'                                                                                                    ', N'ZUL', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (477, N'Zuni                                         ', N'                                                                                                    ', N'ZUN', NULL)
INSERT [dbo].[Language] ([idlanguage], [name], [desc], [acronym], [isMovieLanguage]) VALUES (478, N'No linguistic content; Not applicable        ', N'                                                                                                    ', N'ZXX', NULL)
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (1, N'The Lego Batman Movie                                                                               ', N'There are big changes brewing in Gotham, but if Batman (Will Arnett) wants to save the city from the Joker''s (Zach Galifianakis) hostile takeover, he may have to drop the lone vigilante thing, try to work with others and maybe, just maybe, learn to lighten up. Maybe his superhero sidekick Robin (Michael Cera) and loyal butler Alfred (Ralph Fiennes) can show him a thing or two.', 129, 5, NULL, CAST(0x703C0B00 AS Date), 120, 77, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (2, N'Logan                                                                                               ', N'In the near future, a weary Logan (Hugh Jackman) cares for an ailing Professor X (Patrick Stewart) at a remote outpost on the Mexican border. His attempt to hide from the outside world gets upended when X introduces him to a young mutant named Laura (Dafne Keen). Logan must now protect the girl and battle the dark forces that want to capture her.', 141, 6, NULL, CAST(0x6A3C0B00 AS Date), 120, 96, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (3, N'Fifty Shades Darker                                                                                 ', N'When a wounded Christian Grey tries to entice a cautious Ana Steele back into his life, she demands a new arrangement before she will give him another chance. As the two begin to build trust and find stability, shadowy figures from Christian''s past start to circle the couple, determined to destroy their hopes for a future together.', 118, 7, NULL, CAST(0x703C0B00 AS Date), 120, 49, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (4, N'John Wick: Chapter 2                                                                                ', N'Legendary hitman John Wick is forced back out of retirement by a former associate plotting to seize control of a shadowy international assassins'' guild. Bound by a blood oath to help him, John travels to Rome where he squares off against some of the world''s deadliest killers.', 122, 8, NULL, CAST(0x693C0B00 AS Date), 120, 83, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (5, N'The Great Wall                                                                                      ', N'The Great Wall is a 2016 monster film directed by Zhang Yimou and starring Matt Damon, who plays a European mercenary in China during the Song dynasty. He encounters the Great Wall of China and meets Chinese soldiers who defend against monsters.', 120, 9, NULL, CAST(0x393C0B00 AS Date), 120, 63, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (6, N'Hidden Figures                                                                                      ', N'The incredible untold story of Katherine G. Johnson, Dorothy Vaughan and Mary Jackson - brilliant African-American women working at NASA, who served as the brains behind one of the greatest operations in history: the launch of astronaut John Glenn into orbit, a stunning achievement that restored the nation''s confidence, turned around the Space Race, and galvanized the world. The visionary trio crossed all gender and race lines to inspire generations to dream big.', 127, 10, NULL, CAST(0x423C0B00 AS Date), 120, 74, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (7, N'Sing                                                                                                ', N'Dapper Koala Buster Moon presides over a once-grand theater that has fallen on hard times. An eternal optimist, and a bit of a scoundrel, he loves his theater above all and will do anything to preserve it. Facing the crumbling of his life''s ambition, he takes one final chance to restore his fading jewel to its former glory by producing the world''s greatest singing competition. Five contestants emerge: a mouse, a timid elephant, a pig, a gorilla and a punk-rock porcupine.', 110, 11, NULL, CAST(0x313C0B00 AS Date), 120, 73, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (8, N'Patriots Day                                                                                        ', N'Tragedy strikes on April 15, 2013, when two bombs explode during the Boston Marathon. In the aftermath of the attack, police Sgt. Tommy Saunders (Mark Wahlberg), FBI Special Agent Richard DesLauriers (Kevin Bacon) and Commissioner Ed Davis (John Goodman) join courageous survivors, first responders and other investigators in a race against the clock to hunt down the suspects and bring them to justice.', 133, 12, NULL, CAST(0x3E3C0B00 AS Date), 120, 75, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (9, N'La La Land                                                                                          ', N'The story of Mia, an aspiring actress, and Sebastian, a dedicated jazz musician, struggling to make ends meet while pursuing their dreams in a city known for destroying hopes and breaking hearts. With modern day Los Angeles as the backdrop, this musical about everyday life explores what is more important: a once-in-a-lifetime love or the spotlight.', 128, 13, NULL, CAST(0x543C0B00 AS Date), 120, 85, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (10, N'T2 Trainspotting                                                                                    ', N'First there was an opportunity......then there was a betrayal. Twenty years have gone by. Much has changed but just as much remains the same. Mark Renton returns to the only place he can ever call home.They are waiting for him: Spud, Sick Boy, and Begbie. Other old friends are waiting too: sorrow, loss, joy, vengeance, hatred, friendship, love, longing, fear, regret, diamorphine, self-destruction and mortal danger, they are all lined up to welcome him, ready to join the dance.', 117, 14, NULL, CAST(0x633C0B00 AS Date), 120, 78, NULL)
INSERT [dbo].[Movie] ([idmovie], [title], [plot], [length], [iddirector], [idwriter], [release_year], [idlanguage], [rating], [cover]) VALUES (11, N'Fist Fight                                                                                          ', N'On the last day before summer vacation, high school teacher Andy Campbell tries his best to keep it together amid senior pranks, a dysfunctional administration and budget cuts that threaten his job. Things go from bad to worse when he crosses Ron Strickland, the school''s toughest and most feared teacher. When Strickland gets fired, he challenges Campbell to a fight after school. As news of the showdown spreads like wildfire, poor Andy desperately seeks any way out of his date with certain doom.', 91, 15, NULL, CAST(0x593C0B00 AS Date), 120, 59, NULL)
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[MovieCategory] ON 

INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (1, 1, 1, N'The Lego Batman Movie-Fantasy')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (2, 1, 2, N'The Lego Batman Movie-Action')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (3, 2, 3, N'Logan-Science fiction')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (4, 2, 4, N'Logan-Drama')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (5, 3, 4, N'Fifty Shades Darker-Drama')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (6, 3, 5, N'Fifty Shades Darker-Romance')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (7, 4, 6, N'John Wick: Chapter 2-Crime')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (8, 4, 7, N'John Wick: Chapter 2-Thriller')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (9, 5, 1, N'The Great Wall-Fantasy')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (10, 5, 8, N'The Great Wall-Mystery')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (11, 6, 9, N'Hidden Figures-History')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (12, 6, 4, N'Hidden Figures-Drama')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (13, 7, 4, N'Sing-Drama')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (14, 7, 10, N'Sing-Musical')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (15, 8, 4, N'Patriots Day-Drama')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (16, 8, 7, N'Patriots Day-Thriller')
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (17, 9, 4, NULL)
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (18, 9, 5, NULL)
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (19, 10, 4, NULL)
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (20, 10, 11, NULL)
INSERT [dbo].[MovieCategory] ([idmovie_category], [idmovie], [idcategory], [description]) VALUES (21, 11, 11, NULL)
SET IDENTITY_INSERT [dbo].[MovieCategory] OFF
SET IDENTITY_INSERT [dbo].[MovieProjection] ON 

INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (1, 1, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (2, 2, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (3, 3, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (4, 4, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (5, 5, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (6, 6, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (7, 7, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (8, 8, N'', CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (9, 9, NULL, CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
INSERT [dbo].[MovieProjection] ([idmovie_projection], [idmovie], [description], [start_date], [end_date]) VALUES (10, 10, NULL, CAST(0x0000A72A00000000 AS DateTime), CAST(0x0000A73E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[MovieProjection] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (1, N'arber                                        ', N'fama                                         ', CAST(0xE9110B00 AS Date), N'M', N'bla bla                                                                                                                                                                                                 ', N'arberfama@gmail.com                                                                                 ', CAST(0x0000A72900ED5941 AS DateTime), CAST(0x0000A72900ED5941 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (2, N'Vali                                         ', N'Pine                                         ', CAST(0x181C0B00 AS Date), N'F', N'bla bla                                                                                                                                                                                                 ', N'vanjelapine@gmail.com                                                                               ', CAST(0x0000A72900ED5941 AS DateTime), CAST(0x0000A72900ED5941 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (3, N'Xhuliana                                     ', N'Hima                                         ', CAST(0x5B950A00 AS Date), N'F', N'bla bla                                                                                                                                                                                                 ', N'xhulihima@hotmail.it                                                                                ', CAST(0x0000A72900ED5941 AS DateTime), CAST(0x0000A72900ED5941 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (4, N'Mario                                        ', N'Rossi                                        ', CAST(0x5B950A00 AS Date), N'M', N'askdfj                                                                                                                                                                                                  ', N'unknown@unknown.com                                                                                 ', CAST(0x0000A72900ED5941 AS DateTime), CAST(0x0000A72900ED5941 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (5, N'Chris                                        ', N'McKay                                        ', CAST(0x5B950A00 AS Date), N'M', N'ksdfasd                                                                                                                                                                                                 ', N'                                                                                                    ', CAST(0x0000A72900ED5942 AS DateTime), CAST(0x0000A72900ED5942 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (6, N'James                                        ', N'Mangold                                      ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5942 AS DateTime), CAST(0x0000A72900ED5942 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (7, N'James                                        ', N'Foley                                        ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5942 AS DateTime), CAST(0x0000A72900ED5942 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (8, N'Chad                                         ', N'Stahelski                                    ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5942 AS DateTime), CAST(0x0000A72900ED5942 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (9, N'Zhang                                        ', N'Yimou                                        ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5942 AS DateTime), CAST(0x0000A72900ED5942 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (10, N'Theodore                                     ', N'Melfi                                        ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5942 AS DateTime), CAST(0x0000A72900ED5942 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (11, N'Garth                                        ', N'Jennings                                     ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5943 AS DateTime), CAST(0x0000A72900ED5943 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (12, N'Peter                                        ', N'Berg                                         ', CAST(0x5B950A00 AS Date), N'M', N'                                                                                                                                                                                                        ', N'                                                                                                    ', CAST(0x0000A72900ED5943 AS DateTime), CAST(0x0000A72900ED5943 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (13, N' Damien                                      ', N'Chazelle                                     ', CAST(0x5B950A00 AS Date), N'M', N' asdfasd                                                                                                                                                                                                ', N'asdf@asdga.com                                                                                      ', CAST(0x0000A72900ED5943 AS DateTime), CAST(0x0000A72900ED5943 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (14, N'Danny                                        ', N'Boyle                                        ', NULL, N'M', N'asdfaksdj                                                                                                                                                                                               ', N'                                                                                                    ', CAST(0x0000A72900ED5943 AS DateTime), CAST(0x0000A72900ED5943 AS DateTime))
INSERT [dbo].[Person] ([idperson], [name], [surname], [birthdate], [gender], [address], [email], [update_date], [insertion_date]) VALUES (15, N'Richie                                       ', N'Keen                                         ', NULL, N'M', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[TheatreRoom] ON 

INSERT [dbo].[TheatreRoom] ([idtheatre_room], [name], [desccription], [rows_nr], [seats_per_row], [idcinema]) VALUES (1, N'cinema 1', N'cinema 1, seats 12x12', 12, 12, 1)
INSERT [dbo].[TheatreRoom] ([idtheatre_room], [name], [desccription], [rows_nr], [seats_per_row], [idcinema]) VALUES (2, N'cinema 2', N'cinema 2, seats 12x12', 12, 12, 1)
INSERT [dbo].[TheatreRoom] ([idtheatre_room], [name], [desccription], [rows_nr], [seats_per_row], [idcinema]) VALUES (3, N'cinema 3', N'cinema 3, seats 12x12', 12, 12, 1)
INSERT [dbo].[TheatreRoom] ([idtheatre_room], [name], [desccription], [rows_nr], [seats_per_row], [idcinema]) VALUES (4, N'cinema 4', N'cinema 4, seats 12x12', 12, 12, 1)
INSERT [dbo].[TheatreRoom] ([idtheatre_room], [name], [desccription], [rows_nr], [seats_per_row], [idcinema]) VALUES (5, N'cinema 5', N'cinema 5, seats 12x12', 12, 12, 1)
INSERT [dbo].[TheatreRoom] ([idtheatre_room], [name], [desccription], [rows_nr], [seats_per_row], [idcinema]) VALUES (6, N'cinema 6', N'cinema 6, seats 12x12', 12, 12, 1)
SET IDENTITY_INSERT [dbo].[TheatreRoom] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([iduser], [idperson], [username], [password], [isactive], [update_date], [insertion_date], [role]) VALUES (1, 1, N'nicarb                        ', N'N9qvekqRuQpO6I89ZRMyDAKvnaRni/n/UibimibSlzPRogjxp28TDCaTqgy2M7tMBQ0ZJ7BT1yoTs6mcHMtW4w==                                          ', 1, CAST(0x0000A72900ED5960 AS DateTime), CAST(0x0000A72900ED5960 AS DateTime), N'S')
INSERT [dbo].[User] ([iduser], [idperson], [username], [password], [isactive], [update_date], [insertion_date], [role]) VALUES (2, 2, N'valipine                      ', N'xpLlXXMUvSWfd7gwbIaAsJDfydJCdnqD+b2I12f6egnR1tw56fIpCvTNBpTbIG4rgzLMuSE74fb1Y/j5ZEkP1w==                                          ', 1, CAST(0x0000A72900ED5960 AS DateTime), CAST(0x0000A72900ED5960 AS DateTime), N'A')
INSERT [dbo].[User] ([iduser], [idperson], [username], [password], [isactive], [update_date], [insertion_date], [role]) VALUES (3, 3, N'xhulihima                     ', N'WOr+WHQsH7yFgYyf/p/w+TWbDYciDgVzPbKicwrzeyD5FCevPfHFd3zCVCbz0ZvbckN3hdPf5mqolrp6wKM6/w==                                          ', 1, CAST(0x0000A72900ED5960 AS DateTime), CAST(0x0000A72900ED5960 AS DateTime), N'A')
INSERT [dbo].[User] ([iduser], [idperson], [username], [password], [isactive], [update_date], [insertion_date], [role]) VALUES (4, 13, N'admin12                       ', N' /cFUrSEOy/SZtXvwfkEFZAneNem27qfl92YElbfO2/aSNTOFr1MZyoJCPJLbO1uv/oeGHOIVRfy9hqQGdNEhvg==                                         ', 1, NULL, NULL, N'S')
SET IDENTITY_INSERT [dbo].[User] OFF
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
ALTER TABLE [dbo].[ProjectionTime]  WITH CHECK ADD  CONSTRAINT [FK_ProjectionTime_TheatreRoom] FOREIGN KEY([idtheatre_room])
REFERENCES [dbo].[TheatreRoom] ([idtheatre_room])
GO
ALTER TABLE [dbo].[ProjectionTime] CHECK CONSTRAINT [FK_ProjectionTime_TheatreRoom]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is the primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'idperson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Values should be ''M'' or ''F''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'gender'
GO
USE [master]
GO
ALTER DATABASE [cinema_booking] SET  READ_WRITE 
GO
