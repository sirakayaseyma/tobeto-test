print("Merhaba Tobeto Test Ekibi")

#Terminalim cmd olmalı ve terminale python dosyaadi.py yazıp çalıştırıyorum

#değişkenler
  #METİNSEL  => String
text = "Merhaba"
print(text)
  #NUMERİK  => Int , Integer - Tam sayı
studenCount = 45
print(studenCount)

studenCount2 = "50"
##print(studenCount + studenCount2) => #string ve nümerik ifade toplanamaz. bu kod hata verir.

  #double , decimal, float => ondaliklı sayı 
averagePoint = 25.5
print(averagePoint)

  #boolean değer => true,false 1-0
isVerified = True
print(isVerified)

#Veri Tiplerini Bulurum
print(type(studenCount))
print(type(studenCount2))
print(type(averagePoint))
print(type(isVerified))

#operatörler => değerler ile değişkenler arası işlemleri yappmamızı sağlar. Matematiksel ve mantıksal işlemleri yapar

#matematiksel operatörler + - * / %

number = 10

print(10 + number) #herhangi ir sayı ile number değerimin toplamı
print(number + number) #toplama
print(number - number) #çıkarma
print(number * number)  #çarpma
print(number / 2)  #bölme değer float gelebilir. Ondalıklı dönüş olmasına karşın
print(number % 2)  #mod alma işlemi. Soldaki sayının sağdaki sayıya bölümünden kalan değer


#mantıksal operatörler
print(number == 10) #number 10a eşit midir? true veya false döner => True döner
print(number == 11) #number 10a eşit midir? true veya false döner  => false döner

print(number != 10) #number 10a eşit değil midir?  true veya false döner => false döner
print(number != 11) #number 10a eşit değil midir?  true veya false döner => true döner

print(number > 10) # number 10dan büyük mü ? buunu kontrol eder => false döner
print(number >= 10) # number 10dan büyük veya eşit mi? buunu kontrol eder => true döner

print(number < 10) # number 10dan küçük mü ? buunu kontrol eder => false döner
print(number <= 10) # number 10dan küçük veya eşit mi? buunu kontrol eder => true döner


#DOSYA KAYDETMEYİ CTRL+S İLE GERÇEKLEŞTİRİRİM


#strig interpolation => metin birleştirme

hello = "merhaba"
userName = "irem"

totalText = hello + userName #yan yana yazar, değişken tanımlarken arasına boşluk koyarsam boşluk atar
totalText = hello + " " + userName # çift tırnak boşluk bırakmamı sağlar
print(totalText)

totalText = "{message} {name}".format(message="Selam" , name=userName)
print(totalText)

#fstring
totalText = f"Hoşgeldiniz {userName}"
print(totalText)


