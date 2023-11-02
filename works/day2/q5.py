""" 5- Kullanıcıdan girilen sayının asal çarpanlarını bulan bir program yazınız.  """

sayi = int(input("Bir sayı giriniz: "))

asalCarpanListe = []
tempSayi= sayi

asalCarpan = False
for i in range(2,sayi+1):

    while tempSayi%i ==0:
        tempSayi = int(tempSayi/i)
        asalCarpan = True # yalnızca bir kere eklemesi için

    if asalCarpan:
        asalCarpanListe.append(i)
        asalCarpan = False 

print(f"{sayi} sayısı için asal çarpan listesi: {asalCarpanListe}")




# Tekrarlayan asal çarpanları verir
# sayi = int(input("Bir sayı girin: "))  # Kullanıcıdan bir sayı girildi

# carpanlar = [] # Asal çarpanları görmek için
# bolen = 2  # İlk böleni 2 olarak başlatın

# while bolen <= sayi:
#     if sayi % bolen == 0:
#         # Eğer sayı bölünebiliyorsa, bu, bir asal çarpanı temsil eder
#         carpanlar.append(bolen) #böleni çarpanlar listesine ekler
#         sayi //= bolen  # Sayıyı bölenin sonucuyla güncelleyin. Sayı adlı değişkeni bölen ile böler ve sonucu sayi değişkenine kaydeder.
          
#     else:
#         bolen += 1  # Böleni bir sonraki sayıya taşıyın

# if len(carpanlar) == 0:
#     print("Asal bir sayı girdiniz.")
# else:
#     print(f"Girilen sayının asal çarpanları: {carpanlar}")