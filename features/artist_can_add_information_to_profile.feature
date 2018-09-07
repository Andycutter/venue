@javascript
Feature: Artist can add information to profile
    As an Artist,
    In order to promote my music,
    I would like to create my Artist profile page.

    Background:
        Given the following users exist
            | email           | role   |
            | mikael@venue.se | artist |

        And I am logged in as 'mikael@venue.se'

    Scenario: Artist successfully create profile page
        When I am on the 'landing' page
        And I click on 'Edit Profile'
        And I fill in 'Artist name' with 'Kanye West'
        And I fill in 'Genre' with 'Hip-Hop'
        And I fill in 'City' with 'Los Angeles'
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I fill in 'Facebook' with 'https://www.facebook.com/TheKanyewestPage/'
        And I fill in 'Instagram' with '@kanyewestt_official'
        And I fill in 'Twitter' with '@kanyewest'
        And I fill in 'Youtube' with 'https://www.youtube.com/'
        And I fill in 'Website' with 'kanyewest.com'
        And I fill in 'Spotify' with 'https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x?si=4zpontE-TrmF46FSVJcNHA'
        And I click on 'Create Profile'
        Then an artist profile page with the name 'Kanye West' should have been created

    Scenario: Artist does not fill in all required fields
        When I am on the 'landing' page
        And I click on 'Edit Profile'
        And I fill in 'Artist name' with ''
        And I fill in 'Genre' with 'Hip-Hop'
        And I fill in 'City' with 'Los Angeles'
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I click on 'Create Profile'
        Then I should see "Required field can't be empty."
