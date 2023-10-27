""" 4- Kullanıcıdan girilen sayının asal 
sayı olup olmadığını söyleyen bir program yazınız. """


sayi = int(input("Bir sayi giriniz: "))

asalSayi = True
if sayi > 1:
    for i in range (2,sayi):
        if sayi % i == 0 :
            print("Asal sayı değil")
            asalSayi = False
            break
    if asalSayi:
        print("Sayı asaldır.")
         

else:
    print("geçerli sayi giriniz")       