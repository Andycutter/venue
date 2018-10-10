@javascript
Feature: Admin can archove Artist-profile
    As an Admin
    In order to be in control of the content of the Artist profiles
    I would like to be able to edit and delete Artist profile

    Background:
        Given the following Performer exist
        | name       | state  |
        | Kanye West | active |
        
        And the following user exist
        | email          | role  |
        | admin@venue.se | admin |
        And I am logged in as 'admin@venue.se'

    Scenario: Admin archives a no longer relevant Performer
        When I am on the Performer page for 'Kanye West'
        And I click on 'Archive'
        And I click on 'OK' in the confirmation popup
        Then I wait 1 second
        Then the state of the performer 'Kanye West' should be 'archived'
        And I should see 'Performer has been archived'
        And I should be redirected to the 'Performers' page
