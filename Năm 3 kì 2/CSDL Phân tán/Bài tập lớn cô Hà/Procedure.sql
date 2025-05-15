USE QLCH
GO
CREATE procedure INVENTORY_SUMMARY
	@BranchID varchar(255)
AS
begin
	select
		p.p_name as ProductName,
		i.i_quantity as Quantity
	from inventory i
	join product p on i.Product_ID = p.ID
	where i.Branch_ID = @BranchID
end;

exec INVENTORY_SUMMARY
	@BranchID = 'TSHD';
go

CREATE PROCEDURE REVENUE_BY_EMPLOYEE
AS
BEGIN
    SELECT 
        e.e_name AS EmployeeName,
        b.b_name AS Branch,
        COUNT(o.ID) AS TotalOrders,
        ISNULL(SUM(o.o_total), 0) AS Total
    FROM employee e
    LEFT JOIN branch b ON b.ID = e.Branch_ID
    LEFT JOIN [order] o ON o.Employee_ID = e.ID
    GROUP BY e.e_name, b.b_name
    ORDER BY b.b_name, e.e_name;
END;
exec REVENUE_BY_EMPLOYEE
go

-- top san pham ban chay nhat
CREATE PROCEDURE TOP_PRODUCT
AS
BEGIN 
    SELECT
        p.p_name AS ProductName,
        SUM(od.od_quantity) AS Quantity
    FROM product p
    JOIN orderdetail od ON od.Product_ID = p.ID
    GROUP BY p.p_name
    ORDER BY SUM(od.od_quantity) DESC;
END;
exec TOP_PRODUCT;

create procedure TOP_EMPLOYEE
	
as
end;

create procedure EMPLOYEE_MONTH
	@month int,
	@year int
as
begin
	select 
		e.ID,
		e.e_name as Employee,
		sum(od.od_quantity) as Quantity
	from employee e
	join [order] o on o.Employee_ID = e.ID
	join orderdetail od on od.Order_ID = o.ID
	where MONTH(o.o_time) = @month and YEAR(o.o_time) = @year 
	group by e.e_name, e.ID
	order by sum(od.od_quantity) desc
end;

exec EMPLOYEE_MONTH
@month = 5, @year = 2025

use QLCH
go


create procedure c2
 @orderID varchar(255),
 @o_total decimal(18, 2),
 @eID varchar(255),
 @cuID varchar(255),
 @requestQuantity int,
 @ProductID varchar(255),
 @odid varchar(255)
as
begin
 declare @AvailableQuantity int
 select @AvailableQuantity = i_quantity from inventory where Product_ID = @ProductID
 if @AvailableQuantity < @requestQuantity
 begin
  raiserror('Khong du hang ton kho',16, 1)
  return
 end
 set xact_abort on
 begin transaction
 begin try
  insert into [order] (id, o_time, o_total, Customer_ID, Employee_ID)
  values (@orderID, getdate(), @o_total, @cuID, @eID)

  insert into [orderdetail](id, od_quantity, Order_ID, Product_ID)
  values (@odid, @requestQuantity, @orderID, @ProductID)

  update [inventory] set i_quantity = i_quantity - @requestQuantity
  where Product_ID = @ProductID
 commit transaction
 print('successfully')
 end try
 begin catch
  if @@TRANCOUNT > 0
  rollback transaction
  print('Loi ' + ERROR_MESSAGE())
 end catch
end
go;

create procedure INSERT_ORDER
	@orderId varchar(255),
	@cuId varchar(255),
	@eId varchar(255)
as
begin
	insert into [order] (id, o_time, o_total, Customer_ID, Employee_ID)
	values (@orderID, getdate(), 0, @cuID, @eID)
end;
go
exec INSERT_ORDER
@orderId = 'HNORD002', @cuID = 'CU004', @eId = 'HNE001'
go

create procedure INSERT_ORDERDETAIL
	 @requestQuantity int,
	 @ProductID varchar(255),
	 @orderID varchar(255),
	 @odID varchar(255)
as 
begin 
	set xact_abort on
	 begin transaction
	 begin try
		declare @AvailableQuantity int,
		@price int
		select @AvailableQuantity = i_quantity from inventory where inventory.Product_ID = @ProductID and inventory.Branch_ID = 'TSHN'
		PRINT @AvailableQuantity;
		if @AvailableQuantity < @requestQuantity
		begin

			raiserror('Khong du hang ton kho',16, 1)
			return
		end

		insert into [orderdetail](id, od_quantity, Order_ID, Product_ID)
		values (@odID, @requestQuantity, @orderID, @ProductID)

		select @price = p_cost from product where product.ID = @ProductID

		update [order] 
		set o_total = o_total + @price * @requestQuantity
		where id = @orderID

		update [inventory] set i_quantity = i_quantity - @requestQuantity
		where Product_ID = @ProductID

	 commit transaction
	 print('successfully')
	 end try
	 begin catch
	  if @@TRANCOUNT > 0
	  rollback transaction
	  print('Loi ' + ERROR_MESSAGE())
 end catch

end;

exec INSERT_ORDERDETAIL
@requestQuantity = 1, @ProductID = 'PR001',@orderID =  'HNORD001', @odID = 'HNOD014'
