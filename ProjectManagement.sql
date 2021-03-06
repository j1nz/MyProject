USE [ProjectManagement]
GO
ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_Task_Project]
GO
ALTER TABLE [dbo].[Story] DROP CONSTRAINT [FK_Story_Account]
GO
ALTER TABLE [dbo].[ProjectOfAccount] DROP CONSTRAINT [FK_ProjectOfAccount_Project]
GO
ALTER TABLE [dbo].[ProjectOfAccount] DROP CONSTRAINT [FK_ProjectOfAccount_Account]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Task]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Project]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [FK_Account_Person]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[Task]
GO
/****** Object:  Table [dbo].[Story]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[Story]
GO
/****** Object:  Table [dbo].[ProjectOfAccount]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[ProjectOfAccount]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[Project]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[Person]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[Comment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP TABLE [dbo].[Account]
GO
USE [master]
GO
/****** Object:  Database [ProjectManagement]    Script Date: 4/17/2017 10:35:56 PM ******/
DROP DATABASE [ProjectManagement]
GO
/****** Object:  Database [ProjectManagement]    Script Date: 4/17/2017 10:35:56 PM ******/
CREATE DATABASE [ProjectManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/17/2017 10:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[role] [varchar](20) NULL,
	[isActive] [int] NULL,
	[personId] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/17/2017 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] NOT NULL,
	[commentContent] [nvarchar](500) NULL,
	[taskId] [int] NULL,
	[accountId] [int] NULL,
	[projectId] [int] NULL,
	[dateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/17/2017 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[personId] [int] NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[avatar] [nvarchar](200) NULL,
	[status] [nvarchar](100) NULL,
	[birthday] [datetime2](7) NULL,
	[address] [nvarchar](500) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[personId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 4/17/2017 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[projectId] [int] NOT NULL,
	[projectName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[projectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectOfAccount]    Script Date: 4/17/2017 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOfAccount](
	[projectId] [int] NOT NULL,
	[accountId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectOfAccount] PRIMARY KEY CLUSTERED 
(
	[projectId] ASC,
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Story]    Script Date: 4/17/2017 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Story](
	[storyId] [int] NOT NULL,
	[accountId] [int] NULL,
	[storyContent] [text] NULL,
	[dateCreate] [datetime2](7) NULL,
	[status] [int] NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_Story] PRIMARY KEY CLUSTERED 
(
	[storyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task]    Script Date: 4/17/2017 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[taskId] [int] NOT NULL,
	[taskName] [nvarchar](200) NULL,
	[dateStart] [datetime2](7) NULL,
	[dateEnd] [datetime2](7) NULL,
	[description] [text] NULL,
	[projectId] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[taskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Person] FOREIGN KEY([personId])
REFERENCES [dbo].[Person] ([personId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Person]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Project] FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([projectId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Project]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Task] FOREIGN KEY([taskId])
REFERENCES [dbo].[Task] ([taskId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Task]
GO
ALTER TABLE [dbo].[ProjectOfAccount]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOfAccount_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[ProjectOfAccount] CHECK CONSTRAINT [FK_ProjectOfAccount_Account]
GO
ALTER TABLE [dbo].[ProjectOfAccount]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOfAccount_Project] FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([projectId])
GO
ALTER TABLE [dbo].[ProjectOfAccount] CHECK CONSTRAINT [FK_ProjectOfAccount_Project]
GO
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_Account]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([projectId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
USE [master]
GO
ALTER DATABASE [ProjectManagement] SET  READ_WRITE 
GO
