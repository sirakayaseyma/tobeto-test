--- EXISTS / NOT EXISTS (mevcut mu?)

--ürün fiyatı 20den küçük olan tedarikçileri listeleyin?
select company_name  from suppliers 
where exists (select product_name from products 
			 where suppliers.supplier_id = products.supplier_id
			 and unit_price <20)
			 
select company_name  from suppliers 
where not exists (select product_name from products 
			 where suppliers.supplier_id = products.supplier_id
			 and unit_price = 20)
select distinct company_name from suppliers s inner join products
p on s.supplier_id = p.supplier_id
where p.unit_price != 20

-- '3/5/1998' ile '4/5/1998' tarihleri arasında sipariş almış çalışanları listeliyoruz?
select * from employees e 
where exists (select * from orders o 
			where o.employee_id = e.employee_id
			and o.order_date between '3-5-1998' and '4-5-1998' )

select * from employees e 
where exists (select * from orders o 
			where o.employee_id = e.employee_id
			and o.order_date between '3/5/1998' and '4/5/1998' )

select * from employees


--ALL =>Mantıksal operatörlerden biri
--Tüm alt sorgu degerleri koşulu sağlıyorsa => true

select product_name from products 
where product_id = all(select distinct product_id from order_details
					  where quantity = 10)
					  
--ANY => tüm alt sorgu değerlerinden ziyade herhangi biri koşulu sağlıyorsa benim için true anlamına gelir
select product_name from products 
where product_id = any(select product_id from order_details
					  where quantity>99)
					  
					  
  select order_id , avg(od.unit_price * od.quantity ) 
  from order_details od
  group by od.order_id
  order by od.order_id desc
  limit 5   
  
  SELECT DISTINCT o.order_date,  c.contact_name, translate(phone, '()-. ','') AS telephone 
FROM orders o 
INNER JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '1997-01-01' AND '1997-12-31' ORDER BY c.contact_name

