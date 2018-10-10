class AddFeaturedToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :featured, :boolean, default: false
  end
end
