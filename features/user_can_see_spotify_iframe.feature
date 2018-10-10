@javascript
Feature: Display Spotify Artist-page on Artist Profile page
    As an Artist
    In order to promote my/our music
    I would like to display my Spotify Artist-page on my profile page

    Background:
        Given the following Performer exist
        | name  | spotify                |
        | Oasis | 2DaxqgrOhkeH0fpeiQq2f4 |

    Scenario:
        When I am on the Performer page for 'Oasis'
        Then I should see a embed Spotify-player
