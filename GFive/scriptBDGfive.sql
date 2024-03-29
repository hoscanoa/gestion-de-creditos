USE [master]
GO
/****** Object:  Database [BDGFive]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BDGFive')
BEGIN
CREATE DATABASE [BDGFive] ON  PRIMARY 
( NAME = N'BDGFive', FILENAME = N'C:\Archivos de programa\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\BDGFive.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDGFive_log', FILENAME = N'C:\Archivos de programa\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\BDGFive_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Modern_Spanish_CI_AS
END
GO
ALTER DATABASE [BDGFive] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDGFive].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDGFive] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BDGFive] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BDGFive] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BDGFive] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BDGFive] SET ARITHABORT OFF
GO
ALTER DATABASE [BDGFive] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BDGFive] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BDGFive] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BDGFive] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BDGFive] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BDGFive] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BDGFive] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BDGFive] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BDGFive] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BDGFive] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BDGFive] SET  DISABLE_BROKER
GO
ALTER DATABASE [BDGFive] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BDGFive] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BDGFive] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BDGFive] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BDGFive] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BDGFive] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BDGFive] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BDGFive] SET  READ_WRITE
GO
ALTER DATABASE [BDGFive] SET RECOVERY FULL
GO
ALTER DATABASE [BDGFive] SET  MULTI_USER
GO
ALTER DATABASE [BDGFive] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BDGFive] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDGFive', N'ON'
GO
ALTER DATABASE [BDGFive] SET CHANGE_TRACKING = OFF
GO
USE [BDGFive]
GO
/****** Object:  StoredProcedure [dbo].[usp_comprobarUsuario]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_comprobarUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_comprobarUsuario]
GO
/****** Object:  StoredProcedure [dbo].[usp_modulo_selXid]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_modulo_selXid]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_modulo_selXid]
GO
/****** Object:  StoredProcedure [dbo].[usp_opcion_selXModuloXSubModulo]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_opcion_selXModuloXSubModulo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_opcion_selXModuloXSubModulo]
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoDetalle_add]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoDetalle_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_pedidoDetalle_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoEncabezado_add]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoEncabezado_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_pedidoEncabezado_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoEncabezado_sel]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoEncabezado_sel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_pedidoEncabezado_sel]
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoEncabezado_situacion]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoEncabezado_situacion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_pedidoEncabezado_situacion]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_add]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_del]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_del]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_del]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_edit]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_edit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_edit]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_find]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_find]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_find]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_get]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_get]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_sel]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_sel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_sel]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_stock]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_stock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_producto_stock]
GO
/****** Object:  StoredProcedure [dbo].[usp_subModulo_selXModulo]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_subModulo_selXModulo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_subModulo_selXModulo]
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_add]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_cliente_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_del]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_del]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_cliente_del]
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_edit]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_edit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_cliente_edit]
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_find]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_find]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_cliente_find]
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_get]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_cliente_get]
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_sel]    Script Date: 04/13/2012 01:42:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_sel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_cliente_sel]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_nroIntentos]    Script Date: 04/13/2012 01:42:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_nroIntentos]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[udf_nroIntentos]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Descripcion]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Descripcion' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Descripcion]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Estado]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Estado' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Estado]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Identificador]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Identificador' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Identificador]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Importe]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Importe' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Importe]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Numerico]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Numerico' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Numerico]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Usuario]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Usuario' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Usuario]
GO
/****** Object:  Table [dbo].[Tcliente]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tcliente]') AND type in (N'U'))
DROP TABLE [dbo].[Tcliente]
GO
/****** Object:  Table [dbo].[Tmodulo]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tmodulo]') AND type in (N'U'))
DROP TABLE [dbo].[Tmodulo]
GO
/****** Object:  Table [dbo].[Topcion]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Topcion]') AND type in (N'U'))
DROP TABLE [dbo].[Topcion]
GO
/****** Object:  Table [dbo].[Tparametro]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tparametro]') AND type in (N'U'))
DROP TABLE [dbo].[Tparametro]
GO
/****** Object:  Table [dbo].[TpedidoDetalle]    Script Date: 04/13/2012 01:42:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TpedidoDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[TpedidoDetalle]
GO
/****** Object:  Table [dbo].[TpedidoEncabezado]    Script Date: 04/13/2012 01:42:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TpedidoEncabezado]') AND type in (N'U'))
DROP TABLE [dbo].[TpedidoEncabezado]
GO
/****** Object:  Table [dbo].[TperfilOpciones]    Script Date: 04/13/2012 01:42:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TperfilOpciones]') AND type in (N'U'))
DROP TABLE [dbo].[TperfilOpciones]
GO
/****** Object:  Table [dbo].[TperfilUsuario]    Script Date: 04/13/2012 01:42:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TperfilUsuario]') AND type in (N'U'))
DROP TABLE [dbo].[TperfilUsuario]
GO
/****** Object:  Table [dbo].[Tproducto]    Script Date: 04/13/2012 01:42:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tproducto]') AND type in (N'U'))
DROP TABLE [dbo].[Tproducto]
GO
/****** Object:  Table [dbo].[TsubModulo]    Script Date: 04/13/2012 01:42:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TsubModulo]') AND type in (N'U'))
DROP TABLE [dbo].[TsubModulo]
GO
/****** Object:  Table [dbo].[Tusuario]    Script Date: 04/13/2012 01:42:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tusuario]') AND type in (N'U'))
DROP TABLE [dbo].[Tusuario]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Email]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Email' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Email]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Fecha]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Fecha' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Fecha]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Fecha8]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Fecha8' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Fecha8]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_NumericoCorto]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_NumericoCorto' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_NumericoCorto]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Observacion]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Observacion' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Observacion]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Peso]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Peso' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Peso]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Telefono]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Telefono' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Telefono]
GO
/****** Object:  User [gf]    Script Date: 04/13/2012 01:42:21 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gf')
DROP USER [gf]
GO
/****** Object:  User [gf]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gf')
CREATE USER [gf] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Telefono]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Telefono' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Telefono] FROM [varchar](11) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Peso]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Peso' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Peso] FROM [decimal](8, 2) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Observacion]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Observacion' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Observacion] FROM [text] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_NumericoCorto]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_NumericoCorto' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_NumericoCorto] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Fecha8]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Fecha8' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Fecha8] FROM [char](8) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Fecha]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Fecha' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Fecha] FROM [char](10) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Email]    Script Date: 04/13/2012 01:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Email' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Email] FROM [varchar](40) NOT NULL
GO
/****** Object:  Table [dbo].[Tusuario]    Script Date: 04/13/2012 01:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tusuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tusuario](
	[idPersonal] [int] NOT NULL,
	[idPerfilUsuario] [int] NULL,
	[usuario] [varchar](55) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[contraseña] [varchar](55) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[intentos] [smallint] NULL,
	[idTpoDcmto] [int] NULL,
	[nroDcmto] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[nombre] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[apePaterno] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[apeMaterno] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[descripcion] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[areaTrabajo] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[telefonoFijo] [varchar](11) COLLATE Modern_Spanish_CI_AS NULL,
	[telefonoCelular] [varchar](11) COLLATE Modern_Spanish_CI_AS NULL,
	[email] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[fchRegistro] [char](10) COLLATE Modern_Spanish_CI_AS NULL,
	[fchCaducacion] [char](10) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[idUsuario] [int] NOT NULL
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Tusuario] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Tusuario] ([idPersonal], [idPerfilUsuario], [usuario], [contraseña], [intentos], [idTpoDcmto], [nroDcmto], [nombre], [apePaterno], [apeMaterno], [descripcion], [areaTrabajo], [telefonoFijo], [telefonoCelular], [email], [fchRegistro], [fchCaducacion], [estado], [idUsuario]) VALUES (1, 1, N'JULIO', N'JULIO', 0, 1, N'85785262', N'JULIO', N'HUAMANCAMA', N'RAMOS', N'', N'', N'', N'', N'', N'01/01/2010', N'01/01/2011', N'1', 1)
INSERT [dbo].[Tusuario] ([idPersonal], [idPerfilUsuario], [usuario], [contraseña], [intentos], [idTpoDcmto], [nroDcmto], [nombre], [apePaterno], [apeMaterno], [descripcion], [areaTrabajo], [telefonoFijo], [telefonoCelular], [email], [fchRegistro], [fchCaducacion], [estado], [idUsuario]) VALUES (2, 1, N'CESAR', N'CESAR', 3, 1, N'45786235', N'CESAR', N'YENQUE', N'YENQUE', N'', N'', N'', N'', N'', N'01/01/2010', N'01/01/2011', N'1', 1)
/****** Object:  Table [dbo].[TsubModulo]    Script Date: 04/13/2012 01:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TsubModulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TsubModulo](
	[idModulo] [int] NOT NULL,
	[idSubModulo] [int] NOT NULL,
	[descSubModulo] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[direccionUrl] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TsubModulo] PRIMARY KEY CLUSTERED 
(
	[idModulo] ASC,
	[idSubModulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[TsubModulo] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TsubModulo] ([idModulo], [idSubModulo], [descSubModulo], [direccionUrl], [estado]) VALUES (1, 1, N'Tablas', N'', N'1')
INSERT [dbo].[TsubModulo] ([idModulo], [idSubModulo], [descSubModulo], [direccionUrl], [estado]) VALUES (1, 2, N'Procesos', N'', N'1')
INSERT [dbo].[TsubModulo] ([idModulo], [idSubModulo], [descSubModulo], [direccionUrl], [estado]) VALUES (1, 3, N'Reportes', N'', N'1')
/****** Object:  Table [dbo].[Tproducto]    Script Date: 04/13/2012 01:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tproducto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tproducto](
	[pro_Id] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[pro_descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[pro_costo] [decimal](10, 2) NULL,
	[pro_stock] [int] NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Tproducto] PRIMARY KEY CLUSTERED 
(
	[pro_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Tproducto] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Tproducto] ([pro_Id], [pro_descripcion], [pro_costo], [pro_stock], [estado], [idUsuario]) VALUES (N'AAAA', N'PRODCUTO A', CAST(10.20 AS Decimal(10, 2)), 0, N'1', 2)
INSERT [dbo].[Tproducto] ([pro_Id], [pro_descripcion], [pro_costo], [pro_stock], [estado], [idUsuario]) VALUES (N'BBBB', N'PRODUCTO B', CAST(15.62 AS Decimal(10, 2)), 10, N'1', 2)
INSERT [dbo].[Tproducto] ([pro_Id], [pro_descripcion], [pro_costo], [pro_stock], [estado], [idUsuario]) VALUES (N'CCCC', N'PRODUCTO C', CAST(18.90 AS Decimal(10, 2)), 5, N'1', 2)
INSERT [dbo].[Tproducto] ([pro_Id], [pro_descripcion], [pro_costo], [pro_stock], [estado], [idUsuario]) VALUES (N'DDDD', N'PRODUCTO D', CAST(15.24 AS Decimal(10, 2)), 15, N'1', 2)
/****** Object:  Table [dbo].[TperfilUsuario]    Script Date: 04/13/2012 01:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TperfilUsuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TperfilUsuario](
	[idPerfilUsuario] [int] NOT NULL,
	[descPerfilUsuario] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_TperfilUsuario] PRIMARY KEY CLUSTERED 
(
	[idPerfilUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[TperfilUsuario] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TperfilUsuario] ([idPerfilUsuario], [descPerfilUsuario], [estado], [idUsuario]) VALUES (1, N'FULL', N'1', 1)
INSERT [dbo].[TperfilUsuario] ([idPerfilUsuario], [descPerfilUsuario], [estado], [idUsuario]) VALUES (2, N'ADMIN', N'1', 1)
INSERT [dbo].[TperfilUsuario] ([idPerfilUsuario], [descPerfilUsuario], [estado], [idUsuario]) VALUES (3, N'CONSULTOR', N'1', 1)
INSERT [dbo].[TperfilUsuario] ([idPerfilUsuario], [descPerfilUsuario], [estado], [idUsuario]) VALUES (4, N'VENDEDOR', N'1', 1)
/****** Object:  Table [dbo].[TperfilOpciones]    Script Date: 04/13/2012 01:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TperfilOpciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TperfilOpciones](
	[idPerfil] [int] NULL,
	[idModulo] [int] NULL,
	[idSubModulo] [int] NULL,
	[idOpcion] [int] NULL,
	[seleccionar] [int] NULL,
	[añadir] [int] NULL,
	[editar] [int] NULL,
	[eliminar] [int] NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idUsuario] [int] NULL
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[TperfilOpciones] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 2, 1, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 3, 1, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 4, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 5, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 6, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 7, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 8, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 1, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 2, 1, 0, 0, 0, N'1', 1)
INSERT [dbo].[TperfilOpciones] ([idPerfil], [idModulo], [idSubModulo], [idOpcion], [seleccionar], [añadir], [editar], [eliminar], [estado], [idUsuario]) VALUES (1, 1, 1, 3, 1, 0, 0, 0, N'1', 1)
/****** Object:  Table [dbo].[TpedidoEncabezado]    Script Date: 04/13/2012 01:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TpedidoEncabezado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TpedidoEncabezado](
	[ped_Id] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[ped_cli_ruc] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ped_fecha] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ped_total] [decimal](10, 2) NULL,
	[situacion] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idUsuario] [int] NULL
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[TpedidoEncabezado] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TpedidoEncabezado] ([ped_Id], [ped_cli_ruc], [ped_fecha], [ped_total], [situacion], [estado], [idUsuario]) VALUES (N'001-10', N'12345678901', N'21/03/2012', CAST(10000.00 AS Decimal(10, 2)), N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoEncabezado] ([ped_Id], [ped_cli_ruc], [ped_fecha], [ped_total], [situacion], [estado], [idUsuario]) VALUES (N'001-11', N'20202020205', N'22/03/2012', CAST(2300.00 AS Decimal(10, 2)), N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoEncabezado] ([ped_Id], [ped_cli_ruc], [ped_fecha], [ped_total], [situacion], [estado], [idUsuario]) VALUES (N'001-13', N'10203040501', N'27/03/2012', CAST(102.00 AS Decimal(10, 2)), N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoEncabezado] ([ped_Id], [ped_cli_ruc], [ped_fecha], [ped_total], [situacion], [estado], [idUsuario]) VALUES (N'001-12', N'10203040501', N'27/03/2012', CAST(178.00 AS Decimal(10, 2)), N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoEncabezado] ([ped_Id], [ped_cli_ruc], [ped_fecha], [ped_total], [situacion], [estado], [idUsuario]) VALUES (N'001-154', N'12312312310', N'12/04/2012', CAST(52.00 AS Decimal(10, 2)), N'PENDIENTE', N'1', 2)
/****** Object:  Table [dbo].[TpedidoDetalle]    Script Date: 04/13/2012 01:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TpedidoDetalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TpedidoDetalle](
	[ped_id] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[ped_cli_ruc] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ped_pro_id] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[ped_precio] [decimal](10, 2) NULL,
	[ped_cantidad] [int] NULL,
	[situacion] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idUsuario] [int] NULL
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[TpedidoDetalle] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-10', N'12345678901', N'AAAA', CAST(15.23 AS Decimal(10, 2)), 10, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-10', N'12345678901', N'BBBB', CAST(13.25 AS Decimal(10, 2)), 5, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-11', N'20202020205', N'AAAA', CAST(15.23 AS Decimal(10, 2)), 4, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-12', N'10203040501', N'DDDD', CAST(10.25 AS Decimal(10, 2)), 10, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-12', N'10203040501', N'BBBB', CAST(15.00 AS Decimal(10, 2)), 5, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-13', N'10203040501', N'BBBB', CAST(10.25 AS Decimal(10, 2)), 5, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-154', N'12312312310', N'BBBB', CAST(10.36 AS Decimal(10, 2)), 5, N'PENDIENTE', N'1', 2)
INSERT [dbo].[TpedidoDetalle] ([ped_id], [ped_cli_ruc], [ped_pro_id], [ped_precio], [ped_cantidad], [situacion], [estado], [idUsuario]) VALUES (N'001-13', N'10203040501', N'DDDD', CAST(10.25 AS Decimal(10, 2)), 5, N'PENDIENTE', N'1', 2)
/****** Object:  Table [dbo].[Tparametro]    Script Date: 04/13/2012 01:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tparametro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tparametro](
	[idParametro] [int] NOT NULL,
	[descParametro] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[valor] [decimal](15, 2) NULL,
	[comentario] [text] COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Tparametro] PRIMARY KEY CLUSTERED 
(
	[idParametro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Tparametro] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Tparametro] ([idParametro], [descParametro], [valor], [comentario]) VALUES (1, N'Intentos', CAST(3.00 AS Decimal(15, 2)), N'El maximo de número de intentos para logearse al sistema.')
INSERT [dbo].[Tparametro] ([idParametro], [descParametro], [valor], [comentario]) VALUES (2, N'ColsXFilas', CAST(5.00 AS Decimal(15, 2)), N'Es la cantidad de columnas por fila que se va a mostrar en la consulta de stock.')
/****** Object:  Table [dbo].[Topcion]    Script Date: 04/13/2012 01:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Topcion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Topcion](
	[idModulo] [int] NOT NULL,
	[idSubModulo] [int] NOT NULL,
	[idOpcion] [int] NOT NULL,
	[descOpcion] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[direccionUrl] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[observacion] [text] COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Topcion] PRIMARY KEY CLUSTERED 
(
	[idModulo] ASC,
	[idSubModulo] ASC,
	[idOpcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Topcion] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Topcion] ([idModulo], [idSubModulo], [idOpcion], [descOpcion], [direccionUrl], [observacion], [estado], [idUsuario]) VALUES (1, 1, 1, N'Clientes', N'~/tablas/cliente.aspx', NULL, N'1', 1)
INSERT [dbo].[Topcion] ([idModulo], [idSubModulo], [idOpcion], [descOpcion], [direccionUrl], [observacion], [estado], [idUsuario]) VALUES (1, 1, 2, N'Producto', N'~/tablas/producto.aspx', NULL, N'1', 1)
INSERT [dbo].[Topcion] ([idModulo], [idSubModulo], [idOpcion], [descOpcion], [direccionUrl], [observacion], [estado], [idUsuario]) VALUES (1, 2, 1, N'Pedidos', N'~/procesos/pedido.aspx', NULL, N'1', 1)
/****** Object:  Table [dbo].[Tmodulo]    Script Date: 04/13/2012 01:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tmodulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tmodulo](
	[idModulo] [int] NOT NULL,
	[descModulo] [varchar](55) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Tmodulo] PRIMARY KEY CLUSTERED 
(
	[idModulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Tmodulo] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Tmodulo] ([idModulo], [descModulo], [estado], [idUsuario]) VALUES (1, N'GFIVE', N'1', 31)
/****** Object:  Table [dbo].[Tcliente]    Script Date: 04/13/2012 01:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tcliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tcliente](
	[Cli_Ruc] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Cli_RazonSocial] [varchar](250) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Cli_Direccion] [varchar](250) COLLATE Modern_Spanish_CI_AS NULL,
	[estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cli_Ruc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Tcliente] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'10203040501', N'CLIENTE DE PRUEBA', N'DIRECCION DE PRUEBA', N'1', 2)
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'11111111111', N'PROBANDO OTRO CLIENTE', N'NOSE CUADRA S.N', N'1', 2)
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'12312312310', N'CESAR YENQUE', N'', N'1', 2)
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'12345678901', N'NOSE', N'', N'1', 2)
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'12345678980', N'CESAR', N'NO SE ', N'1', 2)
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'20202020205', N'JORGE RODRIGUEZ', N'LA FONTANA', N'1', 2)
INSERT [dbo].[Tcliente] ([Cli_Ruc], [Cli_RazonSocial], [Cli_Direccion], [estado], [idUsuario]) VALUES (N'5556667778', N'CESAR ARTURO', N'CESAR', N'1', 2)
/****** Object:  UserDefinedDataType [dbo].[udt_Usuario]    Script Date: 04/13/2012 01:42:23 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Usuario' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Usuario] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Numerico]    Script Date: 04/13/2012 01:42:23 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Numerico' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Numerico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Importe]    Script Date: 04/13/2012 01:42:23 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Importe' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Importe] FROM [decimal](15, 2) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Identificador]    Script Date: 04/13/2012 01:42:23 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Identificador' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Identificador] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Estado]    Script Date: 04/13/2012 01:42:23 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Estado' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Estado] FROM [char](1) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[udt_Descripcion]    Script Date: 04/13/2012 01:42:23 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Descripcion' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_Descripcion] FROM [varchar](55) NOT NULL
GO
/****** Object:  UserDefinedFunction [dbo].[udf_nroIntentos]    Script Date: 04/13/2012 01:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_nroIntentos]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[udf_nroIntentos]
(
	@idParametro udt_Identificador
)
RETURNS udt_Importe
	AS
BEGIN
	DECLARE	@nro udt_Importe

	SELECT	@nro		= valor 
	FROM	Tparametro 
	WHERE	idParametro = @idParametro

	RETURN	@nro
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_sel]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_sel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ====================================================================================
-- AUTOR CREA.	: CESAR YENQUE LEON.
-- FECHA CREA.	: 06/03/2012
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
-- EXECUTE		: usp_cliente_sel
-- ====================================================================================
CREATE PROCEDURE [dbo].[usp_cliente_sel]
AS
SET NOCOUNT ON;

BEGIN
	SELECT		Cli_Ruc,
	            Cli_RazonSocial,
				Cli_Direccion,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tcliente
	WHERE		estado=1
	ORDER BY	Cli_Ruc
END





' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_get]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_cliente_get]
	@cli_ruc udt_Descripcion
AS
SET NOCOUNT ON;

BEGIN
	SELECT		Cli_Ruc,
	            Cli_RazonSocial,
				Cli_Direccion,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tcliente
	WHERE		cli_ruc = @cli_ruc and estado=1
	ORDER BY	Cli_Ruc
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_find]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_find]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ====================================================================================
-- AUTOR CREA.	: CESAR YENQUE LEON.
-- FECHA CREA.	: 06/03/2012
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
-- EXECUTE		: usp_cliente_fing
-- ====================================================================================
CREATE PROCEDURE [dbo].[usp_cliente_find]
	@cli_razonSocial    udt_Descripcion
AS
SET NOCOUNT ON;
BEGIN
	SELECT		Cli_Ruc,
	            Cli_RazonSocial,
				Cli_Direccion,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tcliente
	WHERE		Cli_RazonSocial like ''%'' + @cli_razonSocial + ''%'' AND estado=1
	ORDER BY	Cli_Ruc		
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_edit]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_edit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ====================================================================================
-- AUTOR CREA.	: CESAR YENQUE LEON.
-- FECHA CREA.	: 06/03/2012
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
-- EXECUTE		: usp_cliente_edit
-- ====================================================================================
CREATE PROCEDURE [dbo].[usp_cliente_edit] 
    @cli_Ruc				udt_Descripcion,
	@cli_RazonSocial		udt_Descripcion,
	@cli_Direccion			udt_Descripcion,
	@estado					udt_Estado,
	@idUsuario				udt_Usuario
AS
DECLARE @resultado	udt_Numerico

IF EXISTS(SELECT Cli_RazonSocial FROM Tcliente WHERE Cli_RazonSocial like @cli_RazonSocial AND estado = 1)
	BEGIN
		UPDATE Tcliente
		SET 
			Cli_Direccion = @cli_Direccion,
			idUsuario=@idUsuario
		WHERE Cli_Ruc=@cli_ruc
		RETURN 2
	END
ELSE
	BEGIN
		UPDATE Tcliente
		SET 
			Cli_RazonSocial = @cli_RazonSocial, 
			Cli_Direccion = @cli_Direccion,
			idUsuario=@idUsuario
		WHERE Cli_Ruc=@cli_Ruc 
		RETURN 1
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_del]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ====================================================================================
-- AUTOR CREA.	: CESAR YENQUE LEON.
-- FECHA CREA.	: 06/03/2012
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
-- EXECUTE		: usp_cliente_del
-- ====================================================================================
CREATE PROCEDURE [dbo].[usp_cliente_del]
	@cli_ruc		udt_descripcion,
    @idUsuario		udt_Usuario
	AS
SET NOCOUNT ON;

BEGIN
	UPDATE	Tcliente
	SET		estado		= 0,
			idUsuario	= @idUsuario	
	WHERE	Cli_Ruc 	= @cli_ruc 
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente_add]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_cliente_add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ====================================================================================
-- AUTOR CREA.	: CESAR YENQUE LEON.
-- FECHA CREA.	: 06/03/2012
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
-- EXECUTE		: usp_cliente_add
-- ====================================================================================

CREATE PROCEDURE [dbo].[usp_cliente_add] 
    @cli_Ruc				udt_Descripcion,
	@cli_RazonSocial		udt_Descripcion,
	@cli_Direccion			udt_Descripcion,
	@estado					udt_Estado,
	@idUsuario				udt_Usuario
AS
DECLARE @resultado	udt_Numerico

IF EXISTS(SELECT Cli_RazonSocial FROM Tcliente WHERE Cli_RazonSocial like @cli_RazonSocial AND estado = 1)
	BEGIN
		SET	@resultado = 2
	END
ELSE
	BEGIN
		SET	@resultado = 1
	END
	
IF @resultado=1
	BEGIN
		INSERT INTO Tcliente (
		    Cli_Ruc,
			Cli_RazonSocial,
			Cli_Direccion,
			estado,
			idUsuario
		)
		VALUES (
		    @cli_Ruc,
			@cli_RazonSocial,
			@cli_Direccion,
			@estado,
			@idUsuario
		)		
		RETURN @resultado
	END
ELSE
	BEGIN
		RETURN @Resultado
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_subModulo_selXModulo]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_subModulo_selXModulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =====================================================================================
-- AUTOR CREA.	: JULIO HUAMANACAMA R.
-- FECHA CREA.	: 23/11/2010
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
				
-- EXECUTE usp_subModulo_selXModulo 1, 4
-- =====================================================================================
CREATE PROCEDURE [dbo].[usp_subModulo_selXModulo]
	@idModulo	udt_Identificador,
	@idPerfil	udt_Identificador
	AS
SET NOCOUNT ON;
	
BEGIN
	SELECT		idModulo, idSubModulo, descSubModulo, ISNULL(direccionUrl,'''') direccionUrl
	FROM		Tsubmodulo	m
	WHERE		idModulo	= @idModulo	AND
				idSubModulo	IN (SELECT	DISTINCT idSubModulo 
								FROM	TperfilOpciones 
								WHERE	idPerfil	= @idPerfil	AND
										idModulo	= @idModulo) AND
				m.estado		= 1
	ORDER BY	idSubModulo
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_stock]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_stock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_producto_stock]
	@pro_id				udt_Descripcion
AS
SET NOCOUNT ON;
BEGIN
	SELECT		pro_Id,
	            pro_descripcion,
				pro_costo,
				pro_stock,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tproducto
	WHERE		pro_id = @pro_id and estado=1
	ORDER BY	pro_Id
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_sel]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_sel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_producto_sel]
AS
SET NOCOUNT ON;

BEGIN
	SELECT		pro_Id,
	            pro_descripcion,
				pro_costo,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tproducto
	WHERE		estado=1
	ORDER BY	pro_Id
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_get]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_producto_get]
	@pro_id		udt_descripcion
AS
SET NOCOUNT ON;

BEGIN
	SELECT		pro_Id,
	            pro_descripcion,
				pro_costo,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tproducto
	WHERE		pro_id=@pro_id and estado=1
	ORDER BY	pro_Id
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_find]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_find]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_producto_find]
	@pro_descripcion    udt_Descripcion
AS
SET NOCOUNT ON;
BEGIN
	SELECT		pro_id,
	            pro_descripcion,
				pro_costo,
				estado,
				ISNULL(idUsuario,'''') idUsuario
	FROM		Tproducto
	WHERE		pro_descripcion like ''%'' + @pro_descripcion + ''%'' AND estado=1
	ORDER BY	pro_Id		
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_edit]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_edit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_producto_edit] 
    @pro_id				udt_Descripcion,
	@pro_descripcion		udt_Descripcion,
	@pro_costo			decimal,
	@estado					udt_Estado,
	@idUsuario				udt_Usuario
AS
DECLARE @resultado	udt_Numerico

IF EXISTS(SELECT pro_id, pro_descripcion FROM Tproducto WHERE (pro_Id like @pro_id OR pro_descripcion like @pro_descripcion) 
															   AND estado = 1)
	BEGIN
		UPDATE Tproducto
		SET 
			pro_costo = @pro_costo,
			idUsuario=@idUsuario
		WHERE pro_id=@pro_id
		RETURN 2
	END
ELSE
	BEGIN
		UPDATE Tproducto
		SET 
			pro_descripcion = @pro_descripcion, 
			pro_costo = @pro_costo,
			idUsuario=@idUsuario
		WHERE pro_Id=@pro_id
		RETURN 1
	END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_del]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_producto_del]
	@pro_id			udt_descripcion,
    @idUsuario		udt_Usuario
	AS
SET NOCOUNT ON;

BEGIN
	UPDATE	Tproducto
	SET		estado		= 0,
			idUsuario	= @idUsuario	
	WHERE	pro_Id 	= @pro_id
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_add]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_producto_add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_producto_add] 
    @pro_id				varchar(10),
	@pro_descripcion	varchar(50),
	@pro_costo			decimal(10,2),
	@estado				udt_Estado,
	@idUsuario			udt_Usuario
AS
DECLARE @resultado	udt_Numerico

IF EXISTS(SELECT pro_id, pro_descripcion FROM Tproducto WHERE (pro_Id like @pro_id OR pro_descripcion like @pro_descripcion) 
															   AND estado = 1)
	BEGIN
		SET	@resultado = 2
	END
ELSE
	BEGIN
		SET	@resultado = 1
	END
	
IF @resultado=1
	BEGIN
		INSERT INTO Tproducto (
		    pro_Id,
			pro_descripcion,
			pro_costo,
			estado,
			idUsuario
		)
		VALUES (
		    @pro_id,
			@pro_descripcion,
			@pro_costo,
			@estado,
			@idUsuario
		)		
		RETURN @resultado
	END
ELSE
	BEGIN
		RETURN @Resultado
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoEncabezado_situacion]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoEncabezado_situacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_pedidoEncabezado_situacion]
    @ped_Id					udt_Descripcion,
	@ped_cli_ruc			udt_Descripcion,
	@situacion				udt_Descripcion,
	@estado					udt_Estado,
	@idUsuario				udt_Usuario
AS
BEGIN
		UPDATE TpedidoEncabezado
		SET 
			situacion = @situacion
		WHERE ped_Id=@ped_Id AND ped_cli_ruc = @ped_cli_ruc
		RETURN 1
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoEncabezado_sel]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoEncabezado_sel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_pedidoEncabezado_sel]
AS
SET NOCOUNT ON;

BEGIN
	SELECT		ped_Id as idPedido,
	            ped_cli_ruc as Cli_Ruc, 
				C.Cli_RazonSocial as cli_razonSocial,
				ped_total as montoTotal,
				situacion
	FROM		TpedidoEncabezado, Tcliente C
	WHERE		C.Cli_Ruc = ped_cli_ruc 
	ORDER BY	ped_Id
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoEncabezado_add]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoEncabezado_add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_pedidoEncabezado_add] 
    @ped_Id					udt_Descripcion,
	@ped_cli_ruc			udt_Descripcion,
	@ped_fecha				udt_Descripcion,
	@ped_total				udt_importe,
	@situacion				udt_Descripcion,
	@estado					udt_Estado,
	@idUsuario				udt_Usuario
AS
DECLARE @resultado	udt_Numerico

SET	@resultado = 1

IF @resultado=1
	BEGIN
		INSERT INTO TpedidoEncabezado (
		    ped_Id,
			ped_cli_ruc,
			ped_fecha,
			ped_total,
			situacion,
			estado,
			idUsuario
		)
		VALUES (
			@ped_Id,
		    @ped_cli_ruc,
			@ped_fecha,
			@ped_total,
			@situacion,
			@estado,
			@idUsuario
		)		
		RETURN @resultado
	END
ELSE
	BEGIN
		RETURN @Resultado
	END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_pedidoDetalle_add]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_pedidoDetalle_add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_pedidoDetalle_add] 
    @ped_Id					udt_Descripcion,
    @ped_cli_ruc			udt_Descripcion,
	@ped_pro_id				udt_Descripcion,
	@ped_precio				udt_importe,
	@ped_cantidad			udt_numerico,
	@situacion				udt_Descripcion,
	@estado					udt_Estado,
	@idUsuario				udt_Usuario
AS
DECLARE @resultado	udt_Numerico

SET	@resultado = 1

IF @resultado=1
	BEGIN
		INSERT INTO TpedidoDetalle (
		    ped_Id,
		    ped_cli_ruc,
			ped_pro_id,
			ped_precio,
			ped_cantidad,
			situacion,
			estado,
			idUsuario
		)
		VALUES (
			@ped_Id,
			@ped_cli_ruc,
		    @ped_pro_id,
			@ped_precio,
			@ped_cantidad,
			@situacion,
			@estado,
			@idUsuario
		)		
		RETURN @resultado
	END
ELSE
	BEGIN
		RETURN 2
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_opcion_selXModuloXSubModulo]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_opcion_selXModuloXSubModulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =====================================================================================
-- AUTOR CREA.	: JULIO HUAMANCAMA R.
-- FECHA CREA.	: 23/11/2010
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
				
-- EXECUTE usp_opcion_selXModuloXSubModulo 1, 4
-- =====================================================================================
CREATE PROCEDURE [dbo].[usp_opcion_selXModuloXSubModulo]
	@idModulo	udt_Identificador,
	@idPerfil	udt_Identificador
	AS
SET NOCOUNT ON;

BEGIN
	SELECT		idSubModulo, idOpcion, descOpcion, ISNULL(direccionUrl,'''') direccionUrl
	FROM		Topcion
	WHERE		idModulo	= @idModulo	AND
				idOpcion	IN (SELECT	DISTINCT idOpcion 
								FROM	TperfilOpciones 
								WHERE	idPerfil	= @idPerfil	AND
										idModulo	= @idModulo) AND
				estado		= 1
	ORDER BY	idOpcion
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_modulo_selXid]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_modulo_selXid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =====================================================================================
-- AUTOR CREA.	: JULIO HUAMANCAMA R. 
-- FECHA CREA.	: 23/11/2010
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
				
-- EXECUTE usp_modulo_selXid 1
-- =====================================================================================
CREATE PROCEDURE [dbo].[usp_modulo_selXid]
	@idModulo	udt_Identificador
	AS
SET NOCOUNT ON;

BEGIN
	SELECT		idModulo, descModulo
	FROM		Tmodulo
	WHERE		idModulo	= @idModulo	AND
				estado		= 1
	ORDER BY	idModulo
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_comprobarUsuario]    Script Date: 04/13/2012 01:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_comprobarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- ====================================================================================
-- AUTOR CREA.	: CESAR YENQUE.
-- FECHA CREA.	: 22/02/2012
-- AUTOR MOD.	: 
-- FECHA MOD.	: 
-- DESCRIPCION	: 
-- PARAMETROS	: 
-- @P_CNOMCLI	: 
-- EXECUTE usp_comprobarUsuario ''JULIO'', ''FOX''
-- ====================================================================================
CREATE PROCEDURE [dbo].[usp_comprobarUsuario]
	@usuario			udt_Descripcion,
	@contraseña			udt_Descripcion,
	@idUsuario			udt_Identificador	OUTPUT,
	@mensaje			udt_Descripcion		OUTPUT,
	@idPerfilUsuario	udt_Identificador	OUTPUT
	AS
SET NOCOUNT ON;

DECLARE @intentos	udt_Numerico
DECLARE @estado		udt_Numerico
DECLARE @resultado	udt_Numerico
DECLARE @clave		udt_Descripcion

IF EXISTS(SELECT usuario FROM Tusuario WHERE usuario = @usuario AND estado = 1)
	BEGIN
		SELECT	@idUsuario			= ISNULL(idPersonal,0), 
				@intentos			= ISNULL(intentos,0), 
				@estado				= estado, 
				@clave				= contraseña,
				@idPerfilUsuario	= idPerfilUsuario
		FROM	Tusuario 
		WHERE	RTRIM(usuario)		= RTRIM(@usuario) AND 
			  	estado				= 1;

		IF @intentos > (SELECT dbo.udf_nroIntentos(1) AS cantidad )
			SET @mensaje = ''Usuario bloqueado.''
		ELSE
		 IF @estado = 0
			SET @mensaje = ''Usuario no está habilitado.''		
		 ELSE
			IF @clave = @contraseña
				BEGIN	
					SET @mensaje = ''''			
					SET @resultado = 1
					RETURN  @resultado
				END
			ELSE
				BEGIN
					SET @mensaje = ''Contraseña incorrecta.''
					SET @resultado = 0;
					SET @idPerfilUsuario = 0;

					UPDATE Tusuario SET intentos = ISNULL(intentos,0) + 1
					WHERE  usuario = @usuario --AND password = @password
					RETURN  @resultado
				END 
	END
ELSE
	BEGIN
		SET @mensaje			= ''Usuario no existe.''
		SET @idUsuario			= 0;
		SET @resultado			= 0;
		SET @idPerfilUsuario	= 0;
	END


' 
END
GO
