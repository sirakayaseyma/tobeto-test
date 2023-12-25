
# Pytest Decoratorleri 

## PyTest, Python dilinde yazılmış bir test çerçevesidir ve kullanıcılarına test yazma, yürütme ve organize etme konusunda bir dizi özellik sağlar. PyTest'in decoratorleri, test fonksiyonlarına özel davranışlar eklemek için kullanılır. 

### @pytest.fixture 
**"@pytest.fixture" decoratorü, testlerinizi daha modüler ve sürdürülebilir hale getirmenize yardımcı olan önemli bir araçtır. Fixture'lar, testlerinizin başında veya sonunda belirli durumları sağlamak veya temizlemek için kullanılır. Örneğin, bir veritabanı bağlantısı oluşturmak veya bir dosyayı temizlemek için bir fixture kullanabilirsiniz. Fixture'lar, yield ifadesi ile birlikte kullanılır ve test işlemi sırasında bu noktalarda çalıştırılırlar.**

![1](https://github.com/sirakayaseyma/tobeto-test/assets/76254345/9ea45c19-e7fb-4c02-b61d-0824b89cbd9f)

## @pytest.mark 
**"@pytest.mark" decoratorü, testlere etiket ekleyerek onları gruplandırmanıza, filtrelemenize veya koşullu olarak çalıştırmanıza olanak tanır. Örneğin, belirli bir testi "hızlı" olarak etiketleyebilir ve yalnızca hızlı testleri çalıştırmak için PyTest komutuna bir argüman ekleyebilirsiniz.**

![2](https://github.com/sirakayaseyma/tobeto-test/assets/76254345/4eab5500-413c-4af3-aeb6-c09ee6dc76fd)

## @pytest.mark.parametrize
**"@pytest.mark.parametrize" decoratorü, aynı test fonksiyonunu farklı parametre setleriyle birden çok kez çalıştırmak için kullanılır. Bu, aynı mantığı test etmek için farklı giriş verilerini kullanmanızı sağlar.**

![3](https://github.com/sirakayaseyma/tobeto-test/assets/76254345/40f43335-3115-4aa1-a576-f981b7cef112)

## @pytest.mark.skip ve @pytest.mark.skipif
**"@pytest.mark.skip" decoratorü, bir testi belirli bir nedenle atlamak için kullanılır. Örneğin, testin şu anda geliştirme aşamasında olduğunu belirtmek isteyebilirsiniz. "@pytest.mark.skipif" decoratorü ise belirli bir koşul sağlandığında bir testi atlamak için kullanılır.**

![4](https://github.com/sirakayaseyma/tobeto-test/assets/76254345/3b1cb53c-63f6-48e3-8b21-2293692fef81)

## @pytest.mark.xfail
**"@pytest.mark.xfail" decoratorü, bir testin bilinçli olarak başarısız olması beklendiğinde kullanılır. Yani, test başarısız olacaksa bu başarısızlığın testin geri kalanını etkilememesi için @pytest.mark.xfail kullanılabilir.**

![5](https://github.com/sirakayaseyma/tobeto-test/assets/76254345/14a87d13-8109-4297-a486-5bc7f2331b69)
