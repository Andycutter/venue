Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("I should see the {string} form") do |content|
    expect(page).to have_content content
  end

Then("I should NOT see {string}") do |content|
    expect(page).not_to have_content content 
end

Then("there should be a Campaign titled {string} in the Database") do |expected_title|
    campaign = Campaign.find_by(title: expected_title)
    expect(campaign).not_to eq nil
end

Then("I should be redirected to the {string} page") do |page_name|
    expect(current_path).to eq page_path(page_name)    
end

Then("I should be redirected to the Campaign page for {string}") do |title|
    campaign = Campaign.find_by(title: title)
    expect(current_path).to eq campaign_path(campaign)
end

Then("It should be a user in the database with the email {string}") do |expected_email|
    user = User.find_by(email: expected_email)
    expect(user.email).to eq expected_email
end