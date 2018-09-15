class Ticket < ApplicationRecord
  validates_presence_of :price, :count, :sold_count
  has_many :ticket_variants
  validates_length_of :ticket_variants, maximum: 3

  belongs_to :campaign
end
