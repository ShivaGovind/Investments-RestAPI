Feature: Authorization Token creation


  Background:
    * url "https://goldmanqavil.v3locitydev.com/api/v1"
    * def requestBody = read('..//data/token_request.json')

  Scenario: Application authorization token

    Given path "oauth2/token"
    And request requestBody
    When method Post
    Then status 200
    And print response
