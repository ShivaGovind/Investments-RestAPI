@Conv_Regression_RestAPI
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
      | read('..//data/CONV_API_Others_Regression.csv') |

