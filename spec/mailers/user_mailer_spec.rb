require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "registration confirmation" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.registration_confirmation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Registration Confirmation")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["no-reply@giddy.bike"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
