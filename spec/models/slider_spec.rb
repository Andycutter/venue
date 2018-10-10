require 'rails_helper'

RSpec.describe Slider, type: :model do
  describe "DB table" do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :state }
  end

  describe "Factory" do
    it "for :slider is valid" do
      expect(create(:slider)).to be_valid
    end
  end
end
