@Resource1
Feature: Manager RestAPi E2E operations

  Background:
    * def tokenQA = callonce read('..//features/Token.feature')
    * header token = tokenQA.response.token
    * url baseUrl
    * header content-type = "application/json"
    * def result = callonce read('..//features/Manager.feature')
    * def managerIds = result.response.success[0].managerId

  Scenario: Search the Manager data.
    Given path "managers/search"
    And def requestBodySearch = read('..//data/manager/manager_create.json')
    And def requestBody = requestBodySearch[1][0]
    And print requestBody
    And set requestBody.managerId[0] = managerIds
    And print requestBody
    And request requestBody
    When method Post
    Then status 200
    And print response


  Scenario: Update the Manager data.
    Given path "managers"
    And def requestBodySearch = read('..//data/manager/manager_create.json')
    And def requestBody = requestBodySearch[2]
    And print requestBody
    And set requestBody[0].managerId = managerIds
    And set requestBody[0].managerName = "UpdatedShivaG"
    And print requestBody
    And request requestBody
    When method Put
    Then status 200
    And print response





