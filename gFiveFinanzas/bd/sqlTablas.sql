USE [BDGFiveFinanzas]
GO
/****** Object:  User [gf]    Script Date: 03/26/2012 12:32:16 ******/
CREATE USER [gf] FOR LOGIN [gf] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/26/2012 12:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[cli_ruc] [varchar](20) NOT NULL,
	[cli_razonSocial] [varchar](250) NOT NULL,
	[cli_lineaCreditoTotal] [decimal](15, 2) NOT NULL,
	[cli_lineaCreditoSaldo] [decimal](15, 2) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[cli_ruc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 03/26/2012 12:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[nombreUsuario] [varchar](55) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[contraseņa] [varchar](55) NOT NULL,
	[estado] [char](1) NOT NULL,
	[intentos] [smallint] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 03/26/2012 12:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] NOT NULL,
	[situacion] [varchar](50) NOT NULL,
	[montoTotal] [decimal](15, 2) NOT NULL,
	[cli_ruc] [varchar](20) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Asiento]    Script Date: 04/06/2012 17:18:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Asiento](
	[numAsiento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[referencia] [varchar](250) NULL,
	[montoCargo] [numeric](15, 2) NOT NULL,
	[montoAbono] [numeric](15, 2) NOT NULL,
	[cuentaCargo] [varchar](250) NULL,
	[cuentaAbono] [varchar](250) NULL,
	[fechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Asiento] PRIMARY KEY CLUSTERED 
(
	[numAsiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
