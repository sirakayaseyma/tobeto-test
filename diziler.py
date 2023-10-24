sayilar = [100,200,300,400, "Merhaba"] #köşeli parantez içideki değerlerim diziler, elemanların hepsi integer vea string olabilir.
#programcılar saymaya sıfırdan başlar. o yüzden sıfırıncı eleman vardır ve bu dizide sıfırıncı eleman 100dür.

print(sayilar[1])  #birinci elemanı gösterir
print(sayilar) #tüm elemanları gösterir

sayilar.append(500) #append fonksiyonu listenin sonuna eleman ekler
print(sayilar)

sayilar.pop() #verilen indexe göre değer siler. Herhangi bir index vermezsem son indeximi siler.
print(sayilar)

sayilar.pop(2) #2.index değerimi sildi
print(sayilar)

sayilar.remove(100) # ilk bulduğumuz değeri siler. ilk bulunan 100 değeri. Birden fazla 100 varsa ilk bulduğu 100 değerini silmiş olur.
print(sayilar)

sayilar.extend([10,20,30]) # yeni bir dizi ekleyebilirim
print(sayilar)