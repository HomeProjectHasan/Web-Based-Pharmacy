USE [AlphaPharmacy]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 17-05-2020 10:29:19 ******/
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

/****** Object:  Table [dbo].[Customers]    Script Date: 17-05-2020 10:29:19 ******/
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

/****** Object:  Table [dbo].[Dealer]    Script Date: 17-05-2020 10:29:19 ******/
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

/****** Object:  Table [dbo].[Employee]    Script Date: 17-05-2020 10:29:19 ******/
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

/****** Object:  Table [dbo].[LoginDetails]    Script Date: 17-05-2020 10:29:19 ******/
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

/****** Object:  Table [dbo].[Medicine]    Script Date: 17-05-2020 10:29:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Medicine](
	[MedicineID] [varchar](20) NOT NULL,
	[MedicineName] [varchar](100) NOT NULL,
	[CompanyID] [varchar](20) NULL,
	[Price] [float] NOT NULL,
	[Manufacturing] [date] NOT NULL,
	[Expiry] [date] NOT NULL,
	[CurrentQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Purchase]    Script Date: 17-05-2020 10:29:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [varchar](20) NOT NULL,
	[DealerID] [varchar](20) NULL,
	[MedicineID] [varchar](20) NULL,
	[PurchaseDate] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Totalprice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sell]    Script Date: 17-05-2020 10:29:19 ******/
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


