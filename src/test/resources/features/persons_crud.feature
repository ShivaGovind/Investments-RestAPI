@Resource
Feature: Persons Crud operations

  Background:
  * def tokenQA = callonce read('..//features/Token.feature')
  * header token = tokenQA.response.token
  * print tokenQA
  * url "https://goldmanqavil.v3locitydev.com/api/v1/queries"
  * header content-type = "application/json"


  Scenario: Create the Person data.
    Given path "persons"
    And def requestBodySearch = read('..//data/persons/person_create.json')
    And request requestBodySearch
    When method Post
    Then status 200
    * print response
    And def personIds = response.success[0].personId
#    And match response.success[0].firstName == "KARATESSG6"




