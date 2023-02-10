package it.simonebucci.seleniumapi;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.junit.jupiter.api.Assertions.assertTrue;


public class TestSelenium {

    private static float getValue() throws InterruptedException {
        System.setProperty("webdriver.chrome.driver","C:\\Users\\simon\\Documents\\Uni\\ISPW\\SeleniumHW\\src\\test\\java\\it\\simonebucci\\seleniumhw\\driver\\chromedriver.exe");
        WebDriver driver = new ChromeDriver();
        driver.get("https://www.google.com/");
        driver.manage().window().setSize(new Dimension(1265, 1372));
        driver.findElement(By.xpath("//*[@id=\"W0wltc\"]/div")).click();
        driver.findElement(By.xpath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input")).click();
        driver.findElement(By.xpath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input")).sendKeys("Oracle Redwood City");
        driver.findElement(By.xpath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input")).sendKeys(Keys.ENTER);
        Thread.sleep(1000);
        driver.findElement(By.xpath("//*[@id=\"hdtb-msb\"]/div[1]/div/div[3]/a")).click();
        Thread.sleep(1000);
        driver.findElement(By.xpath("//*[@id=\"QA0Szd\"]/div/div/div[1]/div[2]/div/div[1]/div/div/div[2]/div[1]/div[3]/div/a")).click();
        Thread.sleep(5000);
        driver.findElement(By.xpath("//*[@id=\"QA0Szd\"]/div/div/div[1]/div[3]/div/div[1]/div/div/div[2]/div[2]/div[1]/div[1]/div[2]/div/div[1]/div[2]/span[2]/span[1]/span")).click();
        Thread.sleep(1000);
        WebElement value = driver.findElement(By.xpath("//*[@id=\"QA0Szd\"]/div/div/div[1]/div[3]/div/div[1]/div/div/div[2]/div[1]/div/div[2]/div[1]"));
        float res = Float.parseFloat(value.getText().replace(",", "."));
        System.out.println(res);
        driver.close();
        return res;
    }

    @Test
    public void testValue() throws InterruptedException {
        float res = getValue();
        assertTrue(res>4.00);
    }

}
