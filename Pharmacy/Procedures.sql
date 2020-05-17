USE [AlphaPharmacy]
GO

/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 17-05-2020 13:01:13 ******/
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

/****** Object:  StoredProcedure [dbo].[PurchaseMedicine]    Script Date: 17-05-2020 13:01:13 ******/
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
	
	begin try
	if(@NewFlag = 'Y')
	begin
	-- for new medicine create a medicine and then proceed to purchase
		declare @medid int 
		declare @comid varchar(20)	

		select @comid = [CompanyID] from [dbo].[Dealer] where [DealerID]= @DealerID

	    select @medid = isnull(max(cast(REPLACE([MedicineID],'M','') as INT)),0) from Medicine

		select @MedicineID = cast(@medid+1 as varchar) +'M'

		INSERT INTO Medicine([MedicineID],[MedicineName],[CompanyID],[Price],[Manufacturing],[Expiry],[CurrentQuantity])
		values(@MedicineID, @MedicineName, @comid, @Price, @MFD, @EXP, @Quantity)

	end
	else
	begin
	-- For existing medicine get the medicineid and price, also update the quantity
		select @MedicineID = [MedicineID] , @Price = [Price] from [dbo].[Medicine] where [MedicineName] = @MedicineName

		update [dbo].[Medicine] set [CurrentQuantity] = [CurrentQuantity] + @Quantity where [MedicineID] = @MedicineID
	end
	-- finally add to purchase

	    select @purchaseid = isnull(max(cast(REPLACE([PurchaseID],'P','') as INT)),0) from Purchase
	    set @purchaseid = @purchaseid+1

		INSERT INTO Purchase ([PurchaseID],[DealerID],[MedicineID],[PurchaseDate],[Quantity],[Totalprice])
		values(cast(@purchaseid as varchar) +'P', @DealerID, @MedicineID, @Date, @Quantity, @Quantity * @Price )

		select @result = 'Success|Purchase successful'
		end try
	   begin catch
		set @result = 'Error|' + ERROR_MESSAGE ( ) 
		end catch
END
GO

/****** Object:  StoredProcedure [dbo].[SellMedicine]    Script Date: 17-05-2020 13:01:13 ******/
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
	@CustomerName varchar(50), @MedicineID varchar(100), @Date date, @Quantity int, @Address varchar(100), @Contract numeric(11,0), @NewFlag varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @sellid INT
	declare @CustomerID int 
	declare @CurrQuantity INT
	declare @Price float 
	
	begin try
	if(@NewFlag = 'Y')
	begin
	-- for new customer create a customer and then proceed to sell
		
		declare @Cusid varchar(20)

	    select @Cusid = max(cast(REPLACE([CustomerID],'C','') as INT)) from Customers

		select @CustomerID = cast(@Cusid+1 as varchar) +'M'

		INSERT INTO Customers([CustomerID],[CustomerName],[Address],[ContactNo])
		values(@CustomerID, @CustomerName, @Address, @Contract)

	end
	else
	begin
	-- For existing customer get the customerid
		select @CustomerID = [CustomerID] from Customers where [CustomerName] = @CustomerName
	end
	-- finally add to sell

	    select @Price = [Price] from [dbo].[Medicine] where [MedicineID] = @MedicineID

	    select @sellid = max(cast(REPLACE([SellID],'S','') as INT)) from Sell

	    set @sellid = @sellid+1

		INSERT INTO Sell ([SellID],[CustomerID],[MedicineID],[SellDate],[Quantity],[Totalprice])
		values(cast(@sellid as varchar) +'S', @CustomerID, @MedicineID, @Date, @Quantity, @Quantity * @Price )

		update [Medicine] set [CurrentQuantity] = [CurrentQuantity] - @Quantity where [MedicineID] = @MedicineID

		select '1'
		end try
	   begin catch
		select '0'
		end catch
END
GO

/****** Object:  StoredProcedure [dbo].[SignUp]    Script Date: 17-05-2020 13:01:13 ******/
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


