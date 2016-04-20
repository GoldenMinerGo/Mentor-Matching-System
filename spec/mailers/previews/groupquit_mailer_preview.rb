# Preview all emails at http://localhost:3000/rails/mailers/groupquit_mailer
class GroupquitMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/groupquit_mailer/child_quit_group
  def child_quit_group
    GroupquitMailer.child_quit_group
  end

  # Preview this email at http://localhost:3000/rails/mailers/groupquit_mailer/mentor_quit_group
  def mentor_quit_group
    GroupquitMailer.mentor_quit_group
  end

end
