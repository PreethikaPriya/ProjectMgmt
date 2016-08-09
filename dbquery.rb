Project.where('client_id = ?',3)
Project.where('client_id = ?',450)

#find all projects where started from the month of may
Project.where('start_date > ?', Date.parse("2016-05-01"))

#find all projects started for clients id 3 from the month of may
Project.where('client_id = ? AND start_date > ?',3, Date.parse("2016-05-01"))

#find all projects ended in the month of january
Project.where('end_date < ?', Date.parse("2016-01-31"))

#find all projects started in month of march
Project.where('start_date >= ? AND start_date <= ?', Date.parse("2016-03-01"), Date.parse("2016-03-31"))

#alternative way

Project.where(start_date: Date.parse("2016-03-01").. Date.parse("2016-03-31"))


#mass update where client id 1 is replced with client id 5
projects = Project.where('client_id = ?',1)
projects.each do |project|
	project.update_attributes(client_id: 5)
end


#to delete mass objects based on condition
Project.where('client_id = 5').count #gives count just for verfication b4 n after delete_all                     																																																																																				
Project.where('client_id = 5').delete_all

Project.all.each{|project| project.update_attributes(status:["new","completed","on-going"].sample)} 
#here we are passing argumenst of type hash
or 
Project.all.each do |project|
	project.status = ["new","completed","on-going"].sample
	project.save
end





<% task_completion = (@project.completed_task.size / @project.tasks.size.to_f) * 100 %>

	<div class="progress">
	  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="<%= task_completion %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= task_completion.to_i %>%;">
	    <%= task_completion %>%
	  </div>
	</div>
	
