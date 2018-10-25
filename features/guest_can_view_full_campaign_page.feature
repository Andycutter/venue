@javascript
Feature: Guests can view the full Campaign page
    As a Guest,
    In order to have more information about the Campaign
    I would like to access a full Campaign page.

    Background:
        Given the following campaigns exist
            | title                        | description                                | location  | state    | event_date |
            | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted | 2019-01-16 |

        And the date is "2019-01-01"
    
    Scenario: Guest can view the full description of Campaign
        Given I am on the 'landing' page
        And I click on 'Veronica Maggio in Stockholm' detail box
        Then I should be redirected to the Campaign page for 'Veronica Maggio in Stockholm'
        And I should see 'VERONICA MAGGIO IN STOCKHOLM'
        And I should see "Don't miss a fantastic singer in September"
        And I should see 'Stockholm'
        And I should see '15 days left'