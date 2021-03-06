USE [master]
GO
/****** Object:  Database [DBCollection]    Script Date: 7/11/2020 13:19:35 ******/
CREATE DATABASE [DBCollection]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCollection', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBCollection.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBCollection_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBCollection_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBCollection] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCollection].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCollection] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCollection] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCollection] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCollection] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCollection] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCollection] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBCollection] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCollection] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCollection] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCollection] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCollection] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCollection] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCollection] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCollection] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCollection] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCollection] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCollection] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCollection] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCollection] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCollection] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCollection] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCollection] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCollection] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCollection] SET  MULTI_USER 
GO
ALTER DATABASE [DBCollection] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCollection] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCollection] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCollection] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBCollection] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DBCollection]
GO
/****** Object:  Table [dbo].[ActionPlan]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPlan](
	[StretchId] [int] NULL,
	[ActionId] [int] NULL,
	[State] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Actions]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actions](
	[ActionId] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [varchar](50) NOT NULL,
	[State] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActionState]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActionState](
	[ActionStateId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Adviser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adviser](
	[AdviserId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[State] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdviserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Classification]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classification](
	[ClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[ActionId] [int] NOT NULL,
	[State] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [char](8) NOT NULL,
	[Ruc] [char](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Phone] [varchar](9) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Email] [varchar](50) NULL,
	[Account] [varchar](30) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Debt] [decimal](10, 2) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[FeeNumber] [int] NULL,
	[UserId] [int] NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CollectionManagement]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CollectionManagement](
	[ClientId] [int] NULL,
	[StretchId] [int] NULL,
	[ActionId] [int] NULL,
	[ResultId] [int] NULL,
	[Comment] [varchar](max) NULL,
	[RegistrationDate] [date] NOT NULL,
	[ActionStateId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[State] [bit] NOT NULL,
	[ClassificationId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [char](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[state] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Strategy]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Strategy](
	[StrategyId] [int] IDENTITY(1,1) NOT NULL,
	[StrategyName] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
	[CreateDate] [date] NOT NULL,
	[state] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[StrategyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stretch]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stretch](
	[StretchId] [int] IDENTITY(1,1) NOT NULL,
	[StrechName] [varchar](30) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[StartDay] [int] NOT NULL,
	[EndDay] [int] NOT NULL,
	[State] [bit] NOT NULL,
	[StrategyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StretchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Password] [varbinary](250) NOT NULL,
	[FirstName] [varchar](250) NOT NULL,
	[LastName] [varchar](250) NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (1, 2, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (1, 4, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (2, 2, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (2, 4, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (2, 3, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (3, 2, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (3, 4, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (3, 1, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (4, 1, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (4, 3, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (4, 5, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (5, 1, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (5, 5, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (5, 6, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (6, 1, 1)
INSERT [dbo].[ActionPlan] ([StretchId], [ActionId], [State]) VALUES (6, 7, 1)
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (1, N'Llamada', 1)
INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (2, N'Envío SMS', 1)
INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (3, N'Whatsapp', 1)
INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (4, N'Envío IVR', 1)
INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (5, N'Envío Correo', 1)
INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (6, N'Envío Carta', 1)
INSERT [dbo].[Actions] ([ActionId], [ActionName], [State]) VALUES (7, N'Visita de Campo', 1)
SET IDENTITY_INSERT [dbo].[Actions] OFF
SET IDENTITY_INSERT [dbo].[ActionState] ON 

INSERT [dbo].[ActionState] ([ActionStateId], [Description], [State]) VALUES (1, N'Pendiente', 1)
INSERT [dbo].[ActionState] ([ActionStateId], [Description], [State]) VALUES (2, N'Ejecutado', 1)
INSERT [dbo].[ActionState] ([ActionStateId], [Description], [State]) VALUES (3, N'No ejecutado', 1)
INSERT [dbo].[ActionState] ([ActionStateId], [Description], [State]) VALUES (4, N'Cancelado', 1)
INSERT [dbo].[ActionState] ([ActionStateId], [Description], [State]) VALUES (5, N'Aprobado', 1)
SET IDENTITY_INSERT [dbo].[ActionState] OFF
SET IDENTITY_INSERT [dbo].[Classification] ON 

INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (1, N'Contacto Directo', 1, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (2, N'Contacto Indirecto', 1, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (3, N'No contactado', 1, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (4, N'Enviado', 2, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (5, N'No enviado', 2, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (6, N'Enviado', 3, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (7, N'Recibido', 3, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (8, N'Visto por el usuario', 3, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (9, N'Enviado', 4, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (10, N'No enviado', 4, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (11, N'Enviado', 5, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (12, N'No enviado', 5, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (13, N'Rechazado', 5, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (14, N'Contacto Directo', 6, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (15, N'Contacto Indirecto', 6, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (16, N'No contactado', 6, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (17, N'Contacto Directo', 7, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (18, N'Contacto Indirecto', 7, 1)
INSERT [dbo].[Classification] ([ClassificationId], [Description], [ActionId], [State]) VALUES (19, N'No contactado', 7, 1)
SET IDENTITY_INSERT [dbo].[Classification] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (1, N'44448801', N'1044448801', N'Juan', N'Perez Trujillo', CAST(N'1981-05-27' AS Date), N'980555501', N'Calle 01 Avenida 01', N'cliente01@gmail.com', N'000123456789100', CAST(1000.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(N'2020-06-01' AS Date), 1, 1, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (2, N'44448802', N'1044448802', N'José', N'Mujica Gómez', CAST(N'1982-06-28' AS Date), N'980555502', N'Calle 02 Avenida 02', N'cliente02@gmail.com', N'000123456789101', CAST(2000.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(N'2020-06-02' AS Date), 2, 2, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (3, N'44448803', N'1044448803', N'Luis', N'Guzmán Caballero', CAST(N'1983-07-10' AS Date), N'980555503', N'Calle 03 Avenida 03', N'cliente03@gmail.com', N'000123456789102', CAST(1500.00 AS Decimal(10, 2)), CAST(130.00 AS Decimal(10, 2)), CAST(N'2020-06-03' AS Date), 3, 3, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (4, N'44448804', N'1044448804', N'Rosa', N'Muñoz Miranda', CAST(N'1984-08-02' AS Date), N'980555504', N'Calle 04 Avenida 04', N'cliente04@gmail.com', N'000123456789103', CAST(3000.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), CAST(N'2020-05-20' AS Date), 4, 4, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (5, N'44448805', N'1044448805', N'Carlos', N'Arizaga Cuadros', CAST(N'1985-09-23' AS Date), N'980555505', N'Calle 05 Avenida 05', N'cliente05@gmail.com', N'000123456789104', CAST(600.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(N'2020-05-02' AS Date), 1, 1, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (6, N'44448806', N'1044448806', N'Juana', N'Díaz Gonzales', CAST(N'1986-10-15' AS Date), N'980555506', N'Calle 06 Avenida 06', N'cliente06@gmail.com', N'000123456789105', CAST(800.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(N'2020-05-27' AS Date), 2, 2, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (7, N'44448807', N'1044448807', N'Vicente', N'Fukuda Tanaka', CAST(N'1987-11-11' AS Date), N'980555507', N'Calle 07 Avenida 07', N'cliente07@gmail.com', N'000123456789106', CAST(400.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(N'2020-06-10' AS Date), 3, 3, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (8, N'44448808', N'1044448808', N'Ricardo', N'Quispe Paúcar', CAST(N'1988-12-05' AS Date), N'980555508', N'Calle 08 Avenida 08', N'cliente08@gmail.com', N'000123456789107', CAST(1500.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)), CAST(N'2020-05-15' AS Date), 4, 4, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (9, N'44448809', N'1044448809', N'Fernando', N'Meza Guardamino', CAST(N'1989-01-31' AS Date), N'980555509', N'Calle 09 Avenida 09', N'cliente09@gmail.com', N'000123456789108', CAST(2500.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(N'2020-05-19' AS Date), 4, 1, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (10, N'44448810', N'1044448810', N'Renzo', N'Quispe Pérez', CAST(N'1990-02-20' AS Date), N'980555510', N'Calle 10 Avenida 10', N'cliente10@gmail.com', N'000123456789109', CAST(1060.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(N'2020-05-30' AS Date), 3, 2, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (11, N'44448811', N'1044448811', N'Edson', N'Cubillas Chávez', CAST(N'1991-03-03' AS Date), N'980555511', N'Calle 11 Avenida 11', N'cliente11@gmail.com', N'000123456789110', CAST(1007.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), CAST(N'2020-05-28' AS Date), 2, 3, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (12, N'44448812', N'1044448812', N'Carla', N'Fuente Poma', CAST(N'1992-04-10' AS Date), N'980555512', N'Calle 12 Avenida 12', N'cliente12@gmail.com', N'000123456789111', CAST(1010.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(N'2020-05-11' AS Date), 1, 4, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (13, N'44448813', N'1044448813', N'Elías', N'Cárdenas Yupanqui', CAST(N'1993-05-14' AS Date), N'980555513', N'Calle 13 Avenida 13', N'cliente13@gmail.com', N'000123456789112', CAST(5000.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(N'2020-05-07' AS Date), 1, 1, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (14, N'44448814', N'1044448814', N'Mariano', N'Lazo León', CAST(N'1994-06-29' AS Date), N'980555514', N'Calle 14 Avenida 14', N'cliente14@gmail.com', N'000123456789113', CAST(600.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(N'2020-06-07' AS Date), 2, 2, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (15, N'44448815', N'1044448815', N'Fabrizio', N'Mendizabal Caulla', CAST(N'1995-07-09' AS Date), N'980555515', N'Calle 15 Avenida 15', N'cliente15@gmail.com', N'000123456789114', CAST(800.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), CAST(N'2020-06-09' AS Date), 3, 3, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (16, N'44448816', N'1044448816', N'Guillermo', N'Ochoa Pizarro', CAST(N'1996-08-02' AS Date), N'980555516', N'Calle 16 Avenida 16', N'cliente16@gmail.com', N'000123456789115', CAST(1800.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), CAST(N'2020-05-21' AS Date), 4, 4, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (17, N'44448817', N'1044448817', N'Ericka', N'Valverde Gonzáles', CAST(N'1997-09-01' AS Date), N'980555517', N'Calle 17 Avenida 17', N'cliente17@gmail.com', N'000123456789116', CAST(700.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(N'2020-05-20' AS Date), 5, 1, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (18, N'44448818', N'1044448818', N'Carmen', N'Quiroz Núñez', CAST(N'1997-10-05' AS Date), N'980555518', N'Calle 18 Avenida 18', N'cliente18@gmail.com', N'000123456789117', CAST(900.00 AS Decimal(10, 2)), CAST(190.00 AS Decimal(10, 2)), CAST(N'2020-05-13' AS Date), 1, 2, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (19, N'44448819', N'1044448819', N'Gustavo', N'Nolasco Gutiérrez', CAST(N'1998-11-07' AS Date), N'980555519', N'Calle 19 Avenida 19', N'cliente19@gmail.com', N'000123456789118', CAST(300.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(N'2020-05-01' AS Date), 2, 3, 1)
INSERT [dbo].[Client] ([ClientId], [Dni], [Ruc], [Name], [LastName], [BirthDate], [Phone], [Address], [Email], [Account], [Amount], [Debt], [ExpirationDate], [FeeNumber], [UserId], [State]) VALUES (20, N'44448820', N'1044448820', N'Juan Carlos', N'Túpac Palacios', CAST(N'1999-12-09' AS Date), N'980555520', N'Calle 20 Avenida 20', N'cliente20@gmail.com', N'000123456789119', CAST(3050.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), CAST(N'2020-05-18' AS Date), 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Client] OFF
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (1, 3, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (1, 3, 2, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (1, 3, 4, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (2, 3, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (2, 3, 2, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (2, 3, 4, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (3, 3, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (3, 3, 2, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (3, 3, 4, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (4, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (4, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (4, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (5, 5, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (5, 5, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (5, 5, 6, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (6, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (6, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (6, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (7, 2, 2, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (7, 2, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (7, 2, 4, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (8, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (8, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (8, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (9, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (9, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (9, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (10, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (10, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (10, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (11, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (11, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (11, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (12, 5, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (12, 5, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (12, 5, 6, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (13, 5, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (13, 5, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (13, 5, 6, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (14, 2, 2, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (14, 2, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (14, 2, 4, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (15, 2, 2, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (15, 2, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (15, 2, 4, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (16, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (16, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (16, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (17, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (17, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (17, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (18, 5, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (18, 5, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (18, 5, 6, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (19, 5, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (19, 5, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (19, 5, 6, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (20, 4, 1, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (20, 4, 3, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
INSERT [dbo].[CollectionManagement] ([ClientId], [StretchId], [ActionId], [ResultId], [Comment], [RegistrationDate], [ActionStateId]) VALUES (20, 4, 5, NULL, NULL, CAST(N'2020-06-13' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (1, N'Problemas familiares', 1, 1)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (2, N'Problemas de salud', 1, 1)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (3, N'No consigue trabajo', 1, 1)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (4, N'Ya pagó', 1, 1)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (5, N'No reconoce la deuda', 1, 1)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (6, N'Compromiso de pago', 1, 1)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (7, N'El titular está de viaje', 1, 2)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (8, N'No conoce al titular', 1, 2)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (9, N'Titular falleció', 1, 2)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (10, N'El titular no vive en esa dirección', 1, 2)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (11, N'El titular dice que ya pagó', 1, 2)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (12, N'No contesta', 1, 3)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (13, N'No existe el número', 1, 3)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (14, N'Cuelga las llamadas', 1, 3)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (15, N'Dirección errada', 1, 3)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (16, N'Enviado', 1, 4)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (17, N'No enviado', 1, 5)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (18, N'Enviado', 1, 6)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (19, N'Recibido', 1, 7)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (20, N'Visto por el usuario', 1, 8)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (21, N'Enviado', 1, 9)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (22, N'No enviado', 1, 10)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (23, N'Enviado', 1, 11)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (24, N'No enviado', 1, 12)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (25, N'Rechazado', 1, 13)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (26, N'Recibido', 1, 14)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (27, N'Se negó a recibir', 1, 14)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (28, N'El titular está de viaje', 1, 15)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (29, N'No conoce al titular', 1, 15)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (30, N'Titular falleció', 1, 15)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (31, N'El titular no vive en esa dirección', 1, 15)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (32, N'El titular dice que ya pagó', 1, 15)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (33, N'Dirección no existe', 1, 16)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (34, N'Zona peligrosa', 1, 16)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (35, N'Dirección errada', 1, 16)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (36, N'Problemas familiares', 1, 17)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (37, N'Problemas de salud', 1, 17)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (38, N'No consigue trabajo', 1, 17)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (39, N'Ya pagó', 1, 17)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (40, N'No reconoce la deuda', 1, 17)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (41, N'Compromiso de pago', 1, 17)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (42, N'El titular está de viaje', 1, 18)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (43, N'No conoce al titular', 1, 18)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (44, N'Titular falleció', 1, 18)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (45, N'El titular no vive en esa dirección', 1, 18)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (46, N'El titular dice que ya pagó', 1, 18)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (47, N'Dirección no existe', 1, 19)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (48, N'Zona peligrosa', 1, 19)
INSERT [dbo].[Result] ([ResultId], [Description], [State], [ClassificationId]) VALUES (49, N'Dirección errada', 1, 19)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Code], [Name], [state]) VALUES (1, N'AS', N'Administrador', 1)
INSERT [dbo].[Roles] ([RoleId], [Code], [Name], [state]) VALUES (2, N'SA', N'Supervisor de Agencia', 1)
INSERT [dbo].[Roles] ([RoleId], [Code], [Name], [state]) VALUES (3, N'AC', N'Asesor de Cobranza', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Strategy] ON 

INSERT [dbo].[Strategy] ([StrategyId], [StrategyName], [Description], [CreateDate], [state]) VALUES (1, N'General', N'Estrategia estándar', CAST(N'1990-01-01' AS Date), 1)
INSERT [dbo].[Strategy] ([StrategyId], [StrategyName], [Description], [CreateDate], [state]) VALUES (2, N'202001', N'Estrategia por semanas hasta un mes', CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Strategy] ([StrategyId], [StrategyName], [Description], [CreateDate], [state]) VALUES (3, N'201901', N'Estrategia estándar hasta dos meses', CAST(N'2019-01-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Strategy] OFF
SET IDENTITY_INSERT [dbo].[Stretch] ON 

INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (1, N'Tramo 1', N'Primer tramo de cobranza', 1, 3, 1, 1)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (2, N'Tramo 2', N'Segundo tramo de cobranza', 4, 7, 1, 1)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (3, N'Tramo 3', N'Tercer tramo de cobranza', 8, 14, 1, 1)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (4, N'Tramo 4', N'Cuarto tramo de cobranza', 15, 30, 1, 1)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (5, N'Tramo 5', N'Quinto tramo de cobranza', 31, 60, 1, 1)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (6, N'Tramo 6', N'Cartera castigada', 61, 365, 1, 1)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (7, N'Primer tramo', N'Primera semana', 1, 3, 0, 2)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (8, N'Segundo tramo', N'Segunda semana', 4, 7, 0, 2)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (9, N'Tercer tramo', N'Tercera semana', 8, 14, 0, 2)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (10, N'Cuarto tramo', N'Cuarta semana', 15, 30, 0, 2)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (11, N'Quinto tramo', N'Primer mes', 31, 60, 0, 2)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (12, N'Tramo 1', N'Primeros días', 1, 3, 0, 3)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (13, N'Tramo 2', N'Primera semana', 4, 7, 0, 3)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (14, N'Tramo 3', N'Segunda semana', 8, 14, 0, 3)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (15, N'Tramo 4', N'Quincena', 15, 30, 0, 3)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (16, N'Tramo 5', N'Mayor a 1 mes', 31, 60, 0, 3)
INSERT [dbo].[Stretch] ([StretchId], [StrechName], [Description], [StartDay], [EndDay], [State], [StrategyId]) VALUES (17, N'Tramo 6', N'Mayor a 2 meses', 61, 365, 0, 3)
SET IDENTITY_INSERT [dbo].[Stretch] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [RoleId]) VALUES (1, N'asesorcobranza01@gmail.com', 0x0200B45D918FE02CDC6747D5855ECD1EE759A824637A715FFFB0F33D732F91E4FB29591430B1DDBF25B95E7108011A8E8C69D3F78A242B1F6637AC45C76BEAE728D5CA48A918, N'Miguel', N'Huarcaya Alegría', 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [RoleId]) VALUES (2, N'asesorcobranza02@gmail.com', 0x0200FBB8FBA9D21DB12B958ED214A3865C570D71E0C8BA98485B3F02531A65E204C3B6B79531667617A9809148476DA393046315B73DF58B4BA958247D42A8CE81D609B921C3, N'Juan Carlos', N'Valle Peña', 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [RoleId]) VALUES (3, N'asesorcobranza03@gmail.com', 0x02009B2307E158FCFFB2584B34A75B9125669F7FDB64136BF371A0059EE926D89081D62F2FAFACE63DE423747A10844474A456167FD68CC109538D1EAB5224DAC38A0E5DA725, N'Fernando', N'Ravelo Arcos', 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [RoleId]) VALUES (4, N'asesorcobranza04@gmail.com', 0x02004D0F45A73B9668D01193A49166C49998670CC73C28991E9B9A03158418297A82C0D15FA9A4A8F0316F3688BCA52CD95D1E78260AB55ABC6FF1B2C5FAC8C501795687F6C3, N'Jackson', N'Guzmán', 3)
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [RoleId]) VALUES (5, N'administradorsistema01@gmail.com', 0x02004941D687AB6D802C8A2ADF927ABD9A7B2E30276F2B73A3496E42D380F4E4A4BD6D2C01A5088839985BBAF57A3132E2BEB72C5E5E62C6AE795093B6B58BFAECB9D93DA127, N'Fernando', N'Valverde Uchoffen', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Client__B0C3AC46DBACDC47]    Script Date: 7/11/2020 13:19:35 ******/
ALTER TABLE [dbo].[Client] ADD UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Client__C0308575F4AE4537]    Script Date: 7/11/2020 13:19:35 ******/
ALTER TABLE [dbo].[Client] ADD UNIQUE NONCLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Client__CAF0367326F8A5D9]    Script Date: 7/11/2020 13:19:35 ******/
ALTER TABLE [dbo].[Client] ADD UNIQUE NONCLUSTERED 
(
	[Ruc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Roles__A25C5AA76AAA4911]    Script Date: 7/11/2020 13:19:35 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Strategy__E7BA90D1EEAE0FEA]    Script Date: 7/11/2020 13:19:35 ******/
ALTER TABLE [dbo].[Strategy] ADD UNIQUE NONCLUSTERED 
(
	[StrategyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__A9D105340C81DC74]    Script Date: 7/11/2020 13:19:35 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActionPlan]  WITH CHECK ADD FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([ActionId])
GO
ALTER TABLE [dbo].[ActionPlan]  WITH CHECK ADD FOREIGN KEY([StretchId])
REFERENCES [dbo].[Stretch] ([StretchId])
GO
ALTER TABLE [dbo].[Adviser]  WITH CHECK ADD FOREIGN KEY([AdviserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Classification]  WITH CHECK ADD FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([ActionId])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[CollectionManagement]  WITH CHECK ADD FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([ActionId])
GO
ALTER TABLE [dbo].[CollectionManagement]  WITH CHECK ADD FOREIGN KEY([ActionStateId])
REFERENCES [dbo].[ActionState] ([ActionStateId])
GO
ALTER TABLE [dbo].[CollectionManagement]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[CollectionManagement]  WITH CHECK ADD FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([ResultId])
GO
ALTER TABLE [dbo].[CollectionManagement]  WITH CHECK ADD FOREIGN KEY([StretchId])
REFERENCES [dbo].[Stretch] ([StretchId])
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD FOREIGN KEY([ClassificationId])
REFERENCES [dbo].[Classification] ([ClassificationId])
GO
ALTER TABLE [dbo].[Stretch]  WITH CHECK ADD FOREIGN KEY([StrategyId])
REFERENCES [dbo].[Strategy] ([StrategyId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateUser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_CreateUser]
(
@Email VARCHAR(250),
@Password VARCHAR(250),
@FirstName VARCHAR(250),
@LastName VARCHAR(250),
@RoleId INT,
@Ov_Message_Error VARCHAR(250) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [dbo].Users(Email, [Password], Firstname, LastName, RoleId)
			VALUES (@Email, PWDENCRYPT(@Password), @FirstName, @LastName, @RoleId)
		COMMIT TRAN

		SET @Ov_Message_Error = 'OK'

		SELECT U.Email, U.FirstName, U.LastName, U.RoleId 
		FROM [dbo].Users U
		WHERE [Email] = @Email
		AND PWDCOMPARE(@Password, [Password]) = 1

	END TRY
	BEGIN CATCH
		SELECT @Ov_Message_Error = 'Error en el Procedimiento: ' + ERROR_PROCEDURE() + ', Mensaje: ' + ERROR_MESSAGE() + 'En la línea: ' + CONVERT(VARCHAR(20), ERROR_LINE())
		ROLLBACK TRAN
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteUser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_DeleteUser]
(@Id INT)
AS
BEGIN
	DELETE Users WHERE UserId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GenerateCollectionAction]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_GenerateCollectionAction]
AS
BEGIN
	DECLARE @ContClient INT
	DECLARE @ContActionPlan INT
	DECLARE @ClienteId INT
	DECLARE @StretchId INT
	DECLARE @ActionId INT
	DECLARE @ClientTemp TABLE (Nro INT, ClientId INT, UserId INT)
	DECLARE @ActionPlanTemp TABLE (Nro INT, StretchId INT, ActionId INT, [State] INT)
	INSERT INTO @ClientTemp SELECT ROW_NUMBER() OVER(ORDER BY C.ClientId)  AS Nro, C.ClientId, C.UserId FROM Client C
	SET @ContClient = 1
	WHILE (@ContClient <= (SELECT COUNT(1) FROM Client))
	BEGIN
		SET @ClienteId = (SELECT ClientId FROM @ClientTemp WHERE Nro = @ContClient)
		--SELECT @ClienteId
		SET @StretchId = (SELECT S.StretchId FROM Client C 
		INNER JOIN (SELECT StretchId, StartDay, EndDay, [State] FROM Stretch WHERE [State]=1 )S 
		ON (DATEDIFF(DAY, EXPIRATIONDATE, GETDATE()) + 1) BETWEEN S.StartDay AND S.EndDay 
		WHERE S.[State] = 1 AND C.ClientId = @ClienteId)
		
		DELETE @ActionPlanTemp
		INSERT INTO @ActionPlanTemp 
		SELECT ROW_NUMBER() OVER(ORDER BY A.StretchId, A.ActionId) AS Nro, A.StretchId, A.ActionId, A.[State] 
		FROM ActionPlan A
		WHERE A.StretchId = @StretchId

		SET @ContActionPlan = 1
		WHILE (@ContActionPlan <= (SELECT COUNT(1) FROM @ActionPlanTemp))
		BEGIN
			SET @ActionId = (SELECT ActionId FROM @ActionPlanTemp WHERE Nro = @ContActionPlan)
			INSERT INTO CollectionManagement VALUES (@ClienteId, @StretchId, @ActionId, NULL,NULL,GETDATE(),1)
			SET @ContActionPlan = @ContActionPlan + 1
		END
		SET @ContClient = @ContClient + 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCollectionManagementAction]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetCollectionManagementAction](@UserId INT)
AS
BEGIN
	SELECT 
	CASE
		WHEN LEN(C.Dni) = 0 THEN C.Ruc
		ELSE C.Dni
	END AS 'Documento',
	CONCAT(C.Name, ' ', C.LastName) AS 'Nombre',
	C.Amount AS 'Cuenta',
	C.Debt AS 'Monto',
	C.ExpirationDate AS 'Vencimiento',
	(DATEDIFF(DAY, C.ExpirationDate, GETDATE()) + 1) AS 'Mora',
	S.StrechName AS 'Tramo',
	A.ActionName AS 'Accion',
	M.ActionStateId AS 'Estado'
	FROM CollectionManagement M
	INNER JOIN Client C ON M.ClientId = C.ClientId
	INNER JOIN Actions A ON M.ActionId = A.ActionId
	INNER JOIN Stretch S ON M.StretchId = S.StretchId
	WHERE C.[State] = 1
	AND A.[State] = 1
	AND S.[State] = 1
	AND C.UserId = @UserId
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetUser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetUser]
(@Id INT)
AS
BEGIN
	SELECT UserId, Email, FirstName, LastName, RoleId FROM Users WHERE UserId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ListUser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ListUser]
AS
BEGIN
	SELECT UserId, Email, FirstName, LastName, RoleId FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateUser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateUser]
(@Id INT, @RoleId INT)
AS
BEGIN
	UPDATE Users SET RoleId = @RoleId WHERE UserId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ValidateUser]    Script Date: 7/11/2020 13:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_ValidateUser](@Email VARCHAR(100), @Password VARCHAR(20))
AS
BEGIN
	SELECT UserId, Email, FirstName, LastName, RoleId 
	FROM Users
	WHERE Email = @Email
	AND PWDCOMPARE(@Password, [Password]) = 1
END

GO
USE [master]
GO
ALTER DATABASE [DBCollection] SET  READ_WRITE 
GO
