@javascript
Feature: Admin must approve Artists new Campaigns
    As a system owner
    In order to be in control of the applications content
    I would like to be able to approve all new content created by the Artists

    Background:
        Given the following user exist
            | email          | role   |
            | admin@venue.se | admin  |
            | fan@venue.se   | fan    |    
        And the following campaign exist
            | title                        | description                                | location  | state    |
            | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | pending  |
            | Campaign thas is accepted    | This campaigns has been accepted by admin  | Oslo      | accepted |
    
    Scenario: Admin accepts Campaign
        Given I am logged in as 'admin@venue.se'
        And I am on the Campaign page for 'Veronica Maggio in Stockholm'
        Then the state of the campaign 'Veronica Maggio in Stockholm' should be 'pending'
        When I click on 'Accept'
        And I wait 1 second
        Then the state of the campaign 'Veronica Maggio in Stockholm' should be 'accepted'
        And I should see 'This campaign is now live!'

    Scenario: Admin sees all Campaigns
        Given I am logged in as 'admin@venue.se'
        And I am on the 'Campaigns' page
        Then I should see 'Veronica Maggio in Stockholm'
        And I should see 'Campaign thas is accepted'
        Then I click on 'Veronica Maggio in Stockholm' detail box
        And I should be redirected to the Campaign page for 'Veronica Maggio in Stockholm'
        And I should see 'Accept'

    Scenario: Fan only sees Accepted Campaigns and no accept button
        Given I am logged in as 'fan@venue.se'
        And I am on the 'Campaigns' page
        Then I should see 'Campaign thas is accepted'
        And I should NOT see 'Veronica Maggio in Stockholm'
        Then I click on 'Campaign thas is accepted' detail box
        And I should be redirected to the Campaign page for 'Campaign thas is accepted'
        And I should NOT see 'Accept'
