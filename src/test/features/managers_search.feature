@Resource
Feature: Retrieve the Managers information by given API resource.

  Background:
    * url "https://goldmanqavil.v3locitydev.com/api/v1/queries"
    * header content-type = "application/json"
#    * header token = "8f114755-249b-419d-b062-e6abac17cbed"
    * def tokenQA = callonce read('..//features/Token.feature')
    * def requestBody = read('..//resources/data/request_manager.json')

  Scenario Outline: Retrieve the Managers data.
    Given path "managers/search"
    And print requestBody
    And request <Data1>
    When method Post
    Then status 200
    And print response
    And match response[0].managerName == requestBody.data[1].managerNameContains

    Examples:
      | Data1               |
      | requestBody.data[0] |
      | requestBody.data[1] |
      | requestBody.data[2] |
      | requestBody.data[3] |
      | requestBody.data[4] |