Feature: Generic test
Background:
* url baseUrl

Scenario: Test case for delivering features to existing karate-dsl-ci image.
Given path '/'
When method get
Then status 200