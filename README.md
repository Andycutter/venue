[![Build Status](https://semaphoreci.com/api/v1/craftacademy/venue/branches/development/badge.svg)](https://semaphoreci.com/craftacademy/venue)
[![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/venue/badge.svg?branch=development)](https://coveralls.io/github/CraftAcademy/venue?branch=development)

Venue
------
Venue is an open source platform to crowdfund *Artists*. *Artists* can submit a *Campaign* to start funding an *Event* in a specific city. *Fans* can show their interest by buying 'early bird' tickets the *Event* and thereby help funding the *Event*.   

## Getting started
These instructions will get your copy of the project running on your local machine.

### Preequisites
In order to get the platform running you need the following:
* Rails version 5.2.0
* Ruby version 2.4.1
* Bundler

### Installation
After cloning the repository, find your way into your project folder and in the terminal run:

`$ bundle install`

and 

`$ yarn install`

Setup the database:

`$ rails db:create db:migrate`

## Running the tests
Venue uses **Cucumber** for *acceptance tests* and **RSpec** for *unit tests*
To run all the tests use:

`$ rake`

To run the test individually run:

`$ cucumber`

for acceptance tests, or

`$ rspec`

for unit tests

## Deployment
Deployment has been implemented using Heroku:

[Venue](https://www.venue.show "Deployed with Heroku")

## Contributing
Feel free to fork and submit pull requests

Current contributers:
[Contributers](https://github.com/CraftAcademy/venue/graphs/contributors)

## Licens
Venue is licensed under the [MIT License](https://github.com/CraftAcademy/venue/blob/development/LICENSE.md)

## Acknowledgments
[Thomas Ochman](https://github.com/tochman "Thank you for your valuable help and support during this project")

And a big thank you to all the coaches at [CraftAcedemy](https://craftacademy.se/english/) for help, support and making the the Bootcamp at [CraftAcedemy](https://craftacademy.se/english/) an absolutely fantastic experience:
[Magnus](https://github.com/magnus-thor), 
[Faraz](https://github.com/faraznaeem), 
[Oliver](https://github.com/oliverochman) and 
[Sophie](https://github.com/SophieSjoberg)


## Notes

Display cc icon on input: https://jsfiddle.net/ywain/L96q8uj5/


