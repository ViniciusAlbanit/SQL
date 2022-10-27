--Nome: Vinicius Farias Albanit RA: 2200420
--Nome: Gabryel Siqueira RA: 2200213
--Nome: Tarcisio Eugenio RA: 2200174
--Nome: Paulo Fusco RA: 2201405

select E.firstname + ' ' + E.lastname as 'Nome Completo do Vendedor',  count(distinct O.orderid)
as 'Quantidade de pedidos'
from HR.Employees as E join 
Sales.Orders as O on 
E.empid = O.empid join
Sales.OrderDetails as OD on 
O.orderid = OD.orderid join
Sales.Shippers as S on
O.shipperid = S.shipperid
where OD.qty > 15 and OD.unitprice < 64.92 and OD.discount > 0 and (S.phone like '(415%' or S.phone like '(503%')
and O.freight > 140.50 and O.freight < 350.64
group by E.firstname + ' ' + E.lastname
having count(distinct O.orderid) > 3 and count(distinct O.orderid) <= 6
order by count(distinct O.orderid) asc


