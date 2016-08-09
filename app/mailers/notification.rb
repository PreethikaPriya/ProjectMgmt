class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed(task,user)
    @task = task
    @user = user
    mail to: "#{task.project.client.email}", cc:"#{user.email}", subject:"#{task.title } has been completed!" 
  end

  def announcement(announcement)
    @announcement = announcement
    @recepients = Client.where('user_id =?',@announcement.user_id).pluck(:email)
    mail to: @recepients.join(","), subject:"#{announcement.title}"
  end
end


