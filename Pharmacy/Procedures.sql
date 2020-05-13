USE [MedicalStore]
GO

/****** Object:  StoredProcedure [dbo].[CompanyName]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CompanyName] @id varchar(20)
    as begin
        select  CompanyID,CompanyName
        from  Company 
        where CompanyID= @id
    end
GO

/****** Object:  StoredProcedure [dbo].[customer_database]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[customer_database] @id varchar(20), @name varchar(20),@mid varchar(20), @quantity float , @amount float
        as begin 
        insert into [Customers]
        values( @id,@name ,@mid, @quantity, @amount )

        end
GO

/****** Object:  StoredProcedure [dbo].[CustomerBill]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CustomerBill] @id varchar(20)
	  as begin
	  declare @cus varchar (20)
	  declare @sum float=0;
	   declare @sum2 float=0;
	   
	   declare @name varchar(20);
	   declare @med varchar(20)
	    declare @qu float;
		declare @pr float;
	   select @name=CustomerName,@med=Productid,@qu=Quantity,@pr=price from Customers
	   where CustomerID=@id
	  select @sum= sum(C.Quantity*M.Price)
	  from Customers C, Medicine M
	  where C.CustomerID=@id AND M.MedicineID=C.Productid

	 select @cus=CustomerID from repeatedCustomers
	 where @id=CustomerID
	 if (@cus is not NULL)
	 begin 
	  select @sum2= sum(C.Quantity*M.Price)
	  from repeatedCustomers C, Medicine M
	  where C.CustomerID=@cus AND M.MedicineID=C.Productid
	  select @sum2
	 end
	 declare @finalsum float= 0;
	 set @finalsum=@sum + @sum2
	 declare @pric float;
	 select @pric=price
	 from Customers
	 where CustomerID=@id
	 declare @remain float =0;
	 set @remain=@pric-@finalsum
	 select @remain
	 if (@remain>=0)
	 begin
	 declare @quan float;
	 declare @mi varchar(20);
	 insert into [Bill]
	 values (@id,@pric,@remain)
	 declare @stockquantity float;
	 select @quan=Quantityleft,@mi=Productid
	 from virtualStock
	 delete from virtualStock
	 update Stock set Quantityleft =@quan where Productid=@mi
	 end
	 else 
	 begin 
	 delete from repeatedCustomers where   CustomerID=@id
	 delete from Customers where   CustomerID=@id
	 
	 end
	  end
GO

/****** Object:  StoredProcedure [dbo].[DealernamefromCompID]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DealernamefromCompID] @id varchar(20)
    as begin
        select  DealerID,Name
        from  Dealer
        where CompanyID= @id
    end
GO

/****** Object:  StoredProcedure [dbo].[Find_All_Info]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Find_All_Info] @id varchar(20)
    as begin
        select M.MedicineName, C.CompanyName, C.ContactNumber, M.Price, M.Manufacturing, M.Expiry
        from Medicine M join Company C on M.CompanyID = C.CompanyID
        where M.MedicineID = @id
    end
GO

/****** Object:  StoredProcedure [dbo].[Find_Dealer]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  create procedure [dbo].[Find_Dealer] @id varchar(20)
    as begin
        select *
        from dbo.Dealer E
        where E.DealerID = @id;
    end
GO

/****** Object:  StoredProcedure [dbo].[Find_Employ]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Find_Employ] @id varchar(20)
    as begin
        select *
        from Employ E
        where E.EmpID = @id;
    end
GO

/****** Object:  StoredProcedure [dbo].[Find_Employ_Name]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

   create procedure [dbo].[Find_Employ_Name] @name varchar(40)
    as begin
        select *
        from Employ E
        where E.EmpName = @name;
    end
GO

/****** Object:  StoredProcedure [dbo].[Find_Expiry]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


    create procedure [dbo].[Find_Expiry] @id varchar(20)
    as begin
        select M.MedicineName, M.Expiry
        from Medicine M
        where M.MedicineID = @id;
    end
GO

/****** Object:  StoredProcedure [dbo].[Find_Price]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Find_Price] @id varchar(20)
    as begin
        select M.MedicineName, M.Price
        from Medicine M
        where M.MedicineID = @id;
    end
GO

/****** Object:  StoredProcedure [dbo].[GetLastID]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLastID]
	@ans int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select @ans= max(empid) from [Employ]
	select @ans
END
GO

/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsertCustomer] @id varchar(20), @name varchar(20),@Productid varchar(20),@Quantity float,@price float
		as begin
		insert into [Customers]
		values (@id,@name,@Productid,@Quantity,@price)
		end
GO

/****** Object:  StoredProcedure [dbo].[LoginDatabase]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[LoginDatabase] @usr varchar(20), @pas varchar(20), @ans int output
        as begin
            if(@pas = (select Pass from LoginTable where UserName = @usr))
                begin
                select @ans = 1;
                end
            else
                begin
                select @ans = 0;
                end
        end
GO

/****** Object:  StoredProcedure [dbo].[noOfSale]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[noOfSale] @id varchar(20)
        as begin 
            select MedicineID, Quantity, price, Totalprice
            from Sales
            where MedicineID = @id
        end
GO

/****** Object:  StoredProcedure [dbo].[PurchaseDates]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[PurchaseDates] @id varchar(20)
    as begin
        select Medicineid,PurchaseDate
        from Purchase
        where Medicineid=@id
    end
GO

/****** Object:  StoredProcedure [dbo].[Purchaseoutput]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


	  create procedure [dbo].[Purchaseoutput] @PurchaseID varchar(20),@DealerID varchar (20),@Medicineid varchar(20),@PurchaseDate date,@Quantity float,@price float,@Totalprice float
	  as begin
	  insert into [Purchase]
	  values(@PurchaseID,@DealerID,@Medicineid,@PurchaseDate,@Quantity,@price,@Totalprice)
	  end

GO

/****** Object:  StoredProcedure [dbo].[Quantityleft]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Quantityleft] @id varchar(20)
    as begin
        select M.MedicineName,Q.Quantityleft
        from Medicine M, Stock Q
        where Q.Productid=@id
    end
GO

/****** Object:  StoredProcedure [dbo].[repetitionCustomercontrol]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



	  create procedure [dbo].[repetitionCustomercontrol] @id varchar(20)
	as begin
	 declare @name varchar(20);
	   declare @med varchar(20)
	    declare @qu float;
		declare @pr float;

	   select @name=CustomerName,@med=Productid,@qu=Quantity,@pr=price from
	   Customers
	   where CustomerID=@id
	   select @name
	   insert into [orgCustomers]
	 values (@id,@name,@med,@qu,@pr)
	end
GO

/****** Object:  StoredProcedure [dbo].[Show_All_Expired]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Show_All_Expired]
        as begin
            select M.MedicineID, M.MedicineName, M.Expiry as 'Expired on'
            from Medicine M
            where DATEDIFF(day, M.Expiry, GETDATE()) > 0
        end
GO

/****** Object:  StoredProcedure [dbo].[Show_All_Medicine]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  create procedure [dbo].[Show_All_Medicine]
        as begin
            select *
            from Medicine
        end
GO

/****** Object:  StoredProcedure [dbo].[Show_If_Expired]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Show_If_Expired] @id varchar(20)
        as begin
            declare @dateofmed date
            select @dateofmed = M.Expiry from Medicine M where M.MedicineID = @id
            if(DATEDIFF(day, @dateofmed, GETDATE()) > 0)
                begin
                print 'This Medicine is expired'
                end
            else
                begin
                print 'This Medicine is not expired'
                end
        end
GO

/****** Object:  StoredProcedure [dbo].[Show_outofstock]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Show_outofstock]
        as begin
            select M.MedicineID, M.MedicineName
            from Medicine M join Stock S on M.MedicineID = S.Productid
            where S.Quantityleft = 0
        end
GO

/****** Object:  StoredProcedure [dbo].[SignupDatabase]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SignupDatabase] @id varchar(20), @name varchar(40), @contact varchar(11), @adrs varchar(40), @desig varchar(20), @sal int, @Email varchar(25), @usrn varchar(20), @pass varchar(20), @output int output
        as begin
            if(@usrn = (select UserName from LoginTable where UserName = @usrn))
                begin
                select @output = '0'
                end
            else
                begin
                insert into [Employ]
                values (@id, @name, @contact, @adrs, @desig, @sal, @Email)
                insert into [LoginTable]
                values (@usrn, @pass, @id)
                select @output = '1'
                end
        end
GO

/****** Object:  StoredProcedure [dbo].[Update_Expiry]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Update_Expiry] @d date, @id varchar(20)
    as begin
        declare @mag date
        select @mag = Manufacturing from Medicine
        IF (DATEDIFF(day, @mag, @d) < 0)
            BEGIN
            Print 'Invalid Expiry as it is less than manufacturing date of medicine (procedure Name "Update_Expiry")';
            END
        else
            begin
            update Medicine
            set Expiry = @d
            where MedicineID = @id
			  select M.MedicineName, M.Expiry
              from Medicine M
               where M.MedicineID = @id;
            end
    end
GO

/****** Object:  StoredProcedure [dbo].[Update_Manf]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  create procedure [dbo].[Update_Manf] @d date, @id varchar(20)
    as begin
        declare @exp date
        select @exp = Expiry from Medicine
        IF (DATEDIFF(day, @d, @exp) < 0)
            BEGIN
            Print 'Invalid Manufacturing as it is greater than expiry date of medicine (Procedure Name "Update_Manf")';
            END
        else
            begin
            update Medicine
            set Manufacturing = @d
            where MedicineID = @id
			  select M.MedicineName, M.Manufacturing
              from Medicine M
               where M.MedicineID = @id;
            end
        end
GO

/****** Object:  StoredProcedure [dbo].[Who_took_these]    Script Date: 11-05-2020 16:45:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Who_took_these] @id varchar(20)
    as begin
        select Productid,CustomerName
        from Customers
        where Productid = @id
    end
GO


