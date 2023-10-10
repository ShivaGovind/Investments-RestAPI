@AddressesTest
Feature: Address Crud operations

  Background:
  * def tokenEnv = callonce read('..//features/Token.feature')
  * header token = tokenEnv.response.token
  * print tokenEnv
  * url "https://goldmanconvvil.v3locitydev.com/api/v1/queries"
  * header content-type = "application/json"


  Scenario: Create the Address data.
    Given path "addresses"
    And def requestBodySearch = read('..//data/addresses/address_Create.json')
    And request requestBodySearch
    When method Post
    Then status 200
    * print response
#    And def personIds = response.success[0].personId
##    And match response.success[0].firstName == "KARATESSG6"




