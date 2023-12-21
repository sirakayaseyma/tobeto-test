import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager . chrome import ChromeDriverManager
from time import sleep
from selenium.webdriver.support.wait import WebDriverWait #beklediğim koşulu sağlayana kadar bekle, ilgili driverı bekleten yapı
from selenium.webdriver.support import expected_conditions as ec #beklenen koşullar

class Test_demoClass:
    def setup_method(self): #her test başlangıcında çalışacak fonksiyon.
        self.driver = webdriver.Chrome()
        self.driver.get("https://www.saucedemo.com")
        self.driver.maximize_window() 
                
    
    def teardown_method(self): 
        self.driver.quit()
    
    
    @pytest.mark.parametrize("username,password" , [("1", "secret_sauce"), ("problem_user", "1")])
    def test_invalid_login(self, username,password):
        usernameInput = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        usernameInput.send_keys(username)
        passwordInput =WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        passwordInput.send_keys(password)
        loginButton = self.driver.find_element(By.ID , "login-button")
        loginButton.click()
        errorMessage = self.driver.find_element(By.XPATH, "//*[@id='login_button_container']/div/form/div[3]/h3")
        assert errorMessage.text == "Epic sadface: Username and password do notmatch any user in this service."
        
    @pytest.mark.skip  
    def test_valid_login(self):
        usernameInput = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        usernameInput.send_keys("standard_user")
        passwordInput =WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        passwordInput.send_keys("secret_sauce")
        loginButton = self.driver.find_element(By.ID , "login-button")
        loginButton.click()
        headerLogo = WebDriverWait(self.driver,5).until(ec.visibility_of_element_located((By.XPATH , "//*[@id='header_container']/div[1]/div[2]/div")))
        testResult = headerLogo.text == "Swag Labs"
        print(f"Test Sonucu: {testResult}")
        
    def test_demo(self):
        text = "x"
        assert text == "x"
    
    def test_deneme(self):
        text = "x"
        assert text == "x"
        
    #testleri yaparken test ön kısmını eklememiz gerekir. Yoksa sistemimiz test edilemez.
    #prefix => test_ 