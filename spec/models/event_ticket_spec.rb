# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventTicket, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :campaign_id }
    it { is_expected.to have_db_column(:uuid).of_type(:uuid) }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :campaign }
  end

  describe "Factory" do
    it "for :user is valid" do
      expect(create(:event_ticket)).to be_valid
    end
  end
end
