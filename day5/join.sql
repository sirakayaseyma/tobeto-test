---join
--inner join
--hangi ürün hangi kategoride
select products.product_name, categories.category_name from products
inner join categories on products.category_id = categories.category_id

--hangi sipariş hangi kargo şirketiyle ne zaman gönderilmiştir?
--- orders ve shippers tablosu üzerinde ilişki kurmam gerekiyor
--- tablolar arasındaki bağlantıyı görmek için ilgili tabloya sağ tık properties yapıp contraints kısmına
---gelip oradan Foreign key seçeneğinden bağlantıları görebilirim..

select o.order_id, s.company_name, o.order_date 
from orders o inner join shippers s on o.ship_via = s.shipper_id

--Hangi siparişi hangi çalışan almış hanhi müşteri vermiştir?
-- orders - employees - customers
select * from orders o  -- employees'in leftine kalıyor
inner join employees e on  o.employee_id = e.employee_id --orders'ın rigt kısmına ve customers'ın leftine kalıyor
inner join customers c on o.customer_id = c.customer_id -- employees 'ın righ kısmına kalıyor

--Left join soldaki tabloyu baz alacağım ve soldakai tablonun tüm verilerini getiriyor.
-- eğer sağda eşleşmeyen durum varsa onları null getiriyor. Durum olmayadabilir.
-- Çalışanın adı ve müşterilerden aldığı siparişleri ve tarihleri listeleyelim
select employees.first_name , order_id , order_date from employees 
left join orders on employees.employee_id = orders.employee_id

--right joinde de sağdaki tablonun tüm durumları getiriyorum. 
--eğer eşleşmeyen bir durum varsa null diyorum.Durum olmayadabilir.
select employees.first_name , order_id , order_date from employees 
right join orders on employees.employee_id = orders.employee_id

--full outer join  verilerin tamamını getirir.
select c.contact_name, o.order_id from customers c
full outer join orders o on c.customer_id = o.customer_id


--group by 
-- her grubun toplam sipariş miktarını listeleyelim
select product_id , SUM(quantity) from order_details
group by product_id

--hangi kategoride kaç ürün var?
select category_name, Count(*) from products p
inner join categories c on p.category_id = c.category_id
group by category_name

--hangi ülkeye ne kadarlık satış yapılmış?
select c.country,SUM(od.quantity*od.unit_price)
from customers c
inner join orders o
on c.customer_id= o.customer_id
inner join order_details od
on o.order_id = od.order_id
group by c.country
order by 2 desc

--diğer çözüm yöntemi 
select o.ship_country, Sum(od.quantity * od.unit_price) as total_price from orders o 
inner join order_details od on o.order_id = od.order_id
group by o.ship_country
order by total_price desc

--having => where gibi filtreleme işlemleri yapar. 
-- toplam sipariş miktarı 1300 adetten fazla olan ürün kodlarını gösterin?
select product_id, sum(quantity) from order_details 
group by product_id
having sum(quantity) > 1300


-- stok sayıyı 20den fazla toplam ürün sayıyı da 1den fazla olan kategorileri gösterin?
-- where de kolon tabloda olabilir , havingde ram üzerinde bir filtreleme yapılabilit
select category_id , units_in_stock , count(*) from products 
where units_in_stock > 20
group by category_id , units_in_stock
having count(*) > 1

-- 250 adetten fazla satılan ürünleri göster
select p.product_name, sum(quantity)
from products p
inner join order_details  od ON p.product_id = od.product_id
group by p.product_name
having sum(quantity) > 250
order by sum(quantity) desc




