USE [master]
GO
/****** Object:  Database [dbPortal]    Script Date: 02/10/2024 02:46:55 ******/
CREATE DATABASE [dbPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbPortal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbPortal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbPortal] SET  MULTI_USER 
GO
ALTER DATABASE [dbPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbPortal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbPortal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbPortal] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbPortal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbPortal]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[position] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[isActive] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[createdAt] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[employee] ON 
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (1, N'jose', N'xZcxZCzxcdasdasdasdasdasdasdasdasd', N'jose', 0, CAST(N'2024-10-01T18:28:39.247' AS DateTime), CAST(N'2024-10-02T01:57:44.907' AS DateTime))
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (2, N'cesar', N'jefe', N'jose', 0, CAST(N'2024-10-01T18:30:04.667' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (3, N'cesar2', N'cesar2', N'scesar2ring', 0, CAST(N'2024-10-01T19:20:25.177' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (4, N'nmmm', N'nmmm', N'nmmm', 0, CAST(N'2024-10-01T23:01:39.657' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (5, N'nmmm', N'nmmm', N'nmmm', 0, CAST(N'2024-10-01T23:01:41.180' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (6, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:41.570' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (7, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:41.947' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (8, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:42.220' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (9, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:42.527' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (10, N'nmmm', N'nmmm', N'nmmm', 0, CAST(N'2024-10-01T23:01:42.840' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (11, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:43.117' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (12, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:43.510' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (13, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:43.777' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (14, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:44.117' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (15, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:44.400' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (16, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:44.740' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (17, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:45.090' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (18, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:45.390' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (19, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:45.727' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (20, N'nmmm', N'nmmm', N'nmmm', 1, CAST(N'2024-10-01T23:01:46.057' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (21, N'aasa', N'aasasas', N'asasa', 1, CAST(N'2024-10-02T00:13:23.720' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (22, N'dasdas', N'dasdasdas', N'dasdas', 1, CAST(N'2024-10-02T00:14:15.950' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (23, N'dasdas', N'asdasda', N'dasdasd', 1, CAST(N'2024-10-02T00:14:43.320' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (24, N'dasdasd', N'dasdasdasdadaas', N'asdasdasd', 1, CAST(N'2024-10-02T00:43:40.920' AS DateTime), NULL)
GO
INSERT [dbo].[employee] ([id], [name], [position], [description], [isActive], [createdAt], [updatedAt]) VALUES (25, N'sdasdasd', N'asdasdasdasdasd', N'dasdasd', 1, CAST(N'2024-10-02T01:57:29.893' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (1, N'cesar', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-10-01T20:22:48.880' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (2, N'string', N'473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8', CAST(N'2024-10-01T22:15:41.873' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (3, N'jose', N'cad4742cc1a4473b4a71db10d9fcf69f5b7b528fbf6f41431aa593af6d867cf7', CAST(N'2024-10-01T22:16:26.177' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (4, N'manuel', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-10-01T22:21:15.460' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (5, N'dasdasda', N'19c451aedfb24c338a9a2a5c31d553ed77e7cdefc655035f390176ac24066051', CAST(N'2024-10-01T22:22:22.337' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (6, N'jjjjjj', N'e57d5ceb60efd89f643650b60a3b0e460f0879d2c7ecbcbd52f84a0465265421', CAST(N'2024-10-01T22:32:24.680' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (7, N'asdasdasdasd', N'66b1132a0173910b01ee3a15ef4e69583bbf2f7f1e4462c99efbe1b9ab5bf808', CAST(N'2024-10-01T23:24:09.957' AS DateTime))
GO
INSERT [dbo].[users] ([id], [userName], [password], [createdAt]) VALUES (8, N'sdfsdfsdfsdfsd', N'cf585cda7f3796e6691713b9dd9476a47ed62367b1b5282b117afd82fcd146d3', CAST(N'2024-10-01T23:26:58.700' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_user_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateEmployee]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CreateEmployee]
    @name NVARCHAR(100),
    @position NVARCHAR(100),
    @description NVARCHAR(MAX),
    @isActive BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
         INSERT INTO employee (name, position, description, isActive, createdAt)
        VALUES (@name, @position, @description, @isActive, GETDATE());

        SELECT SCOPE_IDENTITY() AS NewEmployeeId; 
    END TRY
    BEGIN CATCH
        SELECT -1 AS NewEmployeeId;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateUser]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CreateUser]
    @userName NVARCHAR(100),
    @password NVARCHAR(256)
AS
BEGIN
    SET NOCOUNT ON;

  
    INSERT INTO dbo.users (userName, password)
    VALUES (@userName, @password);

    SELECT SCOPE_IDENTITY() AS NewUserId;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteEmployee]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteEmployee]
    @id INT
AS
BEGIN
    UPDATE employee
    SET isActive = 0 
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllEmployees]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllEmployees]
    @page INT,
    @rowsPerPage INT,
    @name NVARCHAR(100) = NULL, -- Parámetro de búsqueda para el nombre
    @position NVARCHAR(100) = NULL -- Parámetro de búsqueda para la posición
AS
BEGIN
    DECLARE @offset INT;
    SET @offset = (@page - 1) * @rowsPerPage;

    -- Aplicar la lógica de filtrado
    SELECT id, name, position, description, isActive
    FROM employee
    WHERE (@name IS NULL OR name LIKE '%' + @name + '%')
      AND (@position IS NULL OR position LIKE '%' + @position + '%')
    ORDER BY id
    OFFSET @offset ROWS FETCH NEXT @rowsPerPage ROWS ONLY;

    -- Devolver el recuento total con los filtros aplicados
    SELECT COUNT(*) AS TotalRecords
    FROM employee
    WHERE (@name IS NULL OR name LIKE '%' + @name + '%')
      AND (@position IS NULL OR position LIKE '%' + @position + '%');
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeById]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetEmployeeById]
    @id INT
AS
BEGIN
    SELECT id, name, position, description, isActive
    FROM employee
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_Login]
    @userName NVARCHAR(100),
    @password NVARCHAR(256)
AS
BEGIN
    SET NOCOUNT ON;

  
    SELECT Id, UserName, Password
    FROM dbo.users
    WHERE UserName = @userName AND Password = @password;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateEmployee]    Script Date: 02/10/2024 02:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_UpdateEmployee]
    @id INT,
    @name NVARCHAR(100),
    @position NVARCHAR(100),
    @description NVARCHAR(MAX),
     @isActive BIT
AS
BEGIN
     UPDATE employee
        SET 
            name = @name,
            position = @position,
            description = @description,
            isActive = @isActive,
            updatedAt = GETDATE()
        WHERE id = @id;
END;
GO
USE [master]
GO
ALTER DATABASE [dbPortal] SET  READ_WRITE 
GO
