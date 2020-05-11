USE [MedicalStore]
GO

/****** Object:  Table [dbo].[Bill]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bill](
	[CustomerID] [varchar](20) NULL,
	[InputPrice] [float] NOT NULL,
	[ReturnPrice] [float] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company](
	[CompanyID] [varchar](20) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[Location] [varchar](40) NOT NULL,
	[ContactNumber] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](20) NOT NULL,
	[CustomerName] [varchar](20) NOT NULL,
	[Productid] [varchar](20) NULL,
	[Quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dealer]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dealer](
	[DealerID] [varchar](20) NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[Contact] [varchar](11) NOT NULL,
	[House] [varchar](40) NULL,
	[CompanyID] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Price] [float] NOT NULL,
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

/****** Object:  Table [dbo].[Dealerbill]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dealerbill](
	[DealerID] [varchar](20) NULL,
	[InputPrice] [float] NOT NULL,
	[ReturnPrice] [float] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Employ]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employ](
	[EmpID] [varchar](20) NOT NULL,
	[EmpName] [varchar](40) NOT NULL,
	[Contact] [varchar](11) NOT NULL,
	[House] [varchar](40) NULL,
	[Designation] [varchar](20) NULL,
	[Salary] [int] NULL,
	[Email] [varchar](25) NULL,
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

/****** Object:  Table [dbo].[LoginTable]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LoginTable](
	[UserName] [varchar](20) NOT NULL,
	[Pass] [varchar](20) NOT NULL,
	[EmpID] [varchar](20) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Medicine]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Medicine](
	[MedicineID] [varchar](20) NOT NULL,
	[MedicineName] [varchar](25) NOT NULL,
	[CompanyID] [varchar](20) NULL,
	[Price] [float] NOT NULL,
	[Manufacturing] [date] NOT NULL,
	[Expiry] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[orgCustomers]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[orgCustomers](
	[CustomerID] [varchar](20) NOT NULL,
	[CustomerName] [varchar](20) NULL,
	[Productid] [varchar](20) NULL,
	[Quantity] [float] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Purchase]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [varchar](20) NOT NULL,
	[DealerID] [varchar](20) NULL,
	[Medicineid] [varchar](20) NULL,
	[PurchaseDate] [date] NOT NULL,
	[Quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
	[Totalprice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[repeatedCustomers]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[repeatedCustomers](
	[CustomerID] [varchar](20) NOT NULL,
	[Productid] [varchar](20) NOT NULL,
	[Quantity] [float] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sales]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sales](
	[MedicineID] [varchar](20) NULL,
	[SalesDate] [date] NOT NULL,
	[Quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
	[Totalprice] [float] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Stock]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Stock](
	[Productid] [varchar](20) NULL,
	[Quantityleft] [float] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[virtualStock]    Script Date: 11-05-2020 16:40:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[virtualStock](
	[Productid] [varchar](20) NULL,
	[Quantityleft] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([Productid])
REFERENCES [dbo].[Medicine] ([MedicineID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Dealerbill]  WITH CHECK ADD FOREIGN KEY([DealerID])
REFERENCES [dbo].[Dealer] ([DealerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[LoginTable]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employ] ([EmpID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[orgCustomers]  WITH CHECK ADD FOREIGN KEY([Productid])
REFERENCES [dbo].[Medicine] ([MedicineID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD FOREIGN KEY([DealerID])
REFERENCES [dbo].[Dealer] ([DealerID])
GO

ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD FOREIGN KEY([Medicineid])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO

ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([Productid])
REFERENCES [dbo].[Medicine] ([MedicineID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[virtualStock]  WITH CHECK ADD FOREIGN KEY([Productid])
REFERENCES [dbo].[Medicine] ([MedicineID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD CHECK  (([Quantity]>(0)))
GO

ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD CHECK  (([Email] like '%_@__%.__%'))
GO

ALTER TABLE [dbo].[Employ]  WITH CHECK ADD CHECK  (([Email] like '%_@__%.__%'))
GO

ALTER TABLE [dbo].[Employ]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO



	
	insert into [Company]
	values ('10C', 'ABC', 'Delhi', 12345),
	('11C', 'DEF', 'Kolkata', 45678), 
	('12C', 'GHI', 'Mumbai', 32242),
	('13C', 'JLK', 'Chennai', 668776)

	insert into [Medicine]
	values ('12M', 'ABC', '10C', 20, '10 January 2019', '08 April 2022'), 
	('11M', 'CDF', '11C', 30, '10 January 2018', '18 April 2022')

	
	insert into [Dealer]
	values ('11D', 'Shyam', 0300126453, 'ABC', '10C', 'Shyam@gmail.com', '50'), 
	('10D', 'Shyam1', 0300126453, 'ABC', '10C', 'Shyam1@gmail.com', '50')

	insert into [Employ]
	values ('1', 'Salman', '03216773647', 'FaisalTown', 'Manager', '1000' ,'salman@gmail.com'), 
	('2', 'Hasan', '03368802220', 'FaisalTown', 'Manager', '1000' ,'Hasan@gmail.com')

	insert into [LoginTable]
	values ('Salman', 'salman123', '1'),
	('Hasan', 'Hasan12', '2')



	insert into [Purchase]
	values 
	('14P', '11D', '12M', '17 January 2018', 1000, 40,40000),
	('13P', '11D', '11M', '12 January 2018', 10, 50, 40000), 
	('12P', '11D', '11M', '12 January 2018', 10, 50, 4000),
	('10P', '10D', '12M', '12 January 2018',  10, 50, 4000),
	('11P', '11D', '12M', '17 January 2018',  10, 50, 4000)
	
	
	insert into [Customers]
	values  ('14C', 'Rahul', '12M', 2, 2000),
    ('11C', 'Rohit', '11M', 2, 100),
	('12C', 'Virat', '11M', 2, 100)
