@javascript
Feature: Attaching image to the campaign 
    As an Artist
    To further promote my Campaign
    I would like to be able to attach an image to my Campaign

    Background:
        Given the following user exist
        | email          | role   | password   |
        | user@artist.se | admin  | my-pasword |
        And I am logged in as 'user@artist.se'

    Scenario: Attaching image to the campaign
        And I am on the 'landing' page
        And I click on 'New Campaign'
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I set the date to '2019-05-05'
        And I attach an image to the campaign
        And I fill in ticket fields
        And I click on 'Launch Campaign'
        And I wait 1 second
        And the campaign 'Clare Cunningham' is accepted
        Then I should be redirected to the Campaign page for 'Clare Cunningham'
        And I wait 1 second
        And I should see the 'dummy.jpg' image

    
