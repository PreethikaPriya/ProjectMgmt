class Task < ActiveRecord::Base
	belongs_to :project
	#validates_presence_of :title, :project_id, :is_completed #due_date,
	validates_numericality_of :project_id 


	#validate :check_date  # if !self.project.nil? 
	#validate :check_boolean

	private 

	def check_date
		if ((!self.project.nil?) && (self.due_date < self.project.start_date ||
		 self.due_date > self.project.end_date))
			errors.add(:due_date, "due_date should be greater than project start date and less than project end date")
		end	
	end

	def check_boolean
		if !([true,false].include? self.is_completed)
			errors.add(:is_completed, "should be either true or false")
		end
	end
	
end

#Date.parse("2016-02-29")
#date = "2016-06-22".to_date yymmdd


