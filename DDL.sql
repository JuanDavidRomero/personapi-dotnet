USE [persona_db]
GO
/****** Object:  Table [dbo].[estudios]    Script Date: 24/04/2023 04:40:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudios](
	[id_prof] [int] NOT NULL,
	[cc_per] [int] NOT NULL,
	[fecha] [date] NULL,
	[univer] [varchar](50) NULL,
 CONSTRAINT [PK_estudios] PRIMARY KEY CLUSTERED 
(
	[id_prof] ASC,
	[cc_per] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 24/04/2023 04:40:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[cc] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[genero] [varchar](10) NOT NULL,
	[edad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesion]    Script Date: 24/04/2023 04:40:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesion](
	[id] [int] NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[des] [text] NULL,
 CONSTRAINT [PK_profesion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 24/04/2023 04:40:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono](
	[num] [varchar](50) NOT NULL,
	[oper] [varchar](50) NOT NULL,
	[duenio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[estudios]  WITH CHECK ADD FOREIGN KEY([cc_per])
REFERENCES [dbo].[persona] ([cc])
GO
ALTER TABLE [dbo].[estudios]  WITH CHECK ADD FOREIGN KEY([id_prof])
REFERENCES [dbo].[profesion] ([id])
GO
ALTER TABLE [dbo].[telefono]  WITH CHECK ADD FOREIGN KEY([duenio])
REFERENCES [dbo].[persona] ([cc])
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD CHECK  (([genero]='F' OR [genero]='M'))
GO
