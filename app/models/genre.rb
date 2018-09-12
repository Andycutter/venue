class Genre < ApplicationRecord
    validates_presence_of :name
    has_many :performers
    has_and_belongs_to_many :campaigns
end
