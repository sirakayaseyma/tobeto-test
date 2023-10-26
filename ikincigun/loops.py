#For Döngüsü


#start => dögünün başlangıç değerini belirtir. (0 => default değer)
#stop => dögünün biteceği değerini belirtir.
#step => döngünün artış miktarını belirler (1 => default değer)

# for i in range(0,10,1):  # => 0 dan başla 10a kadar git ama 10 dahil değil 
#     print(i)

# bigggestValue = 0
# for i in range(5):
#     sayi = int(input(f"{i+1}. sayiyi giriniz:"))
#     if sayi > bigggestValue:
#         bigggestValue = sayi
# print(f"Girdiginiz sayılar arasında en buyuk olani :{bigggestValue}")


# forRangeMin = int(input("Döngünün alt limitini belirleyiniz:"))
# forRangeMax = int(input("Döngünün üst limitini belirleyiniz:"))

# for i in range(forRangeMin, forRangeMax+1):
#     if i % 2 == 0:
#         print(i)
        

""" sayilar = []

# for i in range(3):
     sayilar.append(int(input(f"{i+1}. sayiyi giriniz.")))

 sayilar.sort(reverse=True)  # => sayilari sıralamalı yazar.büyükten küçüğe yazar 
 print(sayilar) """
 
 
""" ogrenciler = ["Güneş" , "Recep" , "Betül" , "Yunus" , "İrem"]
#length => uzunluk
print(len(ogrenciler))

for i in range(len(ogrenciler)):
    print(f"{i+1}. Ogrenci : {ogrenciler[i]}")
    
for ogrenci in ogrenciler:
    print(f"Öğrenci: {ogrenci}") """
    
""" ogrenciler = ["Güneş" , "Recep" , "Betül" , "Yunus" , "İrem"]

#break
for i in range(len(ogrenciler)):
    if i>3:
        break  # => ilgili döngünün kırılasını bitirilmesini sağladı.
    print(f"{i+1}. Ogrenci : {ogrenciler[i]}")

#continue 
for ogrenci in ogrenciler:
    if ogrenci == "Recep":
        continue # => belirtilen değeri atla bir sonrakinden devam et 
    print(f"Öğrenci: {ogrenci}") """

#WHILE Döngüsü
i = 0
while i < 10:
    print("Merhaba")
    i += 1  # {i=i+1} ile {i+=1} aynı anlamdadır.

