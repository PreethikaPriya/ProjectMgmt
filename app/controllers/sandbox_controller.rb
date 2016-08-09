class SandboxController < ApplicationController
  def clients
  	@clients = Client.all
  	@client = Client.find(3)
  	@clients_by_id = Client.find(1,3,4)
  end

  def projects
  	#@projects = Project.all
  	#@projects = Project.where('client_id = ?',15)
	#@projects = Project.where('start_date > ?',Date.today - 1.month)  
	#@projects = Project.order('start_date') #ascending order by default
	#@projects = Project.order('start_date DESC')
	#@projects = Project.order('start_date DESC').limit(5)  
  	@projects = Project.order('name')
  end

  def project_task
    @projects = Project.all
  end

  def task_status
      @task_complete = Task.where('is_completed = ?', true)
      @task_incomplete = Task.where('is_completed = ? AND due_date >= ?', false,Date.today)
      @task_due = Task.where('due_date < ? AND  is_completed = ?', Date.today,false )
  end
end


