select top 20 custid from sales.customers order by custid desc;

select DISTINCT country, custid, contactname, city from sales.customers where country in ('Argentina', 'Brazil', 'Venezuela')

select custid, contactname, fax from sales.customers where fax is not null order by custid desc;

select custid, city, country, region from sales.customers where region is null order by city desc, country asc;