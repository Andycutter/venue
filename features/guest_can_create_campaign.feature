@javascript
Feature: Guest can create a new Campaign
    As a Guest,
    In order to bring the Artists to my city
    I would like to create a Campaign

    Background:
        Given the following user exist
            | email           | role   |
            | mikael@venue.se | artist |
        
    Scenario: Registered User successfully create a new Campaign
        Given I am logged in as 'mikael@venue.se'
        And I am on the 'landing' page
        And I click on 'New Campaign'
        Then I should see the 'Create Campaign' form
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I set the date to '2019-05-05'
        And I attach an image to the campaign
        And I fill in ticket fields
        And I click on 'Launch Campaign'
        And I wait 1 second
        Then I should see 'Campaign successfully launched'
        And there should be a Campaign titled 'Clare Cunningham' in the Database

    Scenario: Registered User don't fill out all fields    
        Given I am logged in as 'mikael@venue.se'
        And I am on the 'landing' page
        And I click on 'New Campaign'
        Then I should see the 'Create Campaign' form
        And I fill in 'Title' with ''
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I attach an image to the campaign
        And I fill in ticket fields
        And I click on 'Launch Campaign'
        Then I should see 'Additional input required'
    
    Scenario: Guest tries to create a new Campaign
        Given I am on the 'landing' page
        Then I should NOT see 'New Campaign'

    