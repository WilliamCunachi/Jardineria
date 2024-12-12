USE [jardineria]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 11/12/2024 20:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[codigo_cliente] [int] NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[nombre_contacto] [varchar](30) NULL,
	[apellido_contacto] [varchar](30) NULL,
	[telefono] [varchar](15) NOT NULL,
	[fax] [varchar](15) NOT NULL,
	[linea_direccion1] [varchar](50) NOT NULL,
	[linea_direccion2] [varchar](50) NULL,
	[ciudad] [varchar](50) NOT NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NULL,
	[codigo_postal] [varchar](10) NULL,
	[codigo_empleado_rep_ventas] [int] NULL,
	[limite_credito] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Spain_Financiero]    Script Date: 11/12/2024 20:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Spain_Financiero](
	[codigo_cliente] [int] NOT NULL,
	[codigo_empleado_rep_ventas] [int] NULL,
	[limite_credito] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Spain_General]    Script Date: 11/12/2024 20:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Spain_General](
	[codigo_cliente] [int] NOT NULL,
	[nombre_cliente] [nvarchar](100) NULL,
	[nombre_contacto] [nvarchar](50) NULL,
	[apellido_contacto] [nvarchar](50) NULL,
	[telefono] [nvarchar](20) NULL,
	[fax] [nvarchar](20) NULL,
	[linea_direccion1] [nvarchar](100) NULL,
	[linea_direccion2] [nvarchar](100) NULL,
	[ciudad] [nvarchar](50) NULL,
	[region] [nvarchar](50) NULL,
	[codigo_postal] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_USA_Financiero]    Script Date: 11/12/2024 20:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_USA_Financiero](
	[codigo_cliente] [int] NOT NULL,
	[codigo_empleado_rep_ventas] [int] NULL,
	[limite_credito] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_USA_General]    Script Date: 11/12/2024 20:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_USA_General](
	[codigo_cliente] [int] NOT NULL,
	[nombre_cliente] [nvarchar](100) NULL,
	[nombre_contacto] [nvarchar](50) NULL,
	[apellido_contacto] [nvarchar](50) NULL,
	[telefono] [nvarchar](20) NULL,
	[fax] [nvarchar](20) NULL,
	[linea_direccion1] [nvarchar](100) NULL,
	[linea_direccion2] [nvarchar](100) NULL,
	[ciudad] [nvarchar](50) NULL,
	[region] [nvarchar](50) NULL,
	[codigo_postal] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [nombre_contacto]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [apellido_contacto]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [linea_direccion2]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [region]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [pais]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [codigo_postal]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [codigo_empleado_rep_ventas]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [limite_credito]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([codigo_empleado_rep_ventas])
REFERENCES [dbo].[empleado] ([codigo_empleado])
GO 
	 
INSERT INTO Cliente_USA_General(
    codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto,
    telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, codigo_postal
)
SELECT 
    codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto,
    telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, codigo_postal
FROM [jardineria].[dbo].[cliente]
WHERE pais = 'USA';


INSERT INTO Cliente_USA_Financiero (
    codigo_cliente, codigo_empleado_rep_ventas, limite_credito
)
SELECT 
    codigo_cliente, codigo_empleado_rep_ventas, limite_credito
FROM [jardineria].[dbo].[cliente]
WHERE pais = 'USA';

 
INSERT INTO Cliente_Spain_General
(
    codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto,
    telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, codigo_postal
)
SELECT 
    codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto,
    telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, codigo_postal
FROM [jardineria].[dbo].[cliente]
WHERE pais = 'Spain';


INSERT INTO Cliente_Spain_Financiero (
    codigo_cliente, codigo_empleado_rep_ventas, limite_credito
)
SELECT 
    codigo_cliente, codigo_empleado_rep_ventas, limite_credito
FROM [jardineria].[dbo].[cliente]
WHERE pais = 'Spain';
