package com.github.cstroe.piwigoit.pages

import org.openqa.selenium.By
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.ui.WebDriverWait

class WelcomeInitialPage(val driver: WebDriver) {
    companion object {
        fun load(driver: WebDriver, baseUrl: String): WelcomeInitialPage {
            driver.navigate().to(baseUrl)
            return WelcomeInitialPage(driver)
        }
    }

    fun login(user: String, password: String): WelcomeAddPhotosPage {
        driver.findElement(By.name("username")).sendKeys(user)
        driver.findElement(By.name("password")).sendKeys(password)
        driver.findElement(By.name("login")).click()

        WebDriverWait(driver, 5).until { driver -> {
            driver.findElement(By.id("noPhotoWelcome")).text ==
                    "Welcome to your Piwigo photo gallery!" }
        }
        return WelcomeAddPhotosPage(driver)
    }

    val greeting: String
        get() = driver.findElement(By.id("noPhotoWelcome")).text
}