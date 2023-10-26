""" 4- Kullanıcıdan girilen sayının asal 
sayı olup olmadığını söyleyen bir program yazınız. """

#sayi = int(input("Bir sayi girin:"))

# if sayi > 1:
#     for i in range(1,sayi):
#         if sayi % i == 0:
#             print (f"{sayi} bir asal sayidır.")
#             break
#         else:
#             print(f"{sayi} bir asal sayi değildir")
# else:
#     print("Geçerli sayi giriniz")   

sayi = int(input("Bir sayi giriniz: "))

if sayi > 1:
    for i in range (2,sayi):
        if sayi % i == 0 :
            print("Asal sayı değil")
            break
        else:
            print("Sayı asaldır.")
            break

else:
    print("geçerli sayı giriniz")       
