class GroupquitMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.groupquit_mailer.child_quit_group.subject
  #
  def child_quit_group(child)
    @child = child
    @coach = child.group.admin
    mail to: @coach.email, subject: "A child want to quit your group!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.groupquit_mailer.mentor_quit_group.subject
  #
  def mentor_quit_group(mentor)
    @mentor = mentor
    @coach = mentor.group.admin
    mail to: @coach.email, subject: "The group mentor want to quit your group!"
  end
end
