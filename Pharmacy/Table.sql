USE [AlphaPharmacy]
GO

ALTER TABLE [dbo].[Sell] DROP CONSTRAINT [FK_Sell_Medicine]
GO

ALTER TABLE [dbo].[Sell] DROP CONSTRAINT [FK_Sell_Customers]
GO

ALTER TABLE [dbo].[Purchase] DROP CONSTRAINT [FK_Purchase_Medicine]
GO

ALTER TABLE [dbo].[Purchase] DROP CONSTRAINT [FK_Purchase_Dealer]
GO

ALTER TABLE [dbo].[Medicine] DROP CONSTRAINT [FK_Medicine_Company]
GO

ALTER TABLE [dbo].[LoginDetails] DROP CONSTRAINT [FK_LoginDetails_Employee]
GO

ALTER TABLE [dbo].[Dealer] DROP CONSTRAINT [FK_Dealer_Company]
GO

/****** Object:  Table [dbo].[Sell]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sell]') AND type in (N'U'))
DROP TABLE [dbo].[Sell]
GO

/****** Object:  Table [dbo].[Purchase]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Purchase]') AND type in (N'U'))
DROP TABLE [dbo].[Purchase]
GO

/****** Object:  Table [dbo].[Medicine]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicine]') AND type in (N'U'))
DROP TABLE [dbo].[Medicine]
GO

/****** Object:  Table [dbo].[LoginDetails]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginDetails]') AND type in (N'U'))
DROP TABLE [dbo].[LoginDetails]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO

/****** Object:  Table [dbo].[Dealer]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dealer]') AND type in (N'U'))
DROP TABLE [dbo].[Dealer]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
DROP TABLE [dbo].[Customers]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 19-05-2020 19:54:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
DROP TABLE [dbo].[Company]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company](
	[CompanyID] [varchar](20) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[Location] [varchar](40) NOT NULL,
	[ContactNumber] [numeric](11, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](20) NOT NULL,
	[CustomerName] [varchar](20) NOT NULL,
	[Address] [varchar](100) NULL,
	[ContactNo] [numeric](11, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dealer]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dealer](
	[DealerID] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContactNo] [numeric](11, 0) NOT NULL,
	[Address] [varchar](100) NULL,
	[CompanyID] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DealerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmpID] [int] NOT NULL,
	[EmpName] [varchar](50) NOT NULL,
	[ContactNo] [numeric](11, 0) NOT NULL,
	[Address] [varchar](100) NULL,
	[Designation] [varchar](20) NULL,
	[Salary] [int] NULL,
	[Gender] [varchar](5) NOT NULL,
	[DOB] [date] NOT NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LoginDetails]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LoginDetails](
	[UserName] [varchar](50) NOT NULL,
	[Pass] [varchar](20) NOT NULL,
	[EmpID] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Medicine]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Medicine](
	[MedicineID] [varchar](20) NOT NULL,
	[MedicineName] [varchar](100) NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Manufacturing] [date] NOT NULL,
	[Expiry] [date] NOT NULL,
	[CurrentQuantity] [int] NOT NULL,
 CONSTRAINT [PK__Medicine__4F2128F066B11B4A] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Purchase]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [varchar](20) NOT NULL,
	[DealerID] [varchar](20) NOT NULL,
	[MedicineID] [varchar](20) NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Totalprice] [float] NOT NULL,
 CONSTRAINT [PK__Purchase__6B0A6BDE8D8AFF02] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sell]    Script Date: 19-05-2020 19:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sell](
	[SellID] [varchar](20) NOT NULL,
	[CustomerID] [varchar](20) NULL,
	[MedicineID] [varchar](20) NULL,
	[SellDate] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Totalprice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD  CONSTRAINT [FK_Dealer_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO

ALTER TABLE [dbo].[Dealer] CHECK CONSTRAINT [FK_Dealer_Company]
GO

ALTER TABLE [dbo].[LoginDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoginDetails_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([EmpID])
GO

ALTER TABLE [dbo].[LoginDetails] CHECK CONSTRAINT [FK_LoginDetails_Employee]
GO

ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO

ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Company]
GO

ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Dealer] FOREIGN KEY([DealerID])
REFERENCES [dbo].[Dealer] ([DealerID])
GO

ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Dealer]
GO

ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO

ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Medicine]
GO

ALTER TABLE [dbo].[Sell]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[Sell] CHECK CONSTRAINT [FK_Sell_Customers]
GO

ALTER TABLE [dbo].[Sell]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO

ALTER TABLE [dbo].[Sell] CHECK CONSTRAINT [FK_Sell_Medicine]
GO


