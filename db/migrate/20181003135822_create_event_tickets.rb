class CreateEventTickets < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    create_table :event_tickets do |t|
      t.references :user, foreign_key: true
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()'
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
