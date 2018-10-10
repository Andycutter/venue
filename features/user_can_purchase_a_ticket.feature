@javascript @stripe
Feature: Implement the payment method for tickets
    As a system owner
    In order to increase the revenue flow
    I would like to charge money for tickets

    Background:

        Given the following user exist
            | email          | role | password   |
            | user@artist.se | fan  | my-pasword |

        Given the following campaign exist
            | title                        | description                                | location  | state    |
            | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted |
            | KISS in Stockholm            | Don't miss a fantastic experience          | Stockholm | accepted |

        Given the following tickets for 'Veronica Maggio in Stockholm' exist
            | price |
            | 200   |

        Given the following tickets for 'KISS in Stockholm' exist
            | price |
            | 200   |

        And the following ticket variants for 'Veronica Maggio in Stockholm' exist
            | name        | base_price_percentage |
            | Gig Starter | 50                    |
            | Sure thing  | 50                    |


        And the following ticket variants for 'KISS in Stockholm' exist
            | name             | base_price_percentage |
            | KISS Gig Starter | 50                    |
            | KISS Sure thing  | 50                    |

        And no emails have been sent

        And I am on the 'landing' page

    Scenario: Logged in user buys a ticket
        Given I am logged in as 'user@artist.se'
        When I click on 'Veronica Maggio in Stockholm' detail box
        And I click on 'Buy your ticket' for "Sure thing"
        Then I wait 2 seconds
        Then I should see "Your ticket has been added to your order."
        And the last order in the database should include "Sure thing"
        And I should see "1 ticket" in header
        When I click on '1 ticket' in header
        Then I should see 'You are about to order:'
        Then I should see '1 ticket to Veronica Maggio in Stockholm'
        And I fill in the stripe form
        Then I wait 2 seconds
        And I click on 'Submit Payment'
        And I wait 5 seconds
        Then I should see "You have successfully completed your payment!"
        And a ticket to 'Veronica Maggio in Stockholm' should be created for 'user@artist.se'
        And the ticket should contain "YOUR TICKET"
        And the ticket should contain "Venue proudly presents:"
        And the ticket should contain "Veronica Maggio in Stockholm"
        And "user@artist.se" should receive an email with subject "Here's your Ticket!"


    Scenario: Logged in user buys several tickets
        Given I am logged in as 'user@artist.se'
        When I click on 'Veronica Maggio in Stockholm' detail box
        And I click on 'Buy your ticket' for "Sure thing"
        Then I wait 2 seconds
        Then I should see "Your ticket has been added to your order."
        When I am on the 'landing' page
        And I click on 'KISS in Stockholm' detail box
        And I click on 'Buy your ticket' for "KISS Sure thing"
        When I click on '2 tickets' in header
        Then I should see 'You are about to order:'
        Then I should see '1 ticket to Veronica Maggio in Stockholm'
        Then I should see '1 ticket to KISS in Stockholm'
        And I fill in the stripe form
        Then I wait 2 seconds
        And I click on 'Submit Payment'
        And I wait 5 seconds
        Then I should see "You have successfully completed your payment!"
        And a ticket to 'Veronica Maggio in Stockholm' should be created for 'user@artist.se'
        And a ticket to 'KISS in Stockholm' should be created for 'user@artist.se'
        And "user@artist.se" should receive 2 emails



    Scenario: Not signed up user buys a ticket
        When I click on 'Veronica Maggio in Stockholm' detail box
        And I click on 'Buy your ticket' for "Sure thing"
        Then I should see "Sign Up As A Fan"
        And I fill in 'Email address' with 'thomas@venue.com'
        And I fill in 'Password' with 'password'
        And I fill in 'Re-Type Password' with 'password'
        And I click on 'Sign up for Venue'
        Then I wait 1 second
        Then I should see "Your ticket has been added to your order."
        And I should see 'Welcome! You have signed up successfully.'
        And the last order in the database should include "Sure thing"
        And I should see "1 ticket" in header
        When I click on '1 ticket' in header
        Then I should see 'You are about to order:'
        Then I should see '1 ticket to Veronica Maggio in Stockholm'
        And I fill in the stripe form
        Then I wait 2 seconds
        And I click on 'Submit Payment'
        And I wait 5 seconds
        Then I should see "You have successfully completed your payment!"