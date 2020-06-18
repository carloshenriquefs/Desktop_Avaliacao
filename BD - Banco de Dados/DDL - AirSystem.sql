/****** Object:  Database [AirSystem]    Script Date: 17/06/2020 08:37:32 ******/
CREATE DATABASE [AirSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AirSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [AirSystem] SET  MULTI_USER 
GO
ALTER DATABASE [AirSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirSystem', N'ON'
GO
ALTER DATABASE [AirSystem] SET QUERY_STORE = OFF
GO
USE [AirSystem]
GO
/****** Object:  Table [dbo].[Acesso]    Script Date: 17/06/2020 08:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acesso](
	[id] [int] NOT NULL,
	[id_Usuario] [int] NULL,
	[Dt_AcessoEntrada] [datetime] NULL,
	[Dt_AcessoSaida] [datetime] NULL,
 CONSTRAINT [PK_Acesso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/06/2020 08:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tx_Nome] [varchar](200) NOT NULL,
	[Tx_Sobrenome] [varchar](200) NOT NULL,
	[Tx_Logradouro] [varchar](100) NULL,
	[Nr_Casa] [int] NULL,
	[Dt_Nascimento] [date] NOT NULL,
	[Tx_Usuario] [varchar](100) NOT NULL,
	[Tx_Senha] [varchar](200) NOT NULL,
	[Tx_CaminhoFoto] [varchar](250) NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Acesso]  WITH CHECK ADD  CONSTRAINT [FK_Acesso_Usuarios] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Acesso] CHECK CONSTRAINT [FK_Acesso_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [AirSystem] SET  READ_WRITE 
GO