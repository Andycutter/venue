class Ticket < ApplicationRecord
  validates_presence_of :price, :count
  has_many :ticket_variants
  validates_length_of :ticket_variants, maximum: 3

  belongs_to :campaign

  def sold_count
    self.ticket_variants.map{|variant| variant.sold_count}.inject(:+)
  end
end
