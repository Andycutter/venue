class CreateJoinTableCampaignsPerformers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :campaigns, :performers do |t|
      t.index [:campaign_id, :performer_id]
      t.index [:performer_id, :campaign_id]
    end
  end
end
