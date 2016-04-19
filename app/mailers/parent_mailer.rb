class ParentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.parent_mailer.account_activation.subject
  #
  def account_activation(parent = Parent.find_by_id(1))
    @parent = parent

    mail to: parent.email, subject: "Account Activated"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.parent_mailer.password_reset.subject
  #
  def password_reset(rgluser)
    @rgluser = rgluser
    @parent = rgluser.user.parent
    mail to: @parent.email, subject: "Reset Password Requested"
  end
end
