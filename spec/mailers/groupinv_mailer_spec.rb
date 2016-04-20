require "rails_helper"

RSpec.describe GroupinvMailer, type: :mailer do
  describe "groupinv_received" do
    let(:mail) { GroupinvMailer.groupinv_received }

    it "renders the headers" do
      expect(mail.subject).to eq("Groupinv received")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "groupinv_changed" do
    let(:mail) { GroupinvMailer.groupinv_changed }

    it "renders the headers" do
      expect(mail.subject).to eq("Groupinv changed")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
