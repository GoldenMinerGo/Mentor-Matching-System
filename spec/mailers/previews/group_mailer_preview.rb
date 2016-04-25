# Preview all emails at http://localhost:3000/rails/mailers/group_mailer
class GroupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/child_quit_request
  def child_quit_request
    GroupMailer.child_quit_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/mentor_quit_notify
  def mentor_quit_notify
    GroupMailer.mentor_quit_notify
  end

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/new_mentor_added
  def new_mentor_added
    GroupMailer.new_mentor_added
  end

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/new_child_added
  def new_child_added
    GroupMailer.new_child_added
  end

end
