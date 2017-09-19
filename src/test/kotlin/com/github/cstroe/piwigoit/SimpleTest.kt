package com.github.cstroe.piwigoit

import com.github.cstroe.piwigoit.pages.WelcomeInitialPage
import org.junit.Before
import org.junit.Test
import org.openqa.selenium.Dimension
import org.openqa.selenium.WebDriver
import org.openqa.selenium.firefox.FirefoxBinary
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.firefox.FirefoxOptions
import java.io.File

class WelcomePageIT {
    private lateinit var driver: WebDriver

    @Before
    fun setUp() {
        System.setProperty("webdriver.gecko.driver", "/home/cosmin/Software/geckodriver")
        val firefoxOptions = FirefoxOptions()
        firefoxOptions.binary = FirefoxBinary(File("/usr/bin/firefox"))
        //firefoxOptions.addArguments("--headless")
        driver = FirefoxDriver(firefoxOptions)
        driver.manage().window().size = Dimension(1024, 768)
    }

    @Test
    fun initialLoad() {
        val welcomePage = WelcomeInitialPage.load(driver, "http://localhost:8082")
        assert(welcomePage.greeting == "Welcome to your Piwigo photo gallery!")

        val welcomeAddPhotosPage = welcomePage.login("testadmin", "password")
        assert(welcomeAddPhotosPage.greeting == "Hello testadmin, your Piwigo photo gallery is empty!")

        welcomeAddPhotosPage.clickBigButton()

        Thread.sleep(7000)
        driver.close()
    }
}