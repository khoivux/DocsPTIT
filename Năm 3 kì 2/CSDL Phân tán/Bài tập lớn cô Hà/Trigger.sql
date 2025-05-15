USE QLCH
GO

create trigger [dbo].[CHECK_INVENTORY]
ON [dbo].[OrderDetail]
INSTEAD OF INSERT
AS 
BEGIN
	DECLARE @orderID VARCHAR(255),
			@productID VARCHAR(255),
            @quantity INT,
            @branchID VARCHAR(255),
            @available_quantity INT;

    -- Lấy thông tin từ bảng inserted
    SELECT @orderID = Order_ID,
		   @productID = Product_ID,
           @quantity = od_quantity
    FROM inserted;

	SELECT @branchID = e.Branch_ID
	from [Order] o
	join employee e on e.ID = o.Employee_ID
	where o.ID = @orderID;

	SELECT @available_quantity = inventory.i_quantity
	from inventory 
	where inventory.Product_ID = @productID and inventory.Branch_ID = @branchID;

	IF @available_quantity IS NULL OR @quantity > @available_quantity
		Begin
			Raiserror('KHO KHÔNG CÒN MẶT HÀNG MÃ %s!', 16, 1, @productID);
			ROLLBACK TRANSACTION;
			RETURN;
		END

	INSERT INTO dbo.orderdetail (ID, od_quantity, Product_ID, Order_ID)
    SELECT ID, od_quantity, Product_ID, Order_ID
    FROM inserted;
END;
GO

create trigger [dbo].[UPDATE_QUANTITY]
ON [dbo].[OrderDetail]
AFTER INSERT
AS 
BEGIN
	DECLARE @orderID VARCHAR(255),
			@productID VARCHAR(255),
            @quantity INT,
            @branchID VARCHAR(255),
			@price INT

    -- Lấy thông tin từ bảng inserted
    SELECT @orderID = Order_ID,
		   @productID = Product_ID,
           @quantity = od_quantity
    FROM inserted;

	SELECT @branchID = e.Branch_ID
	from [Order] o
	join employee e on e.ID = o.Employee_ID
	where o.ID = @orderID;

	SELECT @price = p_cost FROM [product] WHERE product.ID = @productID;

	UPDATE [dbo].[order]
	SET o_total = o_total + @price * @quantity
	WHERE [order].id = @orderID;

	UPDATE [inventory]
	SET i_quantity = i_quantity - @quantity
	where inventory.Product_ID = @productID and inventory.Branch_ID = @branchID;
	PRINT('THEM THANH CONG')
END;
GO

create trigger [dbo].[DELETEE_ORDER]
ON [dbo].[Order]
INSTEAD OF DELETE
AS 
BEGIN
	DECLARE @orderID VARCHAR(255),
			@productID VARCHAR(255),
            @quantity INT,
			@price INT

    SELECT @orderID = ID
    FROM deleted;

	UPDATE i
	SET i.i_quantity = i.i_quantity + od.od_quantity
	FROM inventory i
	join orderdetail od on i.Product_ID = od.Product_ID
	join [order] o on o.ID = od.Order_ID
	where i.Branch_ID = 'TSHN' and o.ID = @orderID

	DELETE od
    FROM orderdetail od
    JOIN deleted d ON od.Order_ID = d.ID;

	 -- Xóa đơn hàng chính
    DELETE o
    FROM [order] o
    JOIN deleted d ON o.ID = d.ID;
END;

insert into [dbo].[orderdetail](id, od_quantity, Order_ID, Product_ID)
values('HNOD005', 1, 'HNORD001', 'PR002');
GO
-- khi nào bán hàng thì hiển thị số hàng mà nv bán
create trigger [dbo].[DISPLAY_QUANTITY]
ON [dbo].[OrderDetail]
AFTER insert
as
begin
	DECLARE  @branchID VARCHAR(255)

	SELECT @branchID = e.Branch_ID
	from [Order] o
	join employee e on e.ID = o.Employee_ID
	where o.ID = (SELECT Order_ID from inserted);

	SELECT 
        e.ID,
        e.e_name AS Employee,
        ISNULL(SUM(o.od_quantity), 0) AS Sold
    FROM employee e
    LEFT JOIN [order] ord ON e.ID = ord.Employee_ID
    LEFT JOIN orderdetail o ON o.Order_ID = ord.ID
	WHERE e.Branch_ID = @branchID
    GROUP BY e.ID, e.e_name;
end;
GO

insert into [dbo].[orderdetail](id, od_quantity, Order_ID, Product_ID)
values('HNOD001', 1, 'HNORD001', 'PR002');
GO

-- Viết trigger kiểm tra khi xóa 1 khách hàng thì điều kiện nó chưa có hóa đơn thì mới đc xóa 
create trigger [dbo].[DELETE_CUSTOMER]
on [dbo].[customer]
instead of DELETE
as
begin
	declare @customerID varchar(255)
	SELECT  @customerID = ID from deleted
	if exists (
		select 1
		from [order] o
		where o.Customer_ID = @customerID 
	)
	BEGIN 
		RAISERROR('KHONG THE XOA VI KHACH HANG CO DON HANG LIEN QUAN', 16, 1)
		ROLLBACK TRANSACTION
		return
	END

	delete [dbo].[customer]
	where id = @customerID;
end;

delete [dbo].[customer]
where id = 'CU0';

use QLCH
go
create trigger trg_displayTotal
on [dbo].[orderdetail]
after insert
as
begin
 select e.id as ID,
 e.e_name as employeeName,
 isnull(sum(od.od_quantity), 0) as totalProduct
 from employee e
 left join [order] o on o.Employee_ID = e.ID
 left join [orderdetail] od on od.Order_ID = o.ID
 group by e.id, e.e_name
end

CREATE PROCEDURE sp_TopNhanVienBanNhieuNhatTheoThang
AS
BEGIN
    SELECT 
        e.ID AS MaNhanVien,
        e.e_name AS TenNhanVien,
        MONTH(o.o_time) AS Thang,
        YEAR(o.o_time) AS Nam,
        SUM(od.od_quantity) AS TongSoLuongBan
    FROM employee e
    JOIN [order] o ON e.ID = o.Employee_ID
    JOIN orderdetail od ON o.ID = od.Order_ID
    GROUP BY e.ID, e.e_name, MONTH(o.o_time), YEAR(o.o_time)
    HAVING SUM(od.od_quantity) = (
        SELECT MAX(SL)
        FROM (
            SELECT 
                SUM(od2.od_quantity) AS SL
            FROM employee e2
            JOIN [order] o2 ON e2.ID = o2.Employee_ID
            JOIN orderdetail od2 ON o2.ID = od2.Order_ID
            WHERE MONTH(o2.o_time) = MONTH(o.o_time) AND YEAR(o2.o_time) = YEAR(o.o_time)
            GROUP BY e2.ID
        ) AS Sub
    )
    ORDER BY Nam DESC, Thang DESC;
END

exec  sp_TopNhanVienBanNhieuNhatTheoThang
go

CREATE TRIGGER dbo.addOdPrintAllEmpOrder
   ON  dbo.[order]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @empID varchar(50), @total decimal(20,2);

	declare empCursor cursor for select ID from dbo.employee
	open empCursor

	fetch next from empCursor into @empID
	if @@FETCH_STATUS <> 0
		print('end')

	while @@FETCH_STATUS = 0
	begin
		set @total = (select count(*) from dbo.[order] 
						where Employee_ID = @empID);
		print @empID + N' :' + cast(@total as varchar(50)) ;
		fetch next from empCursor into @empID
	end
	close empCursor
	deallocate empCursor
    -- Insert statements for trigger here

END
GO