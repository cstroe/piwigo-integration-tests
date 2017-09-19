package com.github.cstroe.piwigoit.pages

import org.openqa.selenium.By
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.ui.WebDriverWait

class WelcomeAddPhotosPage(val driver: WebDriver) {
    val greeting: String
        get() = driver.findElement(By.id("noPhotoWelcome")).text

    fun clickBigButton(): AddPhotosPage {
        driver.findElement(By.cssSelector(".bigButton a")).click()

        WebDriverWait(driver, 5).until { driver -> {
            driver.findElement(By.cssSelector(".titrePage h2")).text.contains("Upload Photos") }
        }

        return AddPhotosPage(driver)
    }
}