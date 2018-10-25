@javascript
Feature: Admin can edit Campaigns
    As an Admin
    In order to be in control of the content of the Campaigns and maintain a high quality
    I would like to be able to Edit existing Campaigns

    Background:


        Given the following campaign exist
            | title                        |
            | Veronica Maggio in Stockholm |

        And the following user exist
            | email           | role   |
            | admin@venue.se  | admin  |
            | artist@venue.se | artist |
            | fan@venue.se    | fan    |

        And the following Performer with name exist
            | name            | user            |
            | Veronica Maggio | artist@venue.se |
        
        And I am logged in as 'admin@venue.se'

    Scenario: Admin can edit Campaign
        When I am on the Campaign page for 'Veronica Maggio in Stockholm'
        And I click on 'Edit'
        And I fill in 'Title' with 'Veronica Maggio in Oslo'
        And I select 'Veronica Maggio' as performer
        And I fill in 'Description' with 'I have moved to Oslo'
        And I fill in 'Location' with 'Oslo'
        And I set the date to '2019-05-05'
        And I click 'Update Campaign'
        And I wait 1 second
        And I should see 'Campaign has been successfully updated'
        Then there should be a Campaign titled 'Veronica Maggio in Oslo' in the Database
        And I should be redirected to the Campaign page for 'Veronica Maggio in Oslo'

    Scenario: Artist tries to access Edit Campaign page via link
        Given I am logged in as 'artist@venue.se'
        And I try to access the Edit Campaign page for 'Veronica Maggio in Stockholm'
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page

    Scenario: Fan tries to access Edit Campaign page via link
        Given I am logged in as 'fan@venue.se'
        And I try to access the Edit Campaign page for 'Veronica Maggio in Stockholm'
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page
