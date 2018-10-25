@javascript
Feature: Artist has genres
    As an Artist
    In order to promote myself
    I would like to be able to add Genres to my profile

    Background:
        Given the following user exist
            | email           | role   | password   |
            | artist@venue.se | artist | my-pasword |

        And the following genres exist
            | name |
            | rock |
            | pop  |

        And the following Performer with name exist
            | name             | user            |
            | Jay-Z            | artist@venue.se |
            | Clare Cunningham | artist@venue.se |

        And I am logged in as 'artist@venue.se'

    Scenario: Campaign has genres
        And I am on the 'landing' page
        And I click on 'New Campaign'
        And I select 'Clare Cunningham' as performer
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I select 'Pop' as genre
        And I select 'Rock' as genre
        And I set the date to '2019-05-05'
        And I attach an image to the campaign
        And I click on 'Launch Campaign'
        When I wait 1 second
        Then I should be on 'Clare Cunningham' campaign page
        And I should see 'Pop'
        And I should see 'Rock'

    Scenario: Performer has genres
        And I am on the 'landing' page
        And I click on 'Create Artist Profile'
        And I fill in 'Artist name' with 'Kanye West'
        And I fill in 'City' with 'Los Angeles'
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I select 'Pop' as performer genre
        And I click on 'Create Profile'
        And I wait 1 second
        Then I should be redirected to the Artist page for 'Kanye West'
        And I should see 'Pop'
