# frozen_string_literal: true

Given('there are {int} campaings') do |_int|
  steps %(
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

  )
end

Given('I purchase a ticket to {string}') do |campaign_nmae|
  steps %(
      When I click on '#{campaign_nmae}' detail box
      And I click on 'Buy your ticket' for "Sure thing"
      And I click on '1 ticket' in header
      And I wait 1 second
      And I fill in the stripe form
      Then I wait 1 second
      And I click on 'Submit Payment'
      And I wait 2 seconds
  )
end

Given('I visit the admin dashboard as an administrator') do
  steps %(
      Given the following users exist
          | email          | role  |
          | admin@venue.se | admin |

      Given I am logged in as 'admin@venue.se'
      When I navigate to the 'Dashboard' page
  )
end
