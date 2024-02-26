@RESTAPI_REGRESSION
Feature: Test the API resources.

  Background:
    * def tokenQA = callonce read('..//features/Token.feature')
    * header token = tokenQA.response.token
    * url baseUrl
    * header content-type = "application/json"

  Scenario Outline: <Scenario>
    Given path '<resource>'
    And request requestBody
    And print requestBody
    When method <method>
    Then status <status>
    And print response

    Examples:
      | read('..//data/Search_SearchId_Regression_File1.csv') |
