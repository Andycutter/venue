class RemoveSoldCountFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :sold_count, :integer
  end
end
