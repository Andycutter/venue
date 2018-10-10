@javascript
Feature: Access to admin dashboard is restricted using policies
    As a system owner
    In order to make sure that only administrators can access the administrative dashboard
    I would like to be able to restrict access to that part of the application
    ´

    Background:
        Given the following users exist
            | email           | role   |
            | admin@venue.se  | admin  |
            | artist@venue.se | artist |
            | fan@venue.se    | fan    |


    Scenario: Admin can access dashboard
        Given I am logged in as 'admin@venue.se'
        When I navigate to the 'Dashboard' page
        And I click "Manage campaigns"
        Then I should see "Campaigns"

    Scenario: Artist can't access dashboard
        Given I am logged in as 'artist@venue.se'
        When I navigate to the 'Dashboard' page
        Then I should see "Access denied"

    Scenario: Fan can't access dashboard
        Given I am logged in as 'fan@venue.se'
        When I navigate to the 'Dashboard' page
        Then I should see "Access denied"
