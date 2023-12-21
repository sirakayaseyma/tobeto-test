from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager . chrome import ChromeDriverManager
from time import sleep
from selenium.webdriver.support.wait import WebDriverWait #beklediğim koşulu sağlayana kadar bekle, ilgili driverı bekleten yapı
from selenium.webdriver.support import expected_conditions as ec #beklenen koşullar
from selenium.webdriver.common.action_chains import ActionChains

class Test_SauceDemo:
    def test_invalid_login(self):
        driver = webdriver.Chrome()
        driver.get("https://www.saucedemo.com")
        driver.maximize_window() 
        
        usernameInput = WebDriverWait(driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        #usernameInput = driver.find_element(By.ID, "user-name")
        usernameInput.send_keys("locked_out_user")
      
        passwordInput =WebDriverWait(driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        #passwordInput = driver.find_element(By.ID, "password")
        passwordInput.send_keys("secret_sauce")
      
        loginButton = driver.find_element(By.ID , "login-button")
        loginButton.click()
     
        errorMessage = driver.find_element(By.XPATH, "//*[@id='login_button_container']/div/form/div[3]/h3")
        testResult = errorMessage.text == "Epic sadface: Sorry, this user has been locked out."
        print(f"TEST SONUCU: {testResult}")
        
    def valid_login(self):
        driver = webdriver.Chrome()
        driver.get("https://www.saucedemo.com")
        driver.maximize_window() 
        
        usernameInput = WebDriverWait(driver,5).until(ec.visibility_of_element_located((By.ID , "user-name")))
        usernameInput.send_keys("standard_user")
      
        passwordInput =WebDriverWait(driver,5).until(ec.visibility_of_element_located((By.ID , "password")))
        passwordInput.send_keys("secret_sauce")
        
        loginButton = driver.find_element(By.ID , "login-button")
        loginButton.click()
        
        headerLogo = WebDriverWait(driver,5).until(ec.visibility_of_element_located((By.XPATH , "//*[@id='header_container']/div[1]/div[2]/div")))
        testResult = headerLogo.text == "Swag Labs"
        print(f"Test Sonucu: {testResult}")
    

testClass = Test_SauceDemo()
testClass.test_invalid_login()
testClass.valid_login()