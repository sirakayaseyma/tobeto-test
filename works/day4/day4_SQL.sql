--PAIR-1 SQL QUERY 

--1.  Product isimlerini (`ProductName`) ve birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.
      select product_name, quantity_per_unit from products 
--2.  Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz.
      select product_id , product_name , discontinued from products where discontinued = 0
--3.  Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.
      select product_id , product_name , discontinued from products where discontinued = 1
--4.  Ürünlerin maliyeti 20'dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
      select product_id , product_name , unit_price from products where unit_price < 20
--5.  Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
      select product_id , product_name , unit_price from products where unit_price < 25 and unit_price > 15
--6.  Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.
      select product_name , units_on_order , units_in_stock from products where units_in_stock < units_on_order
--7.  İsmi `a` ile başlayan ürünleri listeleyeniz.
      select product_name from products where product_name Like 'a%'
--8.  İsmi `i` ile biten ürünleri listeleyeniz.
      select product_name from products where product_name Like '%i'
--9.  Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
      select product_name, unit_price , (unit_price * 1.18 ) as birim_fiyat from products
--10. Fiyatı 30 dan büyük kaç ürün var?
      select count(*) from products where unit_price >30
--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
      select lower(product_name) , unit_price from products order by unit_price desc
--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
      select first_name , last_name from employees
--13. Region alanı NULL olan kaç tedarikçim var?
      select company_name, region  from  suppliers where region is null
--14. a.Null olmayanlar?
      select company_name, region  from  suppliers where region is not null
--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
      select CONCAT('TR', UPPER(product_name)) from products
--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
      select CONCAT( UPPER(product_name) ,'TR') from products where unit_price < 20
--17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
      select unit_price, product_name from products where unit_price = (select max(unit_price) from products)
--18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
      select product_name , unit_price from products order by unit_price limit 10;
--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
      select product_name , unit_price from products  where  unit_price > (select avg(unit_price) from products)
--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
      select sum(unit_price) from products where units_in_stock > 0
--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
      select count(discontinued) as productcount from products where  discontinued  in(1,0)group by discontinued
--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
      select category_name from categories inner join products on categories.category_id = products.category_id	  
--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
      select category_name, avg(unit_price) from categories inner join products on categories.category_id = products.category_id group by category_name
--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
      select category_name, unit_price ,product_name from categories inner join products on categories.category_id = products.category_id where unit_price =  (select max(unit_price) from categories inner join products on categories.category_id = products.category_id)
--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
      select * from products
      select * from suppliers
      select * from categories

      select  product_name , category_name , company_name 
      from products as p join categories as c on p.category_id = c.category_id join suppliers as s on p.supplier_id = s.supplier_id 
      order by p.unit_price desc LIMIT 1

      Diğer cevap : 
      SELECT p.product_name, c.category_name, s.company_name FROM products as p
      inner join categories as c on c.category_id = p.category_id
      inner join suppliers as s on p.supplier_id = s.supplier_id
      where p.product_id = (Select product_id from order_details
      group by product_id
      order by SUM(quantity) desc LIMIT 1)
      