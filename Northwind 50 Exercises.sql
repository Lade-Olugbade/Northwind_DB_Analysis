-- 1 Create a report that shows the CategoryName and Description from the categories table 
-- sorted by CategoryName.
select categoryname, `Description`
from categories
order by categoryname;

-- 2 Create a report that shows the ContactName, CompanyName, ContactTitle and 
-- Phone number from the customers table sorted by Phone.
select ContactName, Companyname, Contacttitle, phone
from customers
order by phone;

-- 3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.
select upper(Firstname) as firstname, upper(Lastname) as lastname, hiredate
from employees
order by hiredate desc;

-- 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, 
-- Freight from the orders table sorted by Freight in descending order.
select orderid, orderdate, shippeddate, customerid, freight
from orders
order by freight desc
limit 10;

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from 
-- the customers table.
select lower(customerid) as ID
from customers;

-- 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the 
-- suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
select Companyname, Fax, phone, Country, Homepage
from suppliers
order by country desc, companyname asc;

-- 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' 
-- only.
select companyname, contactname
from customers
where city = 'Buenos Aires';

-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are 
-- out of stock.
select Productname, unitprice, quantityperunit
from products
where UnitsInStock = '0';

-- 9. Create a report showing all the ContactName, Address, City of all customers not from 
-- Germany, Mexico, Spain.
Select contactname, Address, City, country
from customers
where country <> 'germany' and country != 'spain' and country <> 'mexico';

-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed 
-- on 21 May 1996.
select orderdate, shippeddate, customerid, freight
from orders
where orderdate = '1996-05-21';

-- 11. Create a report showing FirstName, LastName, Country from the employees not from 
-- United States.
select firstname, lastname, country
from employees
where not country = 'USA';

-- 12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate 
-- from all orders shipped later than the required date.
select employeeid, orderid, customerid, requireddate, shippeddate
from orders
where ShippedDate > requireddate;

-- 13. Create a report that shows the City, CompanyName, ContactName of customers from 
-- cities starting with A or B. 
select city, companyname, contactname
from customers
where city like 'A%' or city like 'B%';

-- 14. Create a report showing all the even numbers of OrderID from the orders table.
select orderid
from orders
where orderid %2 = 0;

-- 15. Create a report that shows all the orders where the freight cost more than $500.
select orderid, freight
from orders
where Freight > 5;

-- 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of 
-- all products that are up for reorder. */
select productname, unitsinstock, unitsonorder, reorderlevel
from products
where ReorderLevel >= '1'; 

-- 17. Create a report that shows the CompanyName, ContactName number of all customer that 
-- have no fax number.
select Companyname, Contactname, Phone
from customers
where fax is null;

-- 18. Create a report that shows the FirstName, LastName of all employees that do not report 
-- to anybody.
select Firstname, Lastname
from employees
where ReportsTo is null;

-- 19. Create a report showing all the odd numbers of OrderID from the orders table.
select OrderID as Odd_Number_OrderIDs
from orders
where orderid %2 <> 0
order by orderid;

-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers 
-- that do not have Fax number and sorted by ContactName.
select companyname, contactname, fax
from customers
where fax is null
order by contactname;

-- 21. Create a report that shows the City, CompanyName, ContactName of customers from cities 
-- that has letter L in the name sorted by ContactName. 
Select City, Companyname, contactname
from customers
where city like '%L%'
order by ContactName;

-- 22. Create a report that shows the FirstName, LastName, BirthDate of employees born 
-- in the 1950s.
select firstname, lastname, Birthdate
from employees
where year(birthdate) between '1950' and '1959';

-- 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year 
-- from the employees table.
select firstname, lastname, year(birthdate) as Birth_Year
from employees;

-- 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from 
-- the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. 
-- HINT: you will need to use a Groupby statement.
select orderid, count(orderid) as NumberofOrders
from `order details`
group by orderid
order by numberoforders desc;

-- 25. Create a report that shows the SupplierID, ProductName, CompanyName from all 
-- product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux 
-- sorted by the supplier ID

Select products.SupplierID, ProductName, Companyname
from products
join suppliers
on products.supplierid = suppliers.SupplierID
where companyname = 'Exotic Liquids' or companyname = 'Specialty Biscuits, Ltd.'
or companyname ='Escargots Nouveaux'
order by SupplierID;

-- 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, 
-- ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
select ShipPostalCode, OrderID, Orderdate, RequiredDate, Shippeddate, ShipAddress
from orders
where ShipPostalCode like '98124';

-- 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers 
-- that the has no "Sales" in their ContactTitle.
select  contactname, contacttitle, companyname
from customers
where ContactTitle not like '%Sales%';

-- 28. Create a report that shows the LastName, FirstName, City of employees in 
-- cities other "Seattle";
select Lastname, Firstname, City
from employees
where not city = 'seattle';

-- 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers 
-- in any city in Mexico or other cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country 
from customers
where Country = 'Mexico' or country = 'Spain' and city not like '%madrid%';

-- 30. Create a select statement that outputs the following:
-- to create the table, we use Concatenate function as follows

select concat(firstname, ' ', lastname, ' can be reached at x', Extension) as Contactinfo
from employees;

select firstname as contactinfo
from employees

-- 31. Create a report that shows the ContactName of all customers that do not have 
-- letter A as the second alphabet in their Contactname.
select contactname 
from customers
where contactname not like '_A%';

-- 32. Create a report that shows the average UnitPrice rounded to the next whole number, 
-- total price of UnitsInStock and maximum number of orders from the products table. 
-- All saved as AveragePrice, TotalStock and MaxOrder respectively.
select round(avg(UnitPrice)) as AveragePrice, sum(unitsinstock * unitprice) 
as TotalStock, max(unitsonorder) as MaxOrders
from products;

-- 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName 
-- and UnitPrice from the products, suppliers and categories table.
select s.SupplierID, s.Companyname, c.categoryname, p.productname, p.unitprice
from suppliers s
join products p
on s.supplierid = p.supplierid 
join categories c
on p.categoryid = c.CategoryID;

-- 34. Create a report that shows the CustomerID, sum of Freight, from the orders table 
-- with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a 
-- Groupby and a Having statement.
select CustomerID, sum(freight) as Total_Freight
from orders
group by customerid
Having Total_Freight > 200;

-- 35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, 
-- Discount from the order details, orders and customers table with discount given on 
-- every purchase.
select od.orderid, c.contactname, od.unitprice, od.quantity, od.discount
from `order details` od
join orders o
on od.orderid = o.orderid
join customers c
on o.customerid = c.CustomerID
where discount <> 0;

-- 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, 
-- and the LastName and FirstName of who they report to as manager from the employees 
-- table sorted by Employee ID. HINT: This is a SelfJoin.
select e.EmployeeID, concat(e.Lastname, ' ', e.Firstname) as Employee,  
concat(m.Lastname, ' ', m.Firstname) as Manager
from employees e
left join employees m
on e.ReportsTo = m.employeeid
order by employeeid;

-- 37. Create a report that shows the average, minimum and maximum UnitPrice of all products 
--  as AveragePrice, MinimumPrice and MaximumPrice respectively.
select avg(unitprice) as AveragePrice, min(UnitPrice) as MinimumPrice, Max(Unitprice) as MaximumPrice
from products;

-- 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, 
-- ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, 
-- ShippedDate from the customers and orders table. HINT: Create a View.

create view CustomerInfo as
select c.Customerid, c.Companyname, c.contactname, c.contacttitle, c.address, c.city, c.country, 
c.phone, o.orderdate, o.requireddate, o.shippeddate
from customers c
join orders o
on c.customerid = o.CustomerID;

-- 39. Change the name of the view you created from customerinfo to customer details.
create view Customer_Details as
select c.Customerid, c.Companyname, c.contactname, c.contacttitle, c.address, c.city, c.country, 
c.phone, o.orderdate, o.requireddate, o.shippeddate
from customers c
join orders o
on c.customerid = o.CustomerID;

-- 40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, 
-- CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, 
-- ReorderLevel, Discontinued from the supplier, products and categories tables. 
-- HINT: Create a View
Create view ProductDetails as
select p.ProductID, s.Companyname, p.ProductName, c.CategoryName, c.`Description`, p.QuantityperUnit, 
p.UnitPrice, p.UnitsinStock, p.unitsonorder, p.reorderlevel, p.discontinued
from suppliers s
join products p
on s.supplierid = p.supplierid
join categories c
on p.categoryid = c.CategoryID;

-- 41. Drop the customer details view.
drop view customer_details;

-- 42. Create a report that fetch the first 5 character of categoryName from the category tables 
-- and renamed as ShortInfo
 SELECT SUBSTRING(Categoryname, 1 ,5) AS ShortInfo
	 FROM
	 Categories;
     
-- 43 Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers 
-- data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.
create table Shippers_Duplicate like shippers;
insert into shippers_duplicate select * from shippers;

-- 44. Create a select statement that outputs the following from the shippers_duplicate Table:

Alter table shippers_duplicate
add Email varchar (150);
 UPDATE Shippers_duplicate SET Email = 'speedyexpress@fake.com' where ShipperId = 1; 
	 UPDATE Shippers_duplicate SET Email = 'unitedpackage@fake.com' where ShipperId = 2;
	 UPDATE Shippers_duplicate SET Email = 'federalshipping@fake.com' where ShipperId = 3;
	 SELECT * FROM Shippers_duplicate;

-- 45. Create a report that shows the CompanyName and ProductName from all product in the 
-- Seafood category.
select s.Companyname, p.ProductName
from products p
join categories c
on p.CategoryID = c.CategoryID
join suppliers s
on p.SupplierID = s.SupplierID
where c.categoryname = 'seafood';

-- 46. Create a report that shows the CategoryID, CompanyName and ProductName from all product 
-- in the categoryID 5.
select CategoryID, Companyname, Productname
from products p
join suppliers s
on s.supplierid = p.SupplierID
where categoryid = '5';

-- 47. Delete the shippers_duplicate table.
drop table shippers_duplicate;

-- 48. Create a select statement that ouputs the following from the employees table.
-- NB: The age might differ depending on the year you are attempting this query.
Select Lastname, Firstname, Title, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), birthdate)), '%Y') + 0 AS age
from employees;

-- 49. Create a report that the CompanyName and total number of orders by customer renamed 
-- as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
select companyname, count(o.orderid) as number_of_orders
from orders o
join customers c
on c.customerid = o.customerid
where orderdate >= '1994-12-31' 
group by CompanyName
having number_of_orders > 10;

-- 50. Create a select statement that ouputs the following from the product table
-- NB: It should return 77rows.

select concat(productname, ' ','weighs/is', ' ', quantityperunit, ' ', 'and cost', ' ', '$', round(unitprice)) as ProductInfo
from products;

/*Congratulations!!!!, you have successfully become proficient in writing and extracting business queries from a data base.
*/
