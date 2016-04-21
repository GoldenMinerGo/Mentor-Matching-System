require "rails_helper"

RSpec.describe GroupquitMailer, type: :mailer do
  describe "child_quit_group" do
    let(:mail) { GroupquitMailer.child_quit_group }

    it "renders the headers" do
      expect(mail.subject).to eq("Child quit group")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "mentor_quit_group" do
    let(:mail) { GroupquitMailer.mentor_quit_group }

    it "renders the headers" do
      expect(mail.subject).to eq("Mentor quit group")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
