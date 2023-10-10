@RegressionAPI1
Feature: Retrieve the information by given API resource.

  Background:
    * def tokenQA = callonce read('..//features/Token.feature')
    * header token = tokenQA.response.token
    * url "https://goldmanqavil.v3locitydev.com/api/v1/queries"
    * header content-type = "application/json"

  Scenario Outline: <Scenario>
    Given path '<resource>'
    And request requestBody
    When method Post
    Then status <status>
    And print response

    Examples:
      | read('..//data/AllSearch_searchId_Regression.csv') |