class EventTicket < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  has_one_attached :pdf
end
