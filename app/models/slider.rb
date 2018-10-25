# frozen_string_literal: true

class Slider < ApplicationRecord
  after_initialize :set_default_state, if: :new_record?
  enum state: { visible: 0, pending: 1, archived: 9 }
  validates_presence_of :title, :state
  has_one_attached :image


  private

  def set_default_state
    self.state ||= :pending
  end
end
