@javascript
Feature: Visitor can read Terms of use 
    As a Visitor
    In order to know which rules applies to the service
    I would like to be able to read Terms and Conditions

    Scenario: 
        Given I am on the 'landing' page
        And I click on 'Terms of use'
        Then I should see 'Information about Venue'
