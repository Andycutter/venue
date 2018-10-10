# frozen_string_literal: true

Then('I should see {string}') do |content|
  expect(page).to have_content content
end

Then('I should see the {string} form') do |content|
  expect(page).to have_content content
end

Then('I should NOT/not see {string}') do |content|
  expect(page).not_to have_content content
end

Then('there should be a Campaign titled {string} in the Database') do |expected_title|
  campaign = Campaign.find_by(title: expected_title)
  expect(campaign).not_to eq nil
end

Then('there should be a Artists Profile titled {string} in the Database') do |expected_name|
  performer = Performer.find_by(name: expected_name)
  expect(performer).not_to eq nil
end

Then('I should be redirected to the {string} page') do |page_name|
  expect(current_path).to eq page_path_helper(page_name)
end

Then('I should be redirected to the Campaign page for {string}') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  expect(current_path).to eq campaign_path(campaign)
end

Then('I should be redirected to the Artist/performer page for {string}') do |performer_title|
  performer = Performer.find_by(name: performer_title)
  expect(current_path).to eq performer_path(performer)
end

Then('I should be redirected to the landing page') do |_string|
  expect(current_path).to eq root_path
end

Then('there should be a user in the database with the email {string}') do |expected_email|
  user = User.find_by(email: expected_email)
  expect(user.email).to eq expected_email
end

Then('the user {string} should be a/an {string}') do |expected_email, expected_role|
  user = User.find_by(email: expected_email)
  expect(user.role).to eq expected_role
end

Then('the user should be a/an {string}') do |expected_role|
  user = User.last
  expect(user.role).to eq expected_role
end

Then('an artist profile page with the name {string} should have been created') do |artist_name|
  performer = Performer.find_by(name: artist_name)
  expect(performer.name).to eq artist_name
end

Then('there should be a Performer titled {string} in the Database') do |artist_name|
  performer = Performer.find_by(name: artist_name)
  expect(performer.name).to eq artist_name
end

Then('I should see the {string} image') do |file_name|
  expect(page).to have_css "img[src*='#{file_name}']"
end

Then('I should be on {string} campaign page') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  expect(current_path).to eq campaign_path(campaign)
end

Then('the state of the campaign {string} should be {string}') do |campaign_title, campaign_state|
  campaign = Campaign.find_by(title: campaign_title)
  expect(campaign.state).to eq campaign_state
end

Then('the state of the performer {string} should be {string}') do |performer_name, performer_state|
  performer = Performer.find_by(name: performer_name)
  expect(performer.state).to eq performer_state
end

Then('the campaign {string} is accepted') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  campaign.accept
end

Then('there should be a Ticket Variant named {string} in the Database') do |expected_name|
  sleep 0.5
  ticket_variants = TicketVariant.find_by(name: expected_name)
  expect(ticket_variants).not_to eq nil
end

Then('the last order in the database should include {string}') do |ticket_name|
  order = Order.last
  ticket = TicketVariant.find_by(name: ticket_name)
  item_names = order.items.map { |i| i.item.name }
  expect(item_names).to include ticket.name
end

Then('I should see {string} in ticket info') do |expected_content|
  within('.mui-row.tickets-by-price') do
    expect(page).to have_content expected_content
  end
end

Then('I should see {string} in header') do |expected_content|
  within('#header') do
    expect(page).to have_content expected_content
  end
end

Then('I should be redirected to the Edit page for {string}') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  expect(current_path).to eq edit_campaign_path(campaign)
end

Then('I should see a background image') do
  image_string = find('div[id="artist-banner"]').native.css_value('background-image')
  expect(image_string).to include 'rails/active_storage/blobs'
end

Then('I should see a profile image') do
  image_string = find('div[class="artist-picture"]').native.css_value('background-image')
  expect(image_string).to include 'rails/active_storage/blobs'
end

Then('a ticket to {string} should be created for {string}') do |campaign_title, user_email|
  user = @user || User.find_by_email(user_email)
  campaign = Campaign.find_by_title campaign_title
  actual_ticket_campaign_ids = user.event_tickets.map { |ticket| ticket.campaign.id }
  expect(actual_ticket_campaign_ids).to include campaign.id
end

Then('I should see a embed Youtube-player') do
  expect(page).to have_css('.youtube-container')
end

Then('the (pdf/ticket) should contain {string}') do |content|
  file = open(ActiveStorage::Blob.service.send(:path_for, @user.event_tickets.last.pdf.key))
  pdf = PDF::Inspector::Text.analyze_file(file)
  expect(pdf.strings).to include content
end

Then('I should see a embed Spotify-player') do
  expect(page).to have_css('.spotify-container')
end

Then('I should see a {string} button for the {string} campaign') do |element_text, campaign_title|
  campaign = Campaign.find_by_title(campaign_title)
  within("#campaign_#{campaign.id}") do
    expect(find_all('a').detect { |e| e.native.text == element_text.upcase }).to be_truthy
  end
end

Then('I should not see the {string} section') do |section_identifier|
  expect(page).not_to have_css section_identifier
end

Then('I should see the {string} section') do |section_identifier|
  expect(page).to have_css section_identifier
end

Then('there should be a Slider titled {string} in the Database') do |expected_title|
  sleep 2
  @slider = Slider.find_by(title: expected_title)
  expect(@slider).not_to eq nil
end

Then('the sliders {string} should be {string}') do |attribute, expected_value|
  expect(@slider.send(attribute.downcase.to_sym)).to eq expected_value
end
