sayi1 = float(input("Birinci sayiyi girin:"))
sayi2 = float(input("İkinci sayiyi girin:"))
sayi3 = float(input("Üçüncü sayiyi girin:"))

if (sayi1 > sayi2) and (sayi1 > sayi3):
    print("Sayi1 en büyüktür.")
elif (sayi2 > sayi3 ) and (sayi2 > sayi1):
    print("Sayi2 en büyüktür.") 
elif (sayi3 > sayi2 ) and (sayi3 > sayi1):
    print("Sayi3 en büyüktür.") 
else:
    print("sayilar eşittir")