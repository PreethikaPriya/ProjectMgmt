class Category < ActiveRecord::Base

	has_many :project_categories
	has_many :projects, through: :project_categories

	validates :name,presence:true
	#validates_presence_of :name
end
