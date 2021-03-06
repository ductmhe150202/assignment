USE [master]
GO
/****** Object:  Database [Project]    Script Date: 12/13/2021 03:17:12 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 12/13/2021 03:17:13 ******/
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
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Name], [IsAdmin]) VALUES (N'admin', N'admin', N'admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Name], [IsAdmin]) VALUES (N'ductm', N'123456', N'Trần Minh Đức', 0)
INSERT [dbo].[Account] ([Username], [Password], [Name], [IsAdmin]) VALUES (N'tmduc', N'123456', N'Minh Đức Trần', 0)
/****** Object:  Table [dbo].[Class]    Script Date: 12/13/2021 03:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[ClassName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (1, N'SE0001')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (2, N'SE0002')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (3, N'SE0003')
/****** Object:  Table [dbo].[Student]    Script Date: 12/13/2021 03:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nchar](10) NOT NULL,
	[StudentName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130028  ', N'Vũ Tuấn Huy')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130064  ', N'Nguyễn Hoàng Nam')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130119  ', N'Nguyễn Đức Hưng')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130121  ', N'Dương Hoàng Tuấn')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130258  ', N'Nguyễn Văn Duy')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130291  ', N'Nguyễn Huy Đức')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130675  ', N'Đỗ Hoàng Nam')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130759  ', N'Nguyễn Đức Dũng')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE130838  ', N'Vũ Minh Quang')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE141363  ', N'Nguyễn Đăng Kiên')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE141408  ', N'Lương Minh Ngân')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE150510  ', N'Nguyễn Thị Mỹ An')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE151065  ', N'Lê Vũ Long')
/****** Object:  Table [dbo].[Slot]    Script Date: 12/13/2021 03:17:13 ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/13/2021 03:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[ClassID] [int] NULL,
	[StudentID] [nchar](10) NULL,
	[SlotID] [int] NULL,
	[Lecture] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130064  ', 2, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130121  ', 2, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130258  ', 2, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130291  ', 2, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130675  ', 2, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130838  ', 2, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (2, N'HE130759  ', 4, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (2, N'HE141408  ', 4, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (2, N'HE150510  ', 4, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (2, N'HE151065  ', 4, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (2, N'HE130121  ', 4, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (2, N'HE130028  ', 4, N'ductm')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130064  ', 3, N'tmduc')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130121  ', 3, N'tmduc')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130258  ', 3, N'tmduc')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130291  ', 3, N'tmduc')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130675  ', 3, N'tmduc')
INSERT [dbo].[Schedule] ([ClassID], [StudentID], [SlotID], [Lecture]) VALUES (1, N'HE130838  ', 3, N'tmduc')
/****** Object:  Table [dbo].[Attendance]    Script Date: 12/13/2021 03:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nchar](10) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Slot] [int] NOT NULL,
	[Lecture] [varchar](150) NOT NULL,
	[AttDate] [date] NOT NULL,
	[Present] [bit] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (146, N'HE130064  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (147, N'HE130121  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (148, N'HE130258  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 0)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (149, N'HE130291  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (150, N'HE130675  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (151, N'HE130838  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (152, N'HE130064  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (153, N'HE130121  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (154, N'HE130258  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 0)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (155, N'HE130291  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (156, N'HE130675  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
INSERT [dbo].[Attendance] ([AttID], [StudentID], [ClassID], [Slot], [Lecture], [AttDate], [Present]) VALUES (157, N'HE130838  ', 1, 2, N'ductm', CAST(0x58430B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
/****** Object:  ForeignKey [FK_Schedule_Account]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Account] FOREIGN KEY([Lecture])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Account]
GO
/****** Object:  ForeignKey [FK_Schedule_Class]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Class]
GO
/****** Object:  ForeignKey [FK_Schedule_Slot]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Slot] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Slot]
GO
/****** Object:  ForeignKey [FK_Schedule_Student]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Student]
GO
/****** Object:  ForeignKey [FK_Attendance_Class]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Class]
GO
/****** Object:  ForeignKey [FK_Attendance_Slot]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Slot] FOREIGN KEY([Slot])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Slot]
GO
/****** Object:  ForeignKey [FK_Attendance_Student]    Script Date: 12/13/2021 03:17:13 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
