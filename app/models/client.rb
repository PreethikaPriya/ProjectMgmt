class Client < ActiveRecord::Base
	has_many :projects #pluralof ur model
	belongs_to :user
	has_many :announcements

	before_create :generate_client_code
	before_destroy :destroy_all

	validates_presence_of :name, :company, :mobile, :email
	validates_length_of :mobile, is:10
	validates_numericality_of :mobile
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :mobile, :email, scope: :user_id

	def details
		"#{self.name} <br/> #{self.company} <br/> #{self.mobile} <br/> #{self.email}"
	end

	def list_projects
	Project.where('client_id = ?',self.id)
	end
#in cosole, craete Client.last, then Client.last.list_projects
#else create an object first n then class this methjod on that object

	def list_by_status(status)
	Project.where('client_id = ? AND status = ?',self.id,status) 
	end
	#in console create an object client = Client.last then client.list_by_status("new")


	def generate_client_code
		self.code = "#{self.name[0..2]} - #{Client.last.nil? ? 1 : Client.last.id + 1}"
	end	

	def destroy_all
		self.projects.each do |project|
			project.destroy
		end
	end


end




