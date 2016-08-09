class Project < ActiveRecord::Base

	#has_many :join_table
	#has_many : associated_table, through: :join_table


	has_many :project_categories
	has_many :categories, through: :project_categories

	before_destroy :destroy_all_tasks

	belongs_to :client  # Should be singular of model
	has_many :tasks
	belongs_to :user


	validates_presence_of :name, :description, :start_date, :end_date, :client_id, :estimated_budget, :status
	validates_length_of :description, minimum:10
	validates_numericality_of :client_id

	#custom validation
	validate :check_date

	def self.new_projects
		Project.where('status = ?',"new")
	end

	def destroy_all_tasks
		Task.where('project_id=?',self.id).delete_all
	end	


	private

	def check_date
		if (!self.end_date.nil? && !self.start_date.nil?) && (self.end_date <= self.start_date)
			errors.add(:end_date, "Should be greater than start date")
		end
	end
end

