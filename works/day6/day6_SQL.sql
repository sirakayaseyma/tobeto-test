--86. a.Bu ülkeler hangileri..?
      select distinct ship_country from orders
--87. En Pahalı 5 ürün
      select * from products
      order by unit_price desc
      limit 5
--88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
      select Count(order_id) from orders o
      inner join customers c on c.customer_id = o.customer_id
      where c.customer_id = 'ALFKI'
--89. Ürünlerimin toplam maliyeti
      select sum(unit_price) as toplammaliyet
      from products;
--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
      select sum((unit_price*quantity)* (1-discount)) as ciro from order_details
--91. Ortalama Ürün Fiyatım
      select avg(unit_price) from products
--92. En Pahalı Ürünün Adı
      select product_name, unit_price from products
      order by unit_price desc
      limit 1
--93. En az kazandıran sipariş
      select sum(unit_price*quantity) from order_details
      group by order_id
      order by sum(unit_price*quantity) 
      limit 1
--94. Müşterilerimin içinde en uzun isimli müşteri
      select company_name,length(company_name) from customers
      order by length(company_name) desc
      limit 1
--95. Çalışanlarımın Ad, Soyad ve Yaşları
      select last_name, first_name, DATE_PART('year', AGE(current_date, birth_date)) as age from employees
--96. Hangi üründen toplam kaç adet alınmış..?
      select od.product_id ,  p.product_name , count(quantity) 
	from order_details od inner join products p
	on p.product_id = od.product_id
	group by od.product_id , p.product_name 
--97. Hangi siparişte toplam ne kadar kazanmışım..?
      select order_id , sum(unit_price * quantity) as kazanc from order_details
	group by order_id order by kazanc desc 
--98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
      select  c.category_id , c.category_name, count(p.product_id) from categories c 
	inner join products p on p.category_id = c.category_id
      group by c.category_id 
	order by  c.category_id 
--99. 1000 Adetten fazla satılan ürünler?
      select od.product_id ,  p.product_name , sum(quantity) 
	from order_details od inner join products p
      on p.product_id = od.product_id
	group by od.product_id , p.product_name 
	having sum(quantity) > 1000
--100. Hangi Müşterilerim hiç sipariş vermemiş..?
      select c.customer_id, c.company_name , o.order_id
      from customers c left join orders o ON c.customer_id = o.customer_id
      where o.customer_id is null;	   
--101. Hangi tedarikçi hangi ürünü sağlıyor?
      select s.supplier_id , s.company_name , p.product_id , p.product_name
	from suppliers s inner join products p on s.supplier_id = p.supplier_id
--102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
      select o.order_id, s.company_name ,  o.shipped_date,s.shipper_id,
      o.ship_name from orders o inner join
      shippers s on o.ship_via = s.shipper_id
      order by o.order_id
--103. Hangi siparişi hangi müşteri verir..?
      select o.order_id , o.customer_id , c.company_name from orders o inner join 
	customers c on c.customer_id = o.customer_id
--104. Hangi çalışan, toplam kaç sipariş almış..?
      select e.employee_id, e.first_name,e.last_name, count(o.order_id) as toplam  
	from employees e inner join orders o on e.employee_id = o.employee_id
      group by e.employee_id
      order by toplam desc;
--105. En fazla siparişi kim almış..?
      select e.employee_id, e.first_name,e.last_name,count(o.order_id) as siparis
      from employees e inner join orders o on e.employee_id = o.employee_id
      group by e.employee_id, e.first_name, e.last_name 
	order by siparis desc limit 1
--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
      select o.order_id, o.employee_id,e.first_name,e.last_name, c.customer_id,c.company_name from orders o
      inner join employees e ON o.employee_id=e.employee_id
      inner join customers c ON o.customer_id=c.customer_id
--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
      select p.product_id , p.product_name, c.category_name , s.supplier_id , s.company_name
	from products p inner join categories c on p.category_id = c.category_id
	inner join suppliers s on p.supplier_id = s.supplier_id
	order by p.product_id
--108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış
      select o.order_id,  cu.customer_id , cu.company_name ,
	e.first_name as alancalisanad , e.last_name as alancalisansoyad,
	o.shipped_date as gonderilentarih , o.ship_name as kargosirketi,
	sum(od.quantity) as kacadetalinmis , od.product_id as hangiurun ,
	od.unit_price as fiyat,
	c.category_name as categoriadi , p.supplier_id as tedarikciid
	from orders o inner join customers cu on o.customer_id=cu.customer_id
	inner join employees e on o.employee_id = e.employee_id
	inner join shippers s on o.ship_via= s.shipper_id
	inner join order_details od on od.order_id = o.order_id
	inner join products p on p.product_id = od.product_id
	inner join categories c on p.category_id =c.category_id
	group by o.order_id , cu.customer_id, e.first_name ,e.last_name,
	od.product_id, od.unit_price, c.category_name , p.supplier_id
--109. Altında ürün bulunmayan kategoriler
      select c.category_id, c.category_name , p.product_name
	from categories c  inner join  products p on p.category_id = c.category_id
	where p.product_id is null
	-- Her kategoride ürün var
--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
      select contact_title  from customers
	where contact_title like '%Manager%'
--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
      select customer_id , contact_name , company_name from customers
	where  customer_id like 'FR___' 
--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
      select customer_id, phone from customers
	where phone like '(171)%'
--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
      select quantity_per_unit from products 
	where quantity_per_unit like '%boxes%'
--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
      select country, phone, company_name , contact_title from customers 
	where country in ('France' , 'Germany') and contact_title like '%Manager%'
--115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
      select product_name , unit_price from products
	order by unit_price desc limit 10
--116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
      select company_name, country , city from customers
	order by country , city
--117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
      select first_name , last_name , 
	DATE_PART('year', AGE(current_date, birth_date)) as age 
      from employees 
--118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.
      select order_id , customer_id , order_date, shipped_date
	from orders where shipped_date is null and  (current_date - order_date) > 35
--119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
      select category_name , unit_price from categories c 
	inner join products p on c.category_id = p.category_id
	where  unit_price = (select max(unit_price) from products )
--120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)
      select p.product_name , p.category_id, c.category_name from products p
	inner join categories c on c.category_id = p.category_id
	where p.category_id in (select category_id from categories 
	                         where category_name like '%on%')
--121. Konbu adlı üründen kaç adet satılmıştır.
      select sum(od.quantity) , p.product_name from products  p 
	inner join order_details od on p.product_id = od.product_id
	where product_name = 'Konbu'
	group by product_name
--122. Japonyadan kaç farklı ürün tedarik edilmektedir.
      --Çözüm 1
      select count(distinct product_id) from suppliers s 
	inner join products p on p.supplier_id = s.supplier_id 
      where country = 'Japan'
	  --Çözüm 2
	select  count(distinct product_id) from products
      where supplier_id in (select supplier_id from suppliers where country = 'Japan');
--123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
      select min(freight) as endusuk , max(freight) as enyuksek, avg(freight) as ortalama 
	from orders where extract(year from order_date) = 1997
--124. Faks numarası olan tüm müşterileri listeleyiniz.
      select company_name,contact_name , fax from customers
	where fax is not null
--125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz.
      select shipped_date, order_id, order_date from orders 
      where shipped_date between '1996-07-16' and '1996-07-30' 