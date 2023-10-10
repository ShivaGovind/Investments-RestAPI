@AddressE2E
Feature: Address Create Update operations testing

  Background:
    * def tokenEnv = callonce read('..//features/Token.feature')
    * header token = tokenEnv.response.token
    * url "https://goldmanconvvil.v3locitydev.com/api/v1/queries"
    * header content-type = "application/json"
    * def result = callonce read('..//features/persons_crud.feature')
    * def personIds = result.response.success[0].personId


  Scenario: Create & search the Person data.
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
    And set requestBodySearch[0].middleName = "UpdMidName"
    And request requestBodySearch
    When method Put
    Then status 200
    * print response
