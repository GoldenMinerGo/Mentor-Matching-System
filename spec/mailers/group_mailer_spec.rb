require "rails_helper"

RSpec.describe GroupMailer, type: :mailer do
  describe "child_quit_request" do
    let(:mail) { GroupMailer.child_quit_request }

    it "renders the headers" do
      expect(mail.subject).to eq("Child quit request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "mentor_quit_notify" do
    let(:mail) { GroupMailer.mentor_quit_notify }

    it "renders the headers" do
      expect(mail.subject).to eq("Mentor quit notify")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "new_mentor_added" do
    let(:mail) { GroupMailer.new_mentor_added }

    it "renders the headers" do
      expect(mail.subject).to eq("New mentor added")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "new_child_added" do
    let(:mail) { GroupMailer.new_child_added }

    it "renders the headers" do
      expect(mail.subject).to eq("New child added")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
