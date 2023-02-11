package it.mirianamarchi.seleniumapi;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.junit.jupiter.api.Assertions.assertTrue;


public class TestSelenium {

    private static int getTemperature() throws InterruptedException {
        System.setProperty("webdriver.chrome.driver","C:\\Users\\mmarc\\Desktop\\ISPW\\EasyCharge-Documentation\\Testing\\SeleniumAPI\\Marchi\\SeleniumAPI\\src\\test\\java\\it\\mirianamarchi\\seleniumapi\\driver\\chromedriver.exe");
        WebDriver driver = new ChromeDriver();
        driver.get("https://www.google.com/");
        driver.manage().window().setSize(new Dimension(1265, 1372));
        driver.findElement(By.xpath("//*[@id=\"W0wltc\"]/div")).click();
        driver.findElement(By.xpath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input")).click();
        driver.findElement(By.xpath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input")).sendKeys("Meteo Roma");
        driver.findElement(By.xpath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input")).sendKeys(Keys.ENTER);
        Thread.sleep(1000);
        WebElement value = driver.findElement(By.xpath("//*[@id=\"wob_tm\"]"));
        int res = Integer.parseInt(value.getText());
        System.out.println(res);
        driver.close();
        return res;
    }

    @Test
    public void testTemperature() throws InterruptedException {
        int temp = getTemperature();
        if(temp<20){
            System.out.println("Fa freschino, porta un giacchetto!");
        }
        assertTrue(temp<20);
    }

}
