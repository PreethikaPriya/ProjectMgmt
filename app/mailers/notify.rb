class Notify < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify.incomplete.subject
  #
    def incomplete(task,user)
    @task = task
    @user = user
    mail to: "#{task.project.client.email}", cc:"#{user.email}", subject:"#{task.title } has been marked as
    incomplete" 
  end
end
