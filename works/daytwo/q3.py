""" 3- Kullanıcıdan girilen sayının EBOB ve EKOK'unu bulan programı yazınız. """

# EBOB hesaplama 
def ebob_hesapla(a, b):
    while b:
        a, b = b, a % b
    return a

# EKOK hesaplama
def ekok_hesapla(a, b):
    return a * b // ebob_hesapla(a, b)


sayi1 = int(input("İlk sayıyı girin: "))
sayi2 = int(input("İkinci sayıyı girin: "))


ebob = ebob_hesapla(sayi1, sayi2)
ekok = ekok_hesapla(sayi1, sayi2)


print(f"{sayi1} ve {sayi2} sayılarının EBOB'u: {ebob}")
print(f"{sayi1} ve {sayi2} sayılarının EKOK'u: {ekok}")
