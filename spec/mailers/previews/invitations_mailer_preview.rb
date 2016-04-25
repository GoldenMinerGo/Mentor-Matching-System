# Preview all emails at http://localhost:3000/rails/mailers/invitations_mailer
class InvitationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitations_mailer/new_invitation
  def new_invitation
    InvitationsMailer.new_invitation
  end

  # Preview this email at http://localhost:3000/rails/mailers/invitations_mailer/invitation_accepted
  def invitation_accepted
    InvitationsMailer.invitation_accepted
  end

end
