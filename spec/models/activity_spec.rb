require "rails_helper"

RSpec.describe Activity, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:track) }
    it { should validate_presence_of(:user) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'attachments' do
    it { should have_attached_file(:track) }
    it { should validate_attachment_presence(:track) }
    it { should validate_attachment_content_type(:track).allowing('text/xml') }
    it { should validate_attachment_size(:track).in(0..25.megabytes) }
  end
end
