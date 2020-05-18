USE [AlphaPharmacy]
GO

/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 18-05-2020 13:22:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


 CREATE procedure [dbo].[Login] @usr varchar(20), @pas varchar(20), @result varchar(200) output
        as begin
		begin try
		declare @passDB varchar(20), @Name varchar(50)
		select @passDB = l.Pass,@Name =e.EmpName from Employee e, LoginDetails l where e.EmpID=l.EmpID and l.UserName =@usr
            
			
			if(@pas = @passDB)
                begin				
                select @result = 'Success|'+ @Name;
                end
            else
                begin
                select @result='Error| Login Failure';;
                end

		end try
		begin catch		
			set @result = 'Error|' + ERROR_MESSAGE ( )  
		end catch
        end

GO

/****** Object:  StoredProcedure [dbo].[PurchaseMedicine]    Script Date: 18-05-2020 13:22:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PurchaseMedicine]
	@DealerID varchar(20), @MedicineName varchar(100), @Date date, @Quantity int, @Price float, @MFD Date, @EXP Date, @NewFlag varchar(1), @result varchar(200) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @purchaseid INT
	declare @MedicineID varchar(20)
	declare @CurrQuantity INT
	declare @valid bit = 0;
	
	begin try
	if(@NewFlag = 'Y')
	begin
	-- for new medicine create a medicine and then proceed to purchase
		if((select count(1) from Medicine where MedicineName = @MedicineName) = 0)
		begin	
			declare @medid int 
			declare @comid varchar(20)	

			select @comid = [CompanyID] from [dbo].[Dealer] where [DealerID]= @DealerID

			select @medid = isnull(max(cast(REPLACE([MedicineID],'M','') as INT)),0) from Medicine

			select @MedicineID = cast(@medid+1 as varchar) +'M'

			INSERT INTO Medicine([MedicineID],[MedicineName],[CompanyID],[Price],[Manufacturing],[Expiry],[CurrentQuantity])
			values(@MedicineID, @MedicineName, @comid, @Price, @MFD, @EXP, @Quantity)
			set @valid = 1
		end
		else
		begin
			select @result = 'Error|Medicine already exist with same name. Please select new medicine as "No"';
			set @valid = 0
		end

	end
	else if (@NewFlag = 'N')
	begin
	-- For existing medicine get the medicineid and price, also update the quantity
		select @MedicineID = [MedicineID] , @Price = [Price] from [dbo].[Medicine] where [MedicineName] = @MedicineName
		update [dbo].[Medicine] set [CurrentQuantity] = [CurrentQuantity] + @Quantity where [MedicineID] = @MedicineID
		set @valid = 1
	end
	else
	begin
	select @result = 'Error|NewFlag should be either Yes or No'
	set @valid = 0

	end
	-- finally add to purchase

	select @purchaseid = isnull(max(cast(REPLACE([PurchaseID],'P','') as INT)),0) from Purchase
	set @purchaseid = @purchaseid+1

	if(@valid = 1)
	begin
	INSERT INTO Purchase ([PurchaseID],[DealerID],[MedicineID],[PurchaseDate],[Quantity],[Totalprice])
	values(cast(@purchaseid as varchar) +'P', @DealerID, @MedicineID, @Date, @Quantity, @Quantity * @Price )

	select @result = 'Success|Purchase successful'
	end
	
	end try
	begin catch
	set @result = 'Error|' + ERROR_MESSAGE ( ) 
	end catch
END
GO

/****** Object:  StoredProcedure [dbo].[SellMedicine]    Script Date: 18-05-2020 13:22:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SellMedicine]
	@CustomerName varchar(50), @MedicineID varchar(100), @Date date, @Quantity int, @Address varchar(100), @Contact numeric(11,0), @NewFlag varchar(1),@result varchar(200) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @sellid INT
	declare @CustomerID varchar (20) 
	declare @CurrQuantity INT
	declare @Price float 
	declare @valid bit = 0;
	
	begin try
	select @CurrQuantity = CurrentQuantity from [dbo].[Medicine] where [MedicineID] = @MedicineID

	if(@CurrQuantity<@Quantity)
	begin
		select @result = 'Error|Entered quantity is greater than available quantity'
		set @valid = 0
	end
	else
	begin
		if(@NewFlag = 'Y')
		begin
		-- for new customer create a customer and then proceed to sell
			if((select count(1) from Customers where CustomerName = @CustomerName and ContactNo = @Contact) = 0)
			begin	
				declare @Cusid int

				select @Cusid = isnull(max(cast(REPLACE([CustomerID],'Cus','') as INT)),0) from Customers


				select @CustomerID = cast(@Cusid+1 as varchar) +'Cus'

				INSERT INTO Customers([CustomerID],[CustomerName],[Address],[ContactNo])
				values(@CustomerID, @CustomerName, @Address, @Contact)
				set @valid = 1
			end
			else 
			begin
				select @result = 'Error|Customer already exist with same name and contactNo. Please select new customer as "No"';
				set @valid = 0
			end
		end
		else if (@NewFlag = 'N')
		begin
		-- For existing customer get the customerid
			select @CustomerID = [CustomerID] from Customers where [CustomerName] = @CustomerName and ContactNo = @Contact
			set @valid = 1
		end
		else
		begin
		select @result = 'Error|NewFlag should be either Yes or No'
		set @valid = 0

		end
		-- finally add to sell

			select @Price = [Price] from [dbo].[Medicine] where [MedicineID] = @MedicineID

			select @sellid = isnull(max(cast(REPLACE([SellID],'S','') as INT)),0) from Sell

			set @sellid = @sellid+1
			if(@valid = 1)
			begin
				INSERT INTO Sell ([SellID],[CustomerID],[MedicineID],[SellDate],[Quantity],[Totalprice])
				values(cast(@sellid as varchar) +'S', @CustomerID, @MedicineID, @Date, @Quantity, @Quantity * @Price )

				update [Medicine] set [CurrentQuantity] = [CurrentQuantity] - @Quantity where [MedicineID] = @MedicineID

				select @result = 'Success| Successful'
			end
	end
	end try
	begin catch
		set @result = 'Error|' + ERROR_MESSAGE ( ) 
	end catch
END
GO

/****** Object:  StoredProcedure [dbo].[SignUp]    Script Date: 18-05-2020 13:22:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE procedure [dbo].[SignUp] @name varchar(40), @contact numeric(11,0), @adrs varchar(50), @desig varchar(20), @sal int, @Email varchar(50),@gen varchar(5), @dob date, @usrn varchar(20), @pass varchar(20), @output varchar(200) output
as begin

begin try
    if(@usrn = (select UserName from [dbo].[LoginDetails] where UserName = @usrn))
        begin
        select @output = 'Error|Account Already exist.'
        end
    else
        begin
				
		declare @id INT
		select @id = isnull(max([EmpID]),0) from [Employee]
		set @id = @id+1

        insert into [Employee] ([EmpID],[EmpName],[ContactNo],[Address],[Designation],[Salary],[Gender],[DOB],[Email])
        values (@id, @name, @contact, @adrs, @desig, @sal,@gen, @dob, @Email)

        insert into [dbo].[LoginDetails]([UserName],[Pass],[EmpID])
        values (@usrn, @pass, @id)

        select @output = 'Success|Account created successfully.'
        end
end try
begin catch

set @output = 'Error|' + ERROR_MESSAGE ( )   

end catch
end
GO


