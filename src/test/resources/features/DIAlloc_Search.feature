@DIALLOC
Feature: DI Allocation Performance Testing

  Background:
    * def tokenEnv = callonce read('..//features/Token.feature')
    * header token = tokenEnv.response.token
    * print tokenEnv
    * url baseUrl
#  * url "https://goldmanconvvil.v3locitydev.com/api/v1/queries"
    * header content-type = "application/json"


  Scenario: DI Allocation Search performance.
    Given path "directInvestAllocations/search"
    And def requestBodySearch = read('..//data/DIAlloc/DIAlloc_Perform_Search1.json')
    And request requestBodySearch
    When method Post
    Then status 200
    And print response
#    And karate.write(response, "DI ALLOC.json")  --- it will lead to increase the file sizes and not a best practice for Automation.
#    And def personIds = response.success[0].personId
##    And match response.success[0].firstName == "KARATESSG6"




