@javascript
Feature: Artist can display own campaigns on Performers profile/show page

    As an Artists
    In order to promote my created Campaigns
    I would like to have my active Campaigns displayed on my profile

    Background:
        Given the following users exist
            | email          | role   |
            | user@artist.se | artist |

        And the following performers with user exist
            | name            | user           |
            | Veronica Maggio | user@artist.se |
            | KISS            | user@artist.se |

        Given the following campaign exist
            | title                         | description                                | location   | state    | user           |
            | Veronica Maggio in Stockholm  | Don't miss a fantastic singer in September | Stockholm  | accepted | user@artist.se |
            | Veronica Maggio in Gothenburg | Don't miss a fantastic singer in September | Gothenburg | accepted | user@artist.se |
            | Veronica Maggio in Kiruna     | Don't miss a fantastic singer in September | Gothenburg | accepted | user@artist.se |
            | KISS in Kiruna                | Don't miss a fantastic singer in September | Kiruna     | accepted | user@artist.se |

        And campaign "Veronica Maggio in Stockholm" is connected to "Veronica Maggio"
        And campaign "Veronica Maggio in Gothenburg" is connected to "Veronica Maggio"
        And campaign "Veronica Maggio in Kiruna" is connected to "Veronica Maggio"
        And campaign "KISS in Kiruna" is connected to "KISS"

        Given I navigate to 'landing' page


    Scenario: Campaign info can be accessed from Performer's page
        Given I click on "Artists"
        And I click on "Veronica Maggio"
        Then I should see "Veronica Maggio in Stockholm"
        And I should see "Veronica Maggio in Gothenburg"
        And I should see "Veronica Maggio in Kiruna"
        And I should NOT see "KISS in Kiruna"

    Scenario: Performer info can be accessed from Campaign page
        Given I click on "Campaigns"
        And I click on "KISS in Kiruna"
        And I click on "KISS Profile"
        Then I should be redirected to the performer page for "KISS"



