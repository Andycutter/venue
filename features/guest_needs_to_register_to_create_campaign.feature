@javascript
Feature: Guests need to register to create campaigns
    As a System Owner
    In order to have control of the Campaigns created
    I would like my Guests to register first

    PT link: https://www.pivotaltracker.com/story/show/160228213

    Scenario: Guest can register as a fan
        Given I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Fan"
        And I wait 1 second
        Then I should see "Sign Up As A Fan"
        And I fill in 'Email address' with 'mikael@venue.com'
        And I fill in 'Password (6 characters minimum)' with 'my-password'
        And I fill in 'Re-Type Password' with 'my-password'
        And I click on 'Sign up for Venue'
        Then I should see 'Welcome! You have signed up successfully.'
        And there should be a user in the database with the email 'mikael@venue.com'
        And the user 'mikael@venue.com' should be a 'fan'
        And "mikael@venue.com" should receive an email


    Scenario: Guest can register as a Artist
        Given I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Artist"
        And I wait 1 second
        Then I should see "Sign Up As A Artist"
        And I fill in 'Email address' with 'thomas@venue.com'
        And I fill in 'Password (6 characters minimum)' with 'password'
        And I fill in 'Re-Type Password' with 'password'
        And I click on 'Sign up for Venue'
        Then I should see 'Welcome! You have signed up successfully.'
        And there should be a user in the database with the email 'thomas@venue.com'
        And the user 'thomas@venue.com' should be an 'artist'
        And "thomas@venue.com" should receive an email


    Scenario: Guest start register process and then backs out
        Given I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Fan"
        And I wait 1 second
        Then I should see "Sign Up As A Fan"
        And I click on 'Cancel'
        Then I am on the 'landing' page

    Scenario: Guest provides non matching passwords
        Given I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Fan"
        And I wait 1 second
        Then I should see "Sign Up As A Fan"
        And I fill in 'Email address' with 'mikael@venue.com'
        And I fill in 'Password (6 characters minimum)' with 'My-password'
        And I fill in 'Re-Type Password' with 'my-password'
        And I click on 'Sign up for Venue'
        Then I should see "Password confirmation doesn't match Password"