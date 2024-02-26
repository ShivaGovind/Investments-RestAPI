@E2ETest
Feature: Persons Crud operations testing

  Background:
    * def tokenQA = callonce read('..//features/Token.feature')
    * header token = tokenQA.response.token
    * url baseUrl
    * header content-type = "application/json"
    * def result = callonce read('..//features/persons_crud.feature')
    * def personIds = result.response.success[0].personId


  Scenario: Search the Person data.
      Given path "persons/search"
      And def requestBodySearch = read('..//data/persons/person_search.json')
      And set requestBodySearch.personId[0] = personIds
      And request requestBodySearch
      When method Post
      Then status 200
      * print response
#      And def personIds = response[0].personId
#      And match response[0].firstName == "KARATESGF3"

  Scenario: Update the Person data.
    Given path "persons"
    And def requestBodySearch = read('..//data/persons/person_create.json')
    And set requestBodySearch[0].personId = personIds
    And set requestBodySearch[0].firstName = "FNameUpdated11"
    And set requestBodySearch[0].lastName = "LNameUpdated11"
    And request requestBodySearch
    When method Put
    Then status 200
    * print response

  Scenario: Search the Person data.
    Given path "persons/search"
    And def requestBodySearch = read('..//data/persons/person_search.json')
    And set requestBodySearch.personId[0] = personIds
    And request requestBodySearch
    When method Post
    Then status 200
    And print response
@ignore
  Scenario: Delete the Person data.
    Given path "persons/delete"
    And def requestBodySearch = read('..//data/persons/person_delete.json')
    And set requestBodySearch.[0].personId = personIds
    And request requestBodySearch
    When method Post
    Then status 200
    And print response
    And match personIds == response.success[0].personId


