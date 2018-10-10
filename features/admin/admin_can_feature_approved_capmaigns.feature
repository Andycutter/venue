@javascript
Feature: Admin can feature approved capmaigns
    As an Admin
    In order to promote certain Campaigns
    I would like to be able to choose specific feature campaigns

    Background:
        Given the following campaign exist
            | title                        | state    | featured |
            | Veronica Maggio in Stockholm | accepted | false    |
            | Another Artist in Stockholm  | accepted | true     |
            | Special Campaign             | pending  | false    |

        And I visit the admin dashboard as an administrator

    Scenario: Admin fatures a campaign
        Given I click on "Manage campaigns"
        And I click the "Feature" button for the "Veronica Maggio in Stockholm" campaign
        And I wait 2 seconds
        Then I should see "Updated Veronica Maggio in Stockholm to a featured campaign"
        And I should see a "Unfeature" button for the "Veronica Maggio in Stockholm" campaign


    Scenario: Admin unfatures a campaign
        Given I click on "Manage campaigns"
        And I click the "Unfeature" button for the "Another Artist in Stockholm" campaign
        And I wait 2 seconds
        Then I should see "Removed fetured campaign status from Another Artist in Stockholm"
        And I should see a "Feature" button for the "Another Artist in Stockholm" campaign

    Scenario: Admin can toggle feature on a campaign
        Given I click on "Manage campaigns"
        And I click the "Unfeature" button for the "Another Artist in Stockholm" campaign
        And I wait 1 second
        Then I should see a "Feature" button for the "Another Artist in Stockholm" campaign
        And I wait 1 second
        And I click the "Feature" button for the "Another Artist in Stockholm" campaign
        And I wait 2 second
        Then I should see a "Unfeature" button for the "Another Artist in Stockholm" campaign
    

