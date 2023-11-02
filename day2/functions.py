#Fonksiyonlar çağrıldıkları yerde çalışan kod parçalar. Kod tekrarlarını önler

#defination

def ortalamaHesapla():
    final = 69
    vize = 87
    ortalama= (vize*0.4) + (final * 0.6)
    print(ortalama)

def ortalamaHesaplaveDondur():
        final = 69
        vize = 87
        ortalama= (vize*0.4) + (final * 0.6)
        return ortalama #return ifadesi çağrıldığı yere değer götürmekle görevli.

ortalamaHesapla()
print(ortalamaHesaplaveDondur())

def ortalamaHesapla(vize,final): #fonksiyonda ben yazdırıyorum değerleri
    return (vize* 0.4) + (final * 0.6)

print(ortalamaHesapla(50,78))

print("*************")

vize = int(input("Vize notunuzu  giriniz:"))
final = int(input("Final notunuzu  giriniz:"))

def ortalamaHesaplaveYazdir(vize  =vize ,final = final):  #değerleri direk klavyeden alıyorum
    return (vize* 0.4) + (final * 0.6)

print(ortalamaHesaplaveYazdir())

