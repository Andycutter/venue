class AddDateToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :event_date, :date
  end
end
