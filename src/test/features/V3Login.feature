

Feature: V3 Login

  Scenario: login to the V3 app
    Given driver 'https://goldmanqa.v3locitydev.com/app?service=home'
    And java.lang.Thread.sleep(3000);
    And input("//*[@id='username']", 'mary')
    And input("//*[@id='password']", '1234567')
    When click("//button[contains(text(), 'Log In')]")
    And java.lang.Thread.sleep(3000);
    And waitFor("//input[@id='v3-widget-SEARCH_ATTRIBUTE.VC_SEARCH_TEXT-v3textfield-input']")
    Then waitForUrl('https://goldmanqa.v3locitydev.com/app?service=home#worldnavigation')