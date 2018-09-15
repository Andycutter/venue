@javascript
Feature: Artists can display tickets on their Campaigns
    As an Artist,
    In order to fund my Events,
    I would like to sell tickets on the Campaign page.

    Background:
        Given the following user exist
            | email          | role   | password   |
            | user@artist.se | artist | my-pasword |
        And I am logged in as 'user@artist.se'
        And I am on the 'landing' page

    Scenario:
        When I click on 'New Campaign'
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I set the date to '2019-05-05'
        And I fill in 'Fixed ticket price' with '200'
        And I fill in "Ticket name" with "Gig Starter" for ticket variant 1
        And I fill in "Percentage" with "50" for ticket variant 1
        And I fill in "Ticket name" with "Game changer" for ticket variant 2
        And I fill in "Percentage" with "80" for ticket variant 2
        And I fill in "Ticket name" with "Sure thing" for ticket variant 3
        And I fill in "Percentage" with "100" for ticket variant 3
        And I attach an image to the campaign
        And I click on 'Launch Campaign'
        Then there should be a Ticket Variant named 'Sure thing' in the Database
        And I should see 'Sure thing' in ticket info
        And I should see '200' in ticket info