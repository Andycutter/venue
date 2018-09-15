# frozen_string_literal: true

And ('I click( on) {string}') do |link|
  click_on link
end

And ('I click( on) {string} detail box') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  find("##{ActionView::RecordIdentifier.dom_id(campaign)}").click
end

Then('I fill in {string} with {string}') do |field, content|
  fill_in field, with: content
end

And('I wait {int} second(s)') do |seconds|
  sleep seconds
end

And('stop') do
  binding.pry
end

And('I attach an image to the campaign') do
  attach_file('campaign_image', "#{::Rails.root}/spec/fixtures/dummy.jpg")
end

And('I fill in ticket fields') do
  steps "
    And I fill in 'Fixed ticket price' with '200'
  "

  3.times do |i|
    steps %(
      And  I fill in "Ticket name" with "Gig Starter" for ticket variant #{i}
      And I fill in "Percentage" with "50" for ticket variant 1
    )
  end
end

And ('I click on {string} in the confirmation popup') do |_browser|
  page.driver.browser.switch_to.alert.accept
end

When('I click on {string} in header') do |link|
  within('#header') do
    click_on link
  end
end

Then('I fill in the stripe form') do
  stripe_iframe = find("iframe[name='__privateStripeFrame4']")
  within_frame stripe_iframe do
    card_field = find_field('cardnumber')
    4.times { sleep 0.2; card_field.send_keys('4242'); sleep 0.2; }
    find_field('exp-date').send_keys('1221')
    find_field('cvc').send_keys('999')
  end
end

Given('(I )select {string} as genre') do |option|
  genre = Genre.find_by(name: option.downcase)
  select = page.find('.choices').click
  page.find("div[data-value='#{genre.id}']").click
end

And('I attach a profile image') do
  attach_file('performer_profile_image', "#{::Rails.root}/spec/fixtures/profile_image.jpg")
end

And('I attach a background image') do
  attach_file('performer_background_image', "#{::Rails.root}/spec/fixtures/background_image.jpg")
end

When('I fill in {string} with {string} for ticket variant {int}') do |field, value, int|
  section_parent = all('.ticket-details')
  section = section_parent[int - 1]
  within(section) { fill_in field, with: value }
end

When('I click on {string} for {string}') do |element_text, ticket_name|
  ticket = TicketVariant.find_by(name: ticket_name)
  within("#ticket_variant_#{ticket.id}") do
    click_on element_text
  end
end

When('I click on {string} for {string} 3 times') do |element_text, ticket_name|
  ticket = TicketVariant.find_by(name: ticket_name)
  3.times do
    within("#ticket_variant_#{ticket.id}") do
      click_on element_text
    end
  end
end

When("I set the date to {string}") do |date|
  date_arr = date.split('-')
  page.find('#campaign_event_date').send_keys(date_arr[0], :tab, [date_arr[1], date_arr[2]].join(''))
end