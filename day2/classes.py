# name = "İrem"
# age = 25

# def talk(message):
#     print(message)
    
class Human:
    #property , attribute =< nitelik , özellik
    name = "İrem"
    age = 25
    
    
    def __init__(self, name, age) -> None:
        self.name = name
        self.age = age
        print("Yapici blok çalişti")
    
    #method , davranışlar
    def talk(self,message):
        print(message)
        
    def walk(self):
        print(f"{self.name} is walking")

#instance üretmek => örnek ürettiğimi belirtiyorum.
human1 = Human("Şeyma" , 25)
# human1.name = "Şeyma"
# human1.age = 24
human1.talk("Merhaba")
human1.walk()