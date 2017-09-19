package com.github.cstroe.piwigoit

import com.natpryce.hamkrest.assertion.assertThat
import com.natpryce.hamkrest.containsSubstring
import org.junit.Test
import org.openqa.selenium.By
import org.openqa.selenium.Dimension
import org.openqa.selenium.firefox.FirefoxBinary
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.firefox.FirefoxOptions
import org.openqa.selenium.support.ui.WebDriverWait
import java.io.File

class TestClass {
    @Test
    fun mySimpleTest() {
        System.setProperty("webdriver.gecko.driver", "/home/cosmin/Software/geckodriver")
        val firefoxOptions = FirefoxOptions()
        firefoxOptions.binary = FirefoxBinary(File("/usr/bin/firefox"))
        val webDriver = FirefoxDriver(firefoxOptions)
        webDriver.manage().window().size = Dimension(1024, 768)

        webDriver.navigate().to("https://en.wikipedia.org/wiki/Main_Page")

        webDriver.findElement(By.id("searchInput")).sendKeys("WebDriver")
        webDriver.findElement(By.id("searchInput")).submit()

        WebDriverWait(webDriver, 5).until {
            driver -> driver.findElement(By.cssSelector("h1")).text != ""
        }
        val textFound = webDriver.findElement(By.cssSelector("h1")).text
        assertThat(textFound, containsSubstring("Selenium (software)"))

        webDriver.close()
    }
}