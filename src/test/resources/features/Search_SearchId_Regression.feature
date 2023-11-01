@RegressionAPI
Feature: Create the information by given API resource.

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
      | read('..//data/Search_SearchId_Regression.csv') |

#  Scenario Outline: <Scenario> - <TestCaseID>
#    Given path '<resource>'
#    And request requestBody
#    And print requestBody
#    When method Post
#    Then status <status>
#    And print response
#
#    Examples:
#      | read('..//data/Creates_Load1.csv') |
