@javascript
Feature: Featured campaign appeares in the grid on landing page

    As an Admin
    In order to promote certain Campaigns
    I would like to be able to choose specific feature campaigns

    Scenario: Visitor can see featured campaigns
        Given I visit the 'landing' page
        Then I should not see the '.tiled-campaigns' section
        But if the following campaigns exist
            | title                        | state    | featured |
            | Veronica Maggio in Stockholm | accepted | true     |
            | Another Artist in Stockholm  | accepted | true     |
        And I visit the 'landing' page
        Then I should see the '.tiled-campaigns' section

