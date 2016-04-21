# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class ParentMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    parent = Parent.find_by_id(1)
    ParentMailer.account_activation(parent)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    parent = Parent.find_by_id(1)
    rgluser = parent.user.rgluser
    rgluser.reset_token = Rgluser.new_token
    ParentMailer.password_reset(parent)
  end
end