import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager . chrome import ChromeDriverManager
from time import sleep
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec 
from selenium.webdriver.common.action_chains import ActionChains

#Yorum satırında yer alan classlar yorum satırından çıkarıldığında test normal olarak çlaışmaktadır.
 
#Kullandığımız SauceDemo sitesinde kendi belirlediğiniz en az "3" test case daha yazınız.
#En az 1 testiniz parametrize fonksiyonu ile en az 3 farklı veriyle test edilmelidir.


class Test_2_sd:
    #başarılı giriş kontrolü
    def test_login(self): #başarılı login testi
        self.driver = webdriver.Chrome()
        self.driver.get("https://www.saucedemo.com")
        self.driver.maximize_window() 
        usernameInput = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        usernameInput.send_keys("standard_user")
        passwordInput =WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        passwordInput.send_keys("secret_sauce")
        loginButton = self.driver.find_element(By.ID , "login-button")
        loginButton.click()
        
    #Z-A şeklinde sıralama fonksiyonu
    def test_ikon(self): #ikon testi
        self.test_login()
        ikon= self.driver.find_element(By.XPATH ,"//*[@id='header_container']/div[2]/div/span/select")
        ikon.click()
        sleep(3)
        ikon2 = self.driver.find_element(By.XPATH , "//*[@id='header_container']/div[2]/div/span/select/option[2]")
        ikon2.click()
        sleep(5)
        
    #solda yer alan menü bar kontrolü 
    def test_menubar(self):
        self.test_login() #testlogini çağrımamam yardımcı olur
        menuButton = self.driver.find_element(By.ID, "react-burger-menu-btn")
        menuButton.click()
        sleep(4)
    
    #sepetim sayfasında bulunan bilgilerimi kaydettiğim kısmın kontrolü ve 3 farklı paremetre gönderimi
    
    @pytest.mark.parametrize("firstname,lastname,postalcode" , [("", "Sırakaya", "1"), ("Şeyma", "","6890"), (".", "?","!"), ("","","")])
    def test_checkout(self,firstname,lastname,postalcode):
        self.test_login() #testlogini çağrımamam yardımcı olur
        shopping_list = self.driver.find_element(By.XPATH, "//*[@id='shopping_cart_container']")
        shopping_list.click()
        sleep(2)
        checkout = self.driver.find_element(By.ID, "checkout")
        checkout.click()
        sleep(2)
        first_name = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "first-name")))
        first_name.send_keys(firstname)
        last_name = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "last-name")))
        last_name.send_keys(lastname)
        postal_code = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "postal-code")))
        postal_code.send_keys(postalcode)
        button_continue = self.driver.find_element(By.ID ,"continue" )
        button_continue.click()
        errorMessage = self.driver.find_element(By.XPATH, "//*[@id='checkout_info_container']/div/form/div[1]/div[4]/h3")
        assert errorMessage.text == "Error: First Name is required"
        sleep(3)
        
#testClass = Test_sd2()
#testClass.test_login()
#testClass.test_ikon()
#testClass.test_menubar()
#testClass.test_checkout()