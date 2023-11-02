number = int(input("Bir sayı girin: "))
palindrommu = str(number) == str(number)[::-1]

# [:: -1 ] tersten okuma için kullanılır

if palindrommu:
    print(f"{number} bir palindromik sayıdır.")
else:
    print(f"{number} bir palindromik sayı değildir.")