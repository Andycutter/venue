class Campaign < ApplicationRecord
  validates_presence_of :title, :description, :location, :state, :event_date

  belongs_to :user
  has_and_belongs_to_many :genres
  has_one_attached :image
  has_many :tickets
  accepts_nested_attributes_for :tickets

  state_machine :state, initial: :pending do
    event :accept do
      transition pending: :accepted
    end

    event :archive do
      transition [:pending, :accepted] => :archived
    end
  end
end
