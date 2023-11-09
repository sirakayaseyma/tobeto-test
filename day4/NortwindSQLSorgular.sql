--- SQL => Structured Query Language
--- Veri Sorgulama - Veri Manipülasyonu 

-- SELECT  => bir şeyi seçmek anlamında kullanılır.
-- Select [kolonlar]/* from [tabloadi]

select * from products
select product_name , unit_price from products

--WHERE => sorguuya den-dan anlamı katar , filtreleme işlemleri gerçekleştirir
select * from products where unit_price > 50
select * from products where unit_price > 50 and unit_price < 100
select * from products where unit_price Between 50 and 100
select product_name, category_id from products where unit_price >= 50 or category_id >5
-- or kapısı bu ya da bu  iki seçenekten birinin doğru olması yeterli 
-- and kapısında iki seçenekte doğru olmalı.
select * from products where product_name= 'Chai' or product_name= 'Chang' or product_name= 'Ikura'

-- IN() içerisinde parametre olarak verilen n kadar veri ile ilgilli alanın uuyuşmasını bekler
select * from products where product_name In('Chai', 'Chang', 'Ikura')
select * from products where category_id In(1,2,3)

--LIKE => kalıba benzeyen ifadeleri getirir.
--% => ilgili metnin sol ya da sağında eklendiğinde sağ veya sol için metinden sonra gelecek
--metni önemsemiyorum

select * from products where product_name like '%t%' -- => isminni içinde t harfi geçen tüm ürünler
select * from products where product_name like '%t' -- => önünde ne olduğu önemli değil t ile biten
select * from products where product_name like 't%' -- => t ile başlasın önünde t olmak zorunda 
select * from products where LOWER(product_name) like 't%' --=> lower benim için tüm harfleri küçültür.

-- _ => karakter atlama olarak geçer
select * from products where product_name Like '__r%' -- => 3.harfi r olan ürünleri getirecek







--BUILT-IN FUNCTIONS
--Summary => toplama
select sum(unit_price) from products
--Average => ortalama alma
select avg(unit_price) from products
--Maxsimum => veriler arasından maksimum değeri döner
select max(unit_price) from products
--Minimum => veriler arasında minimum değeri döner
select min(unit_price) from products

--COUNT => adet döndürür
select count(*) from products where unit_price > 50
--DISTINCT => tekrarları engeller 
-- Kaç farklı şehirden çalışanım var ?
select Distinct city from employees

--SUB-QUERY =>Alt sorgu
--Ortalamnın altında bir fiyata sahip olan ürünlerimin bilgisini istiyorum.

select avg(unit_price) from products 
select * from products where unit_price < 28.83

select * from products where unit_price < (select avg(unit_price) from products ) -- => içi içe sorgu

--Ürünlerin arasında en pahalı ürünün bilgilerini getirelim
select max(unit_price) from products
select * from products where unit_price = 263.5

select * from products where unit_Price = (select max(unit_price) from products)


--ORDER BY => sıralama gerçekleştirir
--ASCENDING => ASC 
select product_name , unit_price from products order by unit_price -- order by default olarak küçükten büyüğe sıralar
--asc => küçükten büyüğe sıralar - a-z adan => zye string sıralama 
--desc => büyükten küçüğe sıralama yapar - z-a => zden aya string sıralama 
select product_name , unit_price from products order by unit_price desc


--Hazır fonksiyonlar
select current_date as "Bugünün Tarihi" --=> bugünün tarihini verir
select date_part('month' , current_date)
select date_part('year' , current_date)
select date_part('day' , current_date)

--GETDATE() => güncel tarihi saati
--DATEDIFF('interval'(year), date1,date2) => iki tarih arasındaki intervale göre farkı verir
