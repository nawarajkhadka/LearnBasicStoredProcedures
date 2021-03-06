USE [StoredProceduresDb]
GO
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 7/10/2017 8:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerAddress] [nvarchar](1000) NULL,
	[CustomerAge] [int] NULL,
 CONSTRAINT [PK_tbl_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_Customers] ON 

INSERT [dbo].[tbl_Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerAge]) VALUES (1, N'Joe Evans', N'Washington', 25)
INSERT [dbo].[tbl_Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerAge]) VALUES (2, N'Eldridge Margco', N'Dallas', 22)
SET IDENTITY_INSERT [dbo].[tbl_Customers] OFF
