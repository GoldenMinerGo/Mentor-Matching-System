class InvitationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitations_mailer.new_invitation.subject
  #
  def new_invitation(invitation)
    @invitation = invitation
    if @invitation.receiver_id.nil?
      @name = @invitation.group.admin.name
      mail to: @invitaion.group.admin.email, subject: "A child has shown interest in your group!"
    else
      @name = @invitation.receiver.name
      mail to: @invitation.receiver.email, subject: "A group has sent you an invitation!"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitations_mailer.invitation_accepted.subject
  #
  def invitation_accepted
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
