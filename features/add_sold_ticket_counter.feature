@javascript
Feature: Add sold ticket counter to Campaign page
    As an Artist
    In order to know how many Tickets that has been sold
    I would like to have a sold ticket-counter on the Campaign page

    Background:
        Given the following campaign exist
            | title                        | description                                | location  | state    |
            | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted |

        Given the following tickets for 'Veronica Maggio in Stockholm' exist
            | price | count |
            | 200   | 250   |

        And the following ticket variants for 'Veronica Maggio in Stockholm' exist
            | name        | base_price_percentage |
            | Gig Starter | 50                    |
            
        Given the following users exist
            | email           | role   |
            | mikael@venue.se | artist |
        And I am logged in as 'mikael@venue.se'
        And I am on the 'landing' page

    Scenario: Buy 1 ticket
        When I click on 'Veronica Maggio in Stockholm' detail box
        Then I should see '0/83'
        And I click on 'Buy your ticket' for "Gig Starter"
        And I should see "1 ticket" in header
        Then I click on '1 ticket' in header
        And I should see 'You are about to order: 1 ticket to Veronica Maggio in Stockholm'
        Then I fill in the stripe form
        And I wait 2 seconds
        And I click on 'Submit Payment'
        And I wait 5 seconds
        Then I should see "You have successfully completed your payment!"
        And I should see '1/83'

    Scenario: Buy 3 tickets
        When I click on 'Veronica Maggio in Stockholm' detail box
        Then I should see '0/83'
        And I click on 'Buy your ticket' for "Gig Starter" 3 times
        Then I click on '3 ticket' in header
        And I should see 'You are about to order: 3 tickets to Veronica Maggio in Stockholm'
        Then I fill in the stripe form
        And I wait 2 seconds
        And I click on 'Submit Payment'
        And I wait 5 seconds
        Then I should see "You have successfully completed your payment!"
        And I should see '3/83'