""" 1- İlk iki elemanı 1'e eşit olan, 
en az 20 elemanlı bir fibonacci serisini 
liste halinde oluşturan döngü yazalım. """

a=1
b=1

fibonacci_seri = [a,b]

for i in range(0,18,1):
    a,b = b , a+b
    fibonacci_seri.append(b)

print(fibonacci_seri)