# Preview all emails at http://localhost:3000/rails/mailers/groupinv_mailer
class GroupinvMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/groupinv_mailer/groupinv_received
  def groupinv_received
    GroupinvMailer.groupinv_received
  end

  # Preview this email at http://localhost:3000/rails/mailers/groupinv_mailer/groupinv_changed
  def groupinv_changed
    GroupinvMailer.groupinv_changed
  end

end
