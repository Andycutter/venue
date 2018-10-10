# frozen_string_literal: true

Given('(if )the following campaign(s) exist(s)') do |table|
  table.hashes.each do |campaign_hash|
    if campaign_hash[:user]
      user = User.find_by_email(campaign_hash[:user])
      campaign_hash.except!(campaign_hash[:user])[:user] = user
    end
    create(:campaign, campaign_hash)
  end
end

Given('campaign {string} is connected to {string}') do |campaign_title, performer_name|
  performer = Performer.find_by_name(performer_name)
  campaign = Campaign.find_by_title(campaign_title)
  campaign.performers << performer
  campaign.save
end

Given('the following user(s) exist(s)') do |table|
  table.hashes.each do |user_hash|
    create(:user, user_hash)
  end
end

Given('the following (P/p)erformer(s) exist') do |table|
  table.hashes.each do |performer_hash|
    create(:performer, performer_hash)
  end
end

Given('the following (P/p)erformer(s) with name/user exist') do |table|
  table.hashes.each do |performer_hash|
    user = User.find_by(email: performer_hash[:user])
    create(:performer, performer_hash.except('user').merge(users: [user]))
  end
end

Given('the following genres exist') do |table|
  table.hashes.each do |genre_hash|
    create(:genre, genre_hash)
  end
end

Given('I am logged in as {string}') do |email|
  @user = User.find_by(email: email)
  login_as(@user, scope: :user)
end

Given('I visit my account page') do
  visit user_path(@user)
end

Given('the facebook authentication is not granted') do
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

Given('the google authentication is not granted') do
  OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
end

Given('the following tickets for {string} exist') do |campaign_title, table|
  campaign = Campaign.find_by(title: campaign_title)
  table.hashes.each do |ticket_hash|
    create(:ticket, ticket_hash.merge(campaign: campaign))
  end
end

Given('the facebook response is missing email') do
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_response_without_email)
end

Given('the following ticket variants for {string} exist') do |campaign_title, table|
  campaign = Campaign.find_by(title: campaign_title)
  ticket = campaign.tickets.first
  table.hashes.each do |ticket_hash|
    create(:ticket_variant, ticket_hash.merge(ticket: ticket))
  end
end

Given('a slider titled {string}') do |slide_title|
  create(:slider, title: slide_title)
end
