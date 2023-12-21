from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager . chrome import ChromeDriverManager
from time import sleep
from selenium.webdriver.support.wait import WebDriverWait #beklediğim koşulu sağlayana kadar bekle, ilgili driverı bekleten yapı
from selenium.webdriver.support import expected_conditions as ec #beklenen koşullar
from selenium.webdriver.common.action_chains import ActionChains

class Test_SauceDemo:
    def __init__(self):
        self.driver = webdriver.Chrome()
        self.driver.get("https://www.saucedemo.com")
        self.driver.maximize_window() 
                
    def test_invalid_login(self):
        self.driver.get("https://www.saucedemo.com")
        usernameInput = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        usernameInput.send_keys("locked_out_user")
      
        passwordInput =WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        passwordInput.send_keys("secret_sauce")
      
        loginButton = self.driver.find_element(By.ID , "login-button")
        loginButton.click()
     
        errorMessage = self.driver.find_element(By.XPATH, "//*[@id='login_button_container']/div/form/div[3]/h3")
        testResult = errorMessage.text == "Epic sadface: Sorry, this user has been locked out."
        print(f"TEST SONUCU: {testResult}")
        
    def valid_login(self):
        self.driver.get("https://www.saucedemo.com")
        usernameInput = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        usernameInput.send_keys("standard_user")
      
        passwordInput =WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        passwordInput.send_keys("secret_sauce")
        
        loginButton = self.driver.find_element(By.ID , "login-button")
        loginButton.click()
        #ANASAYFAYA ULAŞIP ULAŞMADIĞININ KANITI
        #headerLogo = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.XPATH , "//*[@id='header_container']/div[1]/div[2]/div")))
        #testResult = headerLogo.text == "Swag Labs"
        addToCart = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By . XPATH , "//*[@id='add-to-cart-test.allthethings()-t-shirt-(red)']"))) #gitmek istediğim yeri belirt
        actionChains = ActionChains(self.driver) 
        actionChains.move_to_element(addToCart)  #botunumun olduğu yere sayfayı taşı 
        actionChains.click()
        actionChains.perform() #zincire eklediğim , depolanan tüm fonksiyonları çalıştır. 
        
        remove = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By . XPATH , "//*[@id='remove-test.allthethings()-t-shirt-(red)']")))
        testResult = remove.text == "Remove"
        print(f"Test Sonucu: {testResult}")
        sleep(3)

testClass = Test_SauceDemo()
testClass.test_invalid_login()
testClass.valid_login()