use northwind;

#INNER JOIN
select *
from employees
inner join orders
on employees.employeeid = orders.employeeid;

#LEFT JOIN
select *
from employees
left join orders
on employees.employeeid = orders.employeeid;

#RIGHT JOIN
select *
from orders
right join customers
on customers.customerid = orders.customerid

#CROSS JOIN
select *
from orders
cross join customers
on customers.customerid = orders.customerid