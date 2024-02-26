@Resource1
Feature: Manager RestAPi Crud operations

  Background:
  * def tokenQA = callonce read('..//features/Token.feature')
  * header token = tokenQA.response.token
  * print tokenQA
  * url baseUrl
  * header content-type = "application/json"


  Scenario: Create the Manager data.
    Given path "managers"
    And def requestBodySearch = read('..//data/manager/manager_create.json')
    And print requestBodySearch
    And def requestBody = requestBodySearch[0]
    And request requestBody
    When method Post
    Then status 200
    And print response
    And def managerIds = response.success[0].managerId






