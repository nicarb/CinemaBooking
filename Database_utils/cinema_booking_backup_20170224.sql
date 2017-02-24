USE [master]
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
/****** Object:  View [dbo].[UserView]    Script Date: 2/24/2017 1:19:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserView]
AS
SELECT        dbo.Person.name, dbo.Person.surname, UserView.username, dbo.Person.birthdate, dbo.Person.gender, dbo.Person.email, dbo.Role.name AS Expr1
FROM            dbo.Person INNER JOIN
                         dbo.[User] AS UserView ON dbo.Person.idperson = UserView.idperson INNER JOIN
                         dbo.Role ON UserView.idrole = dbo.Role.idrole

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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Person"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 237
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 183
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserView"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 222
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserView'
GO
USE [master]
GO
ALTER DATABASE [cinema_booking] SET  READ_WRITE 
GO
