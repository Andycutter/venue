require 'rails_helper'

RSpec.describe DashboardPolicy do
  subject { described_class.new(user, :dashboard) }

  context "user is a :fan" do
    let(:user) { create(:user, role: :fan) }
    it { is_expected.to forbid_action(:index) }
  end

  context "user is a :artist" do
    let(:user) { create(:user, role: :artist) }
    it { is_expected.to forbid_action(:index) }
  end

  context "user is a :admin" do
    let(:user) { create(:user, role: :admin) }
    it { is_expected.to permit_action(:index) }
  end
end
