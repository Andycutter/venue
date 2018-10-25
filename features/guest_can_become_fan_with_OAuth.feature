@javascript
Feature: A Guest can become a Fan with OAuth authentication
    As a Guest
    In order to simplify the sign up/sign in process
    I would like to be able to authenticate myself using Facebook or Google

    Scenario: Guest can authenticate with Facebook
        Given I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Fan"
        And I wait 1 second
        And I click on 'Sign up with Facebook'
        Then I wait 2 seconds
        Then I should be redirected to the 'landing' page
        And I should see 'Successfully authenticated from Facebook account'
        And the user should be a 'fan'
        And "thomas@craftacademy.se" should receive an email

    Scenario: Guest can authenticate with Facebook as an artist
        Given I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Artist"
        And I wait 1 second
        And I click on 'Sign up with Facebook'
        Then I wait 2 seconds
        Then I should be redirected to the 'landing' page
        And I should see 'Successfully authenticated from Facebook account'
        And the user should be a 'artist'
        And "thomas@craftacademy.se" should receive an email

    Scenario: Authentication fails with Facebook [Sad Path]
        Given the facebook authentication is not granted
        And I am on the 'landing' page
        And I click on 'Sign up'
        And I wait 1 second
        And I click "Fan"
        And I wait 1 second
        And I click on 'Sign up with Facebook'
        Then I wait 2 seconds
        Then I should be redirected to the 'landing' page
        And I should see 'Could not authenticate you!'

    # Scenario: Email is missing from Facebook response [Sad Path]
    #     Given the facebook response is missing email
    #     And I am on the 'landing' page
    #     And I click on 'Log in'
    #     And I wait 1 second
    #     And I click 'Login with Facebook'
    #     And I fill in 'Email' with 'dear_pablo@venue.se'
    #     And I fill in 'Password' with 'pablospass'
    #     And I fill in 'Password confirmation' with 'pablospass'
    #     And I click 'Sign up'
    #     Then I should see 'Welcome! You have signed up successfully.'
    #     And "dear_pablo@venue.se" should receive an email
    #     And I should be redirected to the 'landing' page

    # Scenario: Guest can authenticate with Google
    #     Given I am on the 'landing' page
    #     And I click on 'Sign up'
    #     And I wait 1 second
    #     And I click "Fan"
    #     And I wait 1 second
    #     And I click on 'Sign up with Google'
    #     Then I wait 2 seconds
    #     Then I should be redirected to the 'landing' page
    #     Then I should see 'Successfully authenticated from Google account'
    #     And "joe@bloggs.com" should receive an email
    #     And the user should be a 'fan'

    # Scenario: Authentication fails with Google [Sad Path]
    #     Given the google authentication is not granted
    #     And I am on the 'landing' page
    #     And I click on 'Sign up'
    #     And I wait 1 second
    #     And I click "Fan"
    #     And I wait 1 second
    #     And I click on 'Sign up with Google'
    #     Then I wait 2 seconds
    #     Then I should be redirected to the 'landing' page
    #     And I should see 'Could not authenticate you!'
