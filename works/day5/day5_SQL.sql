--PAIR-1 SQL Nortwind

--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
 select product_id , product_name, s.company_name , s.phone, units_in_stock from products p
 inner join suppliers s on s.supplier_id = p.supplier_id
 where p.units_in_stock = 0 
--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
 select ship_address,first_name , last_name , order_date from employees e 
 inner join orders o on e.employee_id = o.employee_id
 where order_date between '1998-03-01' and   '1998-03-31'
--28. 1997 yılı şubat ayında kaç siparişim var?
 select  count(*) from orders 
 where order_date between '1997-02-01' and   '1997-02-28'
--29. London şehrinden 1998 yılında kaç siparişim var?
 select count(*) from orders
 where order_date between '1998-01-01' and '1998-12-31' and ship_city= 'London'
--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
 select contact_name, phone, order_date from customers c inner join orders o on o.customer_id = c.customer_id
 where order_date between '1997-01-01' and '1997-12-31'
--31. Taşıma ücreti 40 üzeri olan siparişlerim
 select ship_name , freight from orders 
 where freight > 40
--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
 select freight, ship_city, contact_name from orders o 
 inner join customers c on o.customer_id = c.customer_id
 where freight > 40
--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),
  select order_date , ship_city, Upper(ship_name) as NameSurname from orders
  where order_date between '1997-01-01' and '1997-12-31'
--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
  select  c.contact_name AS "Contact Name", 
  REGEXP_REPLACE(c.phone, '[^0-9]', '', 'g') AS "Phone Number", o.order_date
  from customers c inner join orders o on o.customer_id = c.customer_id
  where o.order_date between  '1997-01-01' and '1997-12-31'
  --Çözüm 2
  select contact_name,phone,  CONCAT(SUBSTRING(phone, 0,7)) AS formatted_phone from customers c  
  inner join orders o  on o.customer_id=c.customer_id
  where order_date between '1997-01-01' and '1997-12-31'
--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
  select order_date,contact_name,first_name,last_name from orders o
  inner join customers c on c.customer_id=o.customer_id
  inner join employees e on e.employee_id=o.employee_id
--36. Geciken siparişlerim?
  select ship_name, required_date, shipped_date from orders
  where required_date < shipped_date
  order by required_date
--37. Geciken siparişlerimin tarihi, müşterisinin adı
  select shipped_date,contact_name from orders o 
  inner join customers c on c.customer_id=o.customer_id
  where shipped_date>required_date
--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
  select  products.product_name as urunAdi,  categories.category_name  as categoriAdi , 
  order_details.quantity as adet from products  
  inner join order_details on products.product_id = order_details.product_id
  inner join categories on categories.category_id =products.category_id
  where order_details.order_id = 10248
--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
  select product_name, company_name , order_id
  from suppliers inner join products on suppliers.supplier_id = products.supplier_id
  inner join order_details on products.product_id = order_details.product_id
  where order_details.order_id = 10248
--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
  select product_name as urunAdi , order_details.quantity as adet , order_date 
	from orders inner join employees  on  employees.employee_id = orders.employee_id
	inner join order_details on orders.order_id = order_details.order_id
	inner join products on order_details.product_id = products.product_id
	where employees.employee_id = 3 and orders.order_date between '1997-01-01' and '1997-12-31'	
--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
  select  employees.employee_id as calisanid, employees.first_name as adi,
	employees.last_name as soyadi , sum(order_details.quantity) as encoksatilan 
	from employees inner join orders on  employees.employee_id = orders.employee_id
	inner join order_details on orders.order_id = order_details.order_id
	where orders.order_date between '1997-01-01' and '1997-12-31'
	group by employees.employee_id , employees.first_name, employees.last_name 
	order by encoksatilan desc 
	LIMIT 1	 
--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
  select  employees.employee_id as calisanid, employees.first_name as adi,
	employees.last_name as soyadi , sum(order_details.quantity) as encoksatilan 
	from employees inner join orders on  employees.employee_id = orders.employee_id
	inner join order_details on orders.order_id = order_details.order_id
	where orders.order_date between '1997-01-01' and '1997-12-31'
	group by employees.employee_id , employees.first_name, employees.last_name 
	order by encoksatilan desc 
	LIMIT 1
--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
  select products.product_name as urunAdi,products.unit_price AS fiyat,
  categories.category_name as kategoriAdi 
	from products inner join categories on products.category_id = categories.category_id
  where products.unit_price = (select max(unit_price) from products);
--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
  select e.first_name , e.last_name, o.order_date, o.order_id
	from employees e inner join orders o  on o.employee_id = e.employee_id
	order by order_date	
--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
  select avg(order_details.unit_price) as ortalamafiyat , orders.order_id as siparisid 
  from orders inner join order_details on orders.order_id = order_details.order_id
  group by orders.order_id
  order by order_date desc
  limit 5   
--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
  select p.product_name , c.category_name, sum(od.quantity)
  from products p inner join categories c on p.category_id = c.category_id
  inner join order_details  od on  p.product_id = od.product_id
  inner join orders o on od.order_id = o.order_id
  where extract(month from o.order_date) = 1
  group by p.product_name, c.category_name
--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
  select * from order_details od
	where quantity > (select avg(quantity) from order_details)
--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
  select sum(order_details.quantity), products.product_name , categories.category_name , suppliers.company_name
	from products inner join categories on categories.category_id = products.category_id
	inner join suppliers on suppliers.supplier_id = products.supplier_id
	inner join order_details on  products.product_id = order_details.product_id
	group by products.product_name , categories.category_name , suppliers.company_name
	order by sum(order_details.quantity) desc limit 1
--49. Kaç ülkeden müşterim var
  select count(distinct Country) AS "Toplam Ülke Sayısı"  --distinct bir ülkeyi 1 kere sayar
  from customers;
--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
  select  sum(order_details.quantity) as adet , 
	employees.first_name as adi, employees.last_name as soyadi , employees.employee_id as calisanid
	from orders inner join employees  on  employees.employee_id = orders.employee_id
	inner join order_details on orders.order_id = order_details.order_id
	where employees.employee_id = 3 and order_date >= '1998-01-01' and order_date <= current_date --şimdiki zaman
	group by employees.first_name , employees.last_name, employees.employee_id
--51. Hangi ülkeden kaç müşterimiz var
  select country , count(customer_id)
	from customers 
	group by country
	order by count(customer_id) desc
--52. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
  select od.product_id,sum(unit_price*quantity) as yapilanciro,
  extract(month from order_date) sonucay from orders o 
  inner join order_details od on o.order_id = od.order_id
  where product_id = 10 group by od.product_id,extract(month from order_date)
  order by sonucay desc limit 3;
--53. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
  select   employees.employee_id, employees.first_name, employees.last_name , count(orders.order_id) as tss
  from employees inner join orders on employees.employee_id = orders.employee_id
  group by employees.first_name, employees.last_name , employees.employee_id
  order by tss desc
--54. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
  select customers.customer_id,customers.contact_name 
  from customers
  where customers.customer_id not in (select distinct customer_id from orders) limit 2;
--55. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
  select company_name,contact_name,address,city,country
  from customers where country = 'Brazil';
--56. Brezilya’da olmayan müşteriler
  select company_name,contact_name,address,city,country
  from customers where country != 'Brazil';
--57. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
  select country , company_name , contact_name 
  from customers where country = 'Spain' or country = 'France' or country = 'Germany'
--58. Faks numarasını bilmediğim müşteriler
  select company_name , contact_name , fax 
  from customers where fax is null
--59. Londra’da ya da Paris’de bulunan müşterilerim
  select city , company_name , contact_name 
  from customers where city = 'London' or city = 'Paris'
--60. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
  select contact_name , company_name ,city , contact_title  from customers
  where city = 'México D.F.' and contact_title = 'Owner'
--61. C ile başlayan ürünlerimin isimleri ve fiyatları
  select product_name , unit_price from products
  where product_name  ilike 'C%' 
--62. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
  select first_name , last_name, birth_date
	from employees where first_name like 'A%'
--63. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
  select company_name  from customers
	where company_name ilike '%restaurant%'
--64. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
  select product_name , unit_price 
	from products where unit_price between 50 and 100
--65. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
  select order_id , order_date from orders 
	where order_date between '1996-07-01' and '1996-12-31'
--66. Faks numarasını bilmediğim müşteriler
  select company_name , contact_name , fax 
  from customers where fax is null
--67. Müşterilerimi ülkeye göre sıralıyorum:
  select country , company_name from customers order by country 
--68. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
  select product_name , unit_price from products order by unit_price desc
--69. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
  select product_name , unit_price,  units_in_stock from products 
  order by units_in_stock asc, unit_price desc;
--70. 1 Numaralı kategoride kaç ürün vardır..?
  select  count(product_id), category_id  from products
  where category_id=1 group by category_id 
--71. Kaç farklı ülkeye ihracat yapıyorum..?
  select count(distinct country) from customers

-- Birbirinin aynısı olan sorular çıkartılmıştır.. 