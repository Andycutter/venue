# @javascript
# Feature: User can access list of purchased tickets on account page

#     "As a Fan
#     In order to see which Campaigns I have supported
#     I would like to have a list displaying my Tickets"

#     PT: https://www.pivotaltracker.com/story/show/160233053

#     Background: The application is configured with 2 campaings
#         Given the following user exist
#             | email          | role | password   |
#             | user@artist.se | fan  | my-pasword |
#         And there are 2 campaings

#         And I am logged in as 'user@artist.se'

#         And I am on the 'landing' page

#     Scenario: User can see list of purchased tickets
#         And I purchase a ticket to "Veronica Maggio in Stockholm"
#         And I visit my account page
#         Then I should see "Your tickets"
#         And I should see "Veronica Maggio in Stockholm"
