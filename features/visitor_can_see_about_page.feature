@javascript
Feature: Visitor can read Terms of use 
    As a system owner
    In order to provide more information about my service
    I would like to have a About-page

    Scenario: 
        Given I am on the 'landing' page
        And I click on 'About Venue'
        Then I should see 'About us'