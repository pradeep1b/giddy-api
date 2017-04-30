require "rails_helper"

RSpec.describe Activity, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'attachements' do
    let(:track_image) { File.open(Rails.root.join('spec/fixtures/files/test_track_image.png')) }
    let(:track) { File.open(Rails.root.join('spec/fixtures/files/test_track.gpx')) }

    it 'can attach map image file' do
      subject.update(track_image: track_image)
      expect(subject.track_image.storage_key).to eq('cache')
    end

    it 'can attach track file' do
      subject.update(track: track)
      expect(subject.track.storage_key).to eq('cache')
    end
  end
end
