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

And('I attach an image to the slider') do
  attach_file('slider_image', "#{::Rails.root}/spec/fixtures/dummy.jpg")
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

And('I fill in the stripe form') do
  sleep 1
  find_field('example2-name').send_keys('Thomas')
  find_field('example2-address').send_keys('Some street 1')
  find_field('example2-city').send_keys('Ghotenburg')
  find_field('example2-zip').send_keys('123 43')
  stripe_iframe_4 = find("iframe[name='__privateStripeFrame4']", visible: false)
  stripe_iframe_5 = find("iframe[name='__privateStripeFrame5']", visible: false)
  stripe_iframe_6 = find("iframe[name='__privateStripeFrame6']", visible: false)

  within_frame stripe_iframe_4 do
    card_field = find_field('cardnumber')
    4.times { sleep 0.3; card_field.send_keys(right: '4242'); sleep 0.2; }
  end
  within_frame stripe_iframe_5 do
    find_field('exp-date').send_keys('12')
    find_field('exp-date').send_keys('21')
  end
  within_frame stripe_iframe_6 do
    find_field('cvc').send_keys('999')
  end
end

Given('(I )select {string} as performer genre') do |option|
  genre = Genre.find_by(name: option.downcase)
  @select_performer_genre ||= page.find('.choices[aria-activedescendant="choices-performer_genre_ids-item-choice-1"]')
  @select_performer_genre.click
  within @select_performer_genre do
    page.find("[data-value='#{genre.id}']").click
  end
end

Given('(I )select {string} as genre') do |option|
  genre = Genre.find_by(name: option.downcase)
  @select_genre ||= page.find('.choices[aria-activedescendant="choices-campaign_genre_ids-item-choice-1"]')
  @select_genre.click
  within @select_genre do
    page.find("#choices-campaign_genre_ids-item-choice-#{genre.id}").click
  end
end

Given('I select {string} as performer') do |option|
  find_all('.choices__button')&.each { |s| s.click }
  performer = Performer.find_by(name: option)
  page.find('.choices[aria-activedescendant="choices-campaign_performer_ids-item-choice-1"]').click
  page.find("[data-value='#{performer.id}']").click
end

Given('I select {string} in {string}') do |option, select_tag|
  begin
    select option, from: select_tag
  rescue StandardError
    select option, from: select_tag.downcase
  end
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

When('I set the date to {string}') do |date|
  date_arr = date.split('-')
  page.find('#campaign_event_date').send_keys(date_arr[0], :tab, [date_arr[1], date_arr[2]].join(''))
end

Then('I click the {string} button for the {string} campaign') do |element_text, campaign_title|
  campaign = Campaign.find_by_title(campaign_title)
  within("#campaign_#{campaign.id}") do
    click_on element_text
  end
end

Given('I click on {string} on the {string} slider') do |element_text, slider_title|
  slider = Slider.find_by_title(slider_title)
  within("#slider_#{slider.id}") do
    click_on element_text
  end
end

Given('I confirm the popup') do
  page.accept_alert
end
