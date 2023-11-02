""" 2- Kullanıcıdan aldığı sayının mükemmel olup olmadığını
söyleyen bir program yazınız.(Arş. Mükemmel sayı?) """

sayi = int(input("Pozitif bir sayi girin:"))


toplam = 0

for i in range(1, sayi+1):
    if sayi % i == 0: #i'ye bölümünden kalan sıfıra eşit olduğu durumda 
        toplam += i 

print(f"{sayi}'in bölenleri: {toplam}")

if toplam == sayi*2:
    print(sayi , "mükemmel sayidir")
else:
    print(sayi, "mükemmel sayi değildir")



