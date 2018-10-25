@javascript
Feature: Admin can edit Artist-profiles
    As an Admin
    In order to keep the quality of the Artist profiles high
    I would like to be able to edit Artist profile

    Background:
        Given the following Performer exist
            | name       |
            | Kanye West |

        And the following genres exist
            | name    |
            | hip hop |
            | pop     |

        Given the following users exist
            | email           | role   |
            | admin@venue.se  | admin  |
            | artist@venue.se | artist |
            | fan@venue.se    | fan    |
            
        And I am logged in as 'admin@venue.se'

    Scenario: Admin edits Artists Profile page
        When I am on the Artists Proile page for 'Kanye West'
        And I click on 'Edit'
        And I fill in 'Artist name' with 'Jay-Z'
        And I fill in 'City' with 'New York City'
        And I select 'Hip hop' as performer genre
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I fill in 'Facebook' with 'https://www.facebook.com/Jay-Z/'
        And I fill in 'Instagram' with 'https://www.instagram.com/Jay-Z'
        And I fill in 'Twitter' with 'https://twitter.com/Jay-Z'
        And I fill in 'Youtube' with 'https://www.youtube.com/'
        And I fill in 'Website' with 'https://www.Jay-Z.com/'
        And I fill in 'Spotify' with 'https://open.spotify.com/artist/Jay-Z'
        And I click 'Update Profile'
        And I wait 1 second
        Then I should see 'Profile has been successfully updated'
        And there should be a Artists Profile titled 'Jay-Z' in the Database
        And I should be redirected to the Artist page for 'Jay-Z'

    Scenario: Fan tries to access Create Performer page via link
        Given I am logged in as 'fan@venue.se'
        And I try to access 'Create Artist Profile' page
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page

    Scenario: Fan tries to access Edit Performer page via link
        Given I am logged in as 'fan@venue.se'
        And I try to access the Edit Performer page for 'Kanye West'
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page
