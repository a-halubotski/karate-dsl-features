Feature: Generic test
Background:
* url baseUrl

Scenario: Test case for non-existing resource
Given path '/an-unreal-page.html'
When method get
Then status 404
