# frozen_string_literal: true

Given('I (try )to/am/navigate/visit (access/on/to )(the ){string} page') do |page_name|
  visit page_path_helper(page_name)
end

def page_path_helper(path)
  if path == 'Create Campaign'
    new_campaign_path
  elsif path == 'Campaigns'
    campaigns_path
  elsif path == 'Create Artist Profile'
    new_performer_path
  elsif path == 'Performers'
    performers_path
  elsif path == 'Dashboard'
    admin_root_path
  else
    root_path
  end
end

Given('I am on the Campaign page for {string}') do |campaign_title|
  campaign_page = Campaign.find_by(title: campaign_title)
  visit campaign_path(campaign_page)
end

When('I am on the Artists Proile page for {string}') do |performer_name|
  performer = Performer.find_by(name: performer_name)
  visit performer_path(performer)
end

Given('I try to access the Edit Performer page for {string}') do |performer_name|
  performer = Performer.find_by(name: performer_name)
  visit edit_performer_path(performer)
end

When('I am on the Performer page for {string}') do |performer_name|
  performer = Performer.find_by(name: performer_name)
  visit performer_path(performer)
end

Given('I try to access the Edit Campaign page for {string}') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  visit edit_campaign_path(campaign)
end
