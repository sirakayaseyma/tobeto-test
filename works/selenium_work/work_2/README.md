| --------------- | -------------------- | 

# Pytest Decoratorleri 

## PyTest, Python dilinde yazılmış bir test çerçevesidir ve kullanıcılarına test yazma, yürütme ve organize etme konusunda bir dizi özellik sağlar. PyTest'in decoratorleri, test fonksiyonlarına özel davranışlar eklemek için kullanılır. 

### @pytest.fixture 
**"@pytest.fixture" decoratorü, testlerinizi daha modüler ve sürdürülebilir hale getirmenize yardımcı olan önemli bir araçtır. Fixture'lar, testlerinizin başında veya sonunda belirli durumları sağlamak veya temizlemek için kullanılır. Örneğin, bir veritabanı bağlantısı oluşturmak veya bir dosyayı temizlemek için bir fixture kullanabilirsiniz. Fixture'lar, yield ifadesi ile birlikte kullanılır ve test işlemi sırasında bu noktalarda çalıştırılırlar.**

`import pytest

@pytest.fixture
def database_connection():
    # Fixture setup işlemleri
    connection = create_database_connection()
    yield connection
    # Fixture teardown işlemleri
    connection.close()` 

| --------------- | -------------------- | 

## @pytest.mark 
**"@pytest.mark" decoratorü, testlere etiket ekleyerek onları gruplandırmanıza, filtrelemenize veya koşullu olarak çalıştırmanıza olanak tanır. Örneğin, belirli bir testi "hızlı" olarak etiketleyebilir ve yalnızca hızlı testleri çalıştırmak için PyTest komutuna bir argüman ekleyebilirsiniz.**

`import pytest

@pytest.mark.slow
def test_slow_example():
    pass

@pytest.mark.fast
def test_fast_example():
    pass`

| --------------- | -------------------- | 

## @pytest.mark.parametrize
**"@pytest.mark.parametrize" decoratorü, aynı test fonksiyonunu farklı parametre setleriyle birden çok kez çalıştırmak için kullanılır. Bu, aynı mantığı test etmek için farklı giriş verilerini kullanmanızı sağlar.**

`import pytest

@pytest.mark.parametrize("giris_verisi, beklenen_cikti", [(1, 2), (2, 4), (3, 6)])
def test_ikiyle_carp(giris_verisi, beklenen_cikti):
    sonuc = ikiyle_carp(giris_verisi)
    assert sonuc == beklenen_cikti`

| --------------- | -------------------- |  

## @pytest.mark.skip ve @pytest.mark.skipif
**"@pytest.mark.skip" decoratorü, bir testi belirli bir nedenle atlamak için kullanılır. Örneğin, testin şu anda geliştirme aşamasında olduğunu belirtmek isteyebilirsiniz. "@pytest.mark.skipif" decoratorü ise belirli bir koşul sağlandığında bir testi atlamak için kullanılır.**

`import pytest
 import sys

@pytest.mark.skip(reason="Test şu anda geliştirme aşamasında")
def test_ornek():
    pass

@pytest.mark.skipif(sys.version_info < (3, 6), reason="Python 3.6'dan önce çalışmaz")
def test_python_surumu_kontrolu():
    pass`

| --------------- | -------------------- |  

## @pytest.mark.xfail
**"@pytest.mark.xfail" decoratorü, bir testin bilinçli olarak başarısız olması beklendiğinde kullanılır. Yani, test başarısız olacaksa bu başarısızlığın testin geri kalanını etkilememesi için @pytest.mark.xfail kullanılabilir.**

`import pytest

@pytest.mark.xfail
def test_beklenen_basarisiz_test():
    assert False, "Bu testin başarısız olması bekleniyor."`

| --------------- | -------------------- | 