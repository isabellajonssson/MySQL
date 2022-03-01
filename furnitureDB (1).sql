-- drop database furnitureStore; 
create database furnitureStore;
use furnitureStore;

select * from staff;
select * from customer;
select * from products;
select * from purchaseorder;
select * from orders;
select * from supplieorder;
select * from supplier;
select * from payment;
-- delete from customer where idcustomer <=5;
-- delete from staff where staffid <=70;
-- delete from supplieorder where idsupplieorder <=70;
-- delete from payment where FKidpurchase =2;
-- delete from orders where FKpurchaseorder =9;
-- delete from purchaseorder where idpurchaseorder =2;
-- checking if keys work
select firstname, surname, idstaff from staff inner join purchaseorder on 
purchaseorder.FKseller=staff.idstaff where idstaff = '8';
select productname, price, idproducts from products inner join purchaseorder on 
products.idproducts=purchaseorder.product; 
select firstname, surname, telephone, idcustomer from customer inner join purchaseorder on
purchaseorder.customer=customer.idcustomer;
select firstname, surname, telephone, idcustomer from customer inner join purchaseorder on 
purchaseorder.customer=customer.idcustomer where idpurchaseorder='8';
-- Rapportering för en månad
select supplieorderdate, quantity, orderamount, FKproduct from supplieorder where 
MONTH(supplieorderdate) = 2;

-- purchaseorder in stored procedure
-- purchasedate date, quantity int, payment varchar, FKseller int, FKproduct int , FKcustomer int
call furniturestore.purchaseorder('2022-02-16','5','INTERNET','9','2','5');
-- supplieorder transaction in stored procedure
-- orderdate date, quantity int, FKbuyer int, FKproduct int , FKsupplier int
call furniturestore.supplieorder('2022-02-16','2','8', '2','1');
-- order transaction in stored procedure
-- delieverydate date, delieverd varchar(50)
call furniturestore.order('2022-02-25', 'NO');
-- new customer
-- firstname varchar(40), surname varchar(40), adress varchar(50), personalnumber bigint, telephone bigint, email varchar(40), cardnumber bigint
call furniturestore.newCustomer('Long', 'Ben', 'Gronalund', '2323232323', '0701111111', 'long@email.com',
'4444555545454545');
call furniturestore.viewCustomers;
-- firstname varchar(40), surname varchar(40), adress varchar(50), personalnumber bigint, telephone bigint, email varchar(40)
call furniturestore.newStaff('Boll', 'Plank', 'Garden', '9999999999', '0702222222', 'boll@email.com');
call furniturestore.viewStaff;

-- View on purchaseorder and products
-- drop view purchaseOrderWithProductInfo;
create view purchaseOrderWithProductInfo as select idpurchaseorder, purchaseorderdate, quantity, orderamount, FKproduct,
idproducts, productname, category, price from purchaseorder, products where 
purchaseorder.FKproduct = products.idproducts;
select * from purchaseOrderWithProductInfo;
-- View on orders not delieverd yet with info on customer
create view ordersNotDelieverd as select idpurchaseorder, purchaseorderdate, orderamount, quantity, 
FKcustomer, FKpurchaseorder, delieverydate, delieverd, adress, telephone, firstname from purchaseorder
, orders, customer where (orders.FKpurchaseorder = purchaseorder.idpurchaseorder)
and delieverd = 'NO' and purchaseorder.FKcustomer = customer.idcustomer;
select * from ordersNotDelieverd;
-- drop view ordersNotDelieverd;
-- drop view customerAllPurchases;
create view customerAllPurchases as select FKcustomer, firstname, surname, idcustomer, SUM(orderamount) as totalPurchase  from purchaseorder, 
customer where FKcustomer = idcustomer group by FKcustomer;
select * from customerAllPurchases;
drop view purchaseWithOrderandSupplieOrder;
create view purchaseWithOrderandSupplieOrder as select idpurchaseorder, purchaseorderdate, purchaseorder.delieverydate as POdelievery, 
purchaseorder.quantity, purchaseorder.FKproduct as POidproduct, FKpurchaseorder as idPorder, orders.delieverydate as Odelievery, 
delieverd, idsupplieorder, supplieorderdate, supplieorder.delieverydate as SOdelievery, supplieorder.FKproduct as SOidproduct,
productname, category, idproducts, FKorder, idorder 
from purchaseorder, orders, supplieorder, products where idpurchaseorder = FKpurchaseorder and idorder = FKorder 
and purchaseorder.FKproduct = products.idproducts group by idsupplieorder;
select * from purchaseWithOrderandSupplieOrder;