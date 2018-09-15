require 'rails_helper'

RSpec.describe Campaign, type: :model do
  
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :state }
    it { is_expected.to have_db_column :event_date }
  end

  describe 'Validates' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :location }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :event_date }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:campaign)).to be_valid 
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :tickets }
    it { is_expected.to have_and_belong_to_many :genres }

  end

  describe 'Attachment' do
    it 'is valid  ' do
      subject.image.attach(io: File.open(fixture_path + '/dummy.jpg'), filename: 'dummy.jpg', content_type: 'image/jpg')
      expect(subject.image).to be_attached
    end
  end

  describe 'Check for states, events and transistions' do
    subject { create(:campaign) }

    it { is_expected.to have_states :pending, :accepted, :archived }
    it { is_expected.to handle_events :accept, when: :pending }
    it { is_expected.to handle_events :archive, when: :pending }
    it { is_expected.to handle_events :archive, when: :accepted }

    it ':accept transitions from :pending to :accepted' do
      subject.accept
      expect(subject.accepted?).to eq true
    end

    it ':archive transitions from :pending to :archive' do
      subject.archive
      expect(subject.archived?).to eq true
    end

    it ':archive transitions from :pending to :archive' do
      subject.accept
      subject.archive
      expect(subject.archived?).to eq true
    end
  end
end
