Feature: Health-check for www.teqniksoft.com

Background:
* url baseUrl

Scenario:

Given path /
When method get
Then status 200
