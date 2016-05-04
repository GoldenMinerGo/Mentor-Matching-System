class GroupMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_mailer.child_quit_request.subject
  #
  def child_quit_request(child)
    @child = child
    @coach = @child.group.admin
    @groupname = @child.group.title
    mail to: @coach.email , subject: "A child has requested to leave your group."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_mailer.mentor_quit_notify.subject
  #
  def mentor_quit_notify(mentor)
    @mentor = mentor
    @group = mentor.group
    @coach = @group.admin
    mail to: @coach.email, subject: "A mentor has chosen to leave your group."
  end
  
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_mailer.new_mentor_added.subject
  #
  def new_mentor_added(groupinvs)
    @group = groupinvs.group
    @mentor = @group.mentor
    children = @group.children
    maillist = Array.new
    children.each do |child|
      if !maillist.include?(child.parent.email) && !(child.parent.email == @group.admin.email)
        maillist << child.parent.email
      end
    end
    maillist.each do |each_child|
      mail to: each_child.parent.email, subject: "A new mentor has joined your group"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_mailer.new_child_added.subject
  #
  def new_child_added(invitation, new_child)
    @group = invitation.group
    @name = new_child.name
    
    children = @group.children
    maillist = Array.new
    children.each do |child|
      if !maillist.include?(child.parent.email) && !(child.parent.email == @group.admin.email) && !(child.id == new_child.id)
        maillist << child
      end
    end
    maillist.each do |each_child|
      mail to: each_child.parent.email, subject: "A new child has joined your group"
    end
    
  end
end
