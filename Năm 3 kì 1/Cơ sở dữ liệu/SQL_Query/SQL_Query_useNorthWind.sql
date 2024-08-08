use northwind;

#1.Truy vấn các thành phố khác nhau xuất hiện trong bảng Customers
select distinct(City) from customers;

#2.Liệt kê những khách hàng sống tại Berlin trong bảng Customers
select * from customers
where City = 'Berlin';

#3.Liệt kê những khách hàng không sống tại Berlin trong bảng Customers
select * from customers
where City != 'Berlin';

#4.Liệt kê những khách hàng sống tại thành phố London và có mã khách hàng là số chẵn
select * from customers
where City = 'London' and CustomerID % 2 = 0;

#5.Liệt kê những khách hàng có tên bắt đầu bằng chữ A
select * from customers
where CustomerName regexp '^[a]';

#6. Liệt kê những khách hàng có tên bắt đầu bằng chữ A, B hoặc D
select * from customers
where CustomerName regexp '^[abd]';

#7. Liệt kê những khách hàng có tên bắt đầu bằng chữ A và kết thúc bằng chữ e
select * from customers
where CustomerName like 'A%e';

#8. Liệt kê những khách hàng có tên có độ dài tối thiểu là 25
select * from customers
where length(CustomerName) >= 25;

#9. Liệt kê những khách hàng có tên kết thúc bởi “sen”
select * from customers
where CustomerName like '%sen';

#10. Liệt kê những khách hàng có tên bắt đầu bởi “cen”
select * from customers
where CustomerName like 'cen%';

#11. Liệt kê những khách hàng có tên có thứ tự từ điển lớn hơn “Harani Canes”
select * from customers
where CustomerName > 'Harani Canes';

#12.Liệt kê nhân viên sinh năm 1968
select * from employees
where year(birthdate) = 1968;

#13. Liệt kê nhân viên sinh vào tháng 2
select * from employees
where month(birthdate) = 2;

#14. Liệt kê nhân viên sinh ngày mồng 2
select * from employees
where day(birthdate) = 2;

#15.Liệt kê khách hàng trong tên chứa cụm “ar”
select * from customers
where CustomerName like '%ar%';

#16.Liệt kê khách hàng có tên bắt đầu bằng “B” và kết thúc bằng “e”
select * from customers
where CustomerName like 'B%e';

#17. Liệt kê khách hàng có chữ cái thứ 2 trong tên là chữ “r”
select * from customers
where CustomerName like '_r%';

#18. Liệt kê khách hàng có chữ cái thứ 3 từ cuối về trong tên là chữ “h”
select * from customers
where CustomerName like '%h___';

#19. Liệt kê khách hàng có tên bắt đầu bằng 1 trong các chữ cái ‘a’, ‘b’, ‘h’, ‘d’
select * from customers
where CustomerName regexp '^[abhd]';

#20. Liệt kê khách hàng có tên kết thúc bằng 1 trong các chữ cái ‘a’, ‘b’, ‘h’, ‘d’
select * from customers
where CustomerName regexp '[abhd]$';

#21.Liệt kê những khách hàng và thông tin đơn hàng đã đặt hàng vào tháng 7 năm 1996
select * from customers, orders
where customers.CustomerID = orders.CustomerID
	and OrderDate like '1996-07%';
    
#22. Liệt kê những khách hàng và thông tin đơn hàng đã đặt hàng vào tháng 12 năm 1996 và sống tại Mỹ
select * from customers, orders
where customers.CustomerID = orders.CustomerID
	and OrderDate like '1996-12%'
    and Country = 'UK';

#23. Liệt kê những khách hàng và thông tin đơn hàng đã đặt hàng sau ngày 09-10-1996 và sống tại London
select * from customers, orders
where customers.CustomerID = orders.CustomerID
	and OrderDate > '1996-10-09'
    and City = 'London';

#24. Liệt kê những khách hàng đã đặt hàng vào tháng 10 năm 1996 và được ship bởi shipper có ID là 3
select customers.* from customers as C, orders as O
where C.CustomerID = O.CustomerID
	and OrderDate like '1996-10%'
    and ShipperID = 3;

#25. Liệt kê những khách hàng và thông tin đơn hàng được xử lý bởi nhân viên có ID là 4
select * from customers as C, orders as O
where C.CustomerID = O.CustomerID
    and EmployeeID = 4;
    
#26.Liệt kê thông tin những đơn hàng được xử lý bởi nhân viên có FirstName là “Nancy”
select orders.* from orders as O, employees as E
where E.EmployeeID = O99.EmployeeID
    and FirstName = 'Nancy';
    
#27.Liệt kê những sản phẩm được mua trong đơn hàng có ID là 10249
select products.* from orderdetails as o, products as p
where o.OrderID = 10249
	and o.ProductID = p.ProductID;
    
