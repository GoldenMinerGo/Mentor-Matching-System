class GroupinvMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.groupinv_mailer.groupinv_received.subject
  #
  def groupinv_received(groupinv)
    @groupinv = groupinv
    if @groupinv.send_by_mentor = false
      @name = @groupinv.group.name
      mail to: @groupinv.mentor.email, subject: "A group has shown interest in you!"
    else
      @name = @groupinv.mentor.name
      mail to: @groupinv.group.admin.email, subject: "A mentor has sent you an invitation!"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.groupinv_mailer.groupinv_changed.subject
  #
  def groupinv_changed(groupinv , changed_by_mentor)
    @groupinv = groupinv
    @changed_by_mentor = changed_by_mentor
    if changed_by_mentor = false
      @name = @groupinv.group.name
      mail to: @groupinv.mentor.email, subject: "Invitation accepted!"
    else
      @name = @groupinv.mentor.name
      mail to: @groupinv.group.admin.email, subject: "Invitation accepted!"
   end 
  end
end

