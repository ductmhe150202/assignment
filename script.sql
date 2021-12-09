USE [master]
GO
/****** Object:  Database [Project]    Script Date: 12/10/2021 00:03:38 ******/
CREATE DATABASE [Project] ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Project.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Project_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Project] SET ARITHABORT OFF
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Project] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Project] SET  READ_WRITE
GO
ALTER DATABASE [Project] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Project] SET  MULTI_USER
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/10/2021 00:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IsAdmin] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Name], [IsAdmin]) VALUES (N'admin', N'admin', N'admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [IsAdmin]) VALUES (N'ductm', N'123456789', N'Trần Minh Đức', 0)
/****** Object:  Table [dbo].[Slot]    Script Date: 12/10/2021 00:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] NOT NULL,
	[Start] [time](7) NOT NULL,
	[End] [time](7) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Slot] ([SlotID], [Start], [End]) VALUES (1, CAST(0x07000C41DD3E0000 AS Time), CAST(0x0700A8E76F4B0000 AS Time))
INSERT [dbo].[Slot] ([SlotID], [Start], [End]) VALUES (2, CAST(0x07006488D54C0000 AS Time), CAST(0x0700002F68590000 AS Time))
INSERT [dbo].[Slot] ([SlotID], [Start], [End]) VALUES (3, CAST(0x0700BCCFCD5A0000 AS Time), CAST(0x0700587660670000 AS Time))
INSERT [dbo].[Slot] ([SlotID], [Start], [End]) VALUES (4, CAST(0x07008C58916B0000 AS Time), CAST(0x070028FF23780000 AS Time))
INSERT [dbo].[Slot] ([SlotID], [Start], [End]) VALUES (5, CAST(0x0700E49F89790000 AS Time), CAST(0x070080461C860000 AS Time))
INSERT [dbo].[Slot] ([SlotID], [Start], [End]) VALUES (6, CAST(0x07003CE781870000 AS Time), CAST(0x0700080551830000 AS Time))
/****** Object:  Table [dbo].[Class]    Script Date: 12/10/2021 00:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [nchar](10) NOT NULL,
	[Slot] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/10/2021 00:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nchar](10) NOT NULL,
	[StudentName] [nvarchar](100) NULL,
	[Email] [nchar](50) NULL,
	[Class] [nchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 12/10/2021 00:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nchar](10) NOT NULL,
	[Class] [nchar](10) NOT NULL,
	[Slot] [int] NOT NULL,
	[AttDate] [date] NOT NULL,
	[Present] [bit] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Class_Slot]    Script Date: 12/10/2021 00:03:39 ******/
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Slot] FOREIGN KEY([Slot])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Slot]
GO
/****** Object:  ForeignKey [FK_Student_Class]    Script Date: 12/10/2021 00:03:39 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
/****** Object:  ForeignKey [FK_Attendance_Class]    Script Date: 12/10/2021 00:03:39 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Class]
GO
/****** Object:  ForeignKey [FK_Attendance_Slot]    Script Date: 12/10/2021 00:03:39 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Slot] FOREIGN KEY([Slot])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Slot]
GO
/****** Object:  ForeignKey [FK_Attendance_Student]    Script Date: 12/10/2021 00:03:39 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
