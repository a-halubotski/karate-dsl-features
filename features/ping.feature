Feature: Generic ping test

Background:
* url baseUrl

Scenario: Health check for a given path. (aka baseUrl)

Given path /
When method get
Then status 200