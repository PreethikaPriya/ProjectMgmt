	class ProjectsController < ApplicationController

	before_action :authenticate_user! 
	load_and_authorize_resource

	def index
		#@projects = Project.all
		if params[:status]
			@projects = current_user.projects.where('status=?', params[:status])
		elsif params[:client_id]
			@projects = current_user.projects.where('client_id=?',params[:client_id])
				
		else
			@projects = current_user.projects
		end 
		#Project.where('user_id =?', current_user.id)

		@tot = current_user.projects
	end


	def new
		@project = Project.new
	end

	def create 
			@project = Project.new(project_params)
			@project.user_id = current_user.id
			if @project.save
				redirect_to projects_path, notice: "successfully created project" #goes to index and lists all clients
			else
				render action: "new"
			end
	end

	
	def show
		begin
		#@project = Project.find(params[:id])
		@project = current_user.projects.find(params[:id])
		@project.user_id = current_user.id 
		@task = Task.new
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path,notice: "Record not found"
		end
	end

	

	def edit
		#@project = Project.find(params[:id])
		@project = current_user.projects.find(params[:id])
	end

	def update
		#@project = Project.find(params[:id])
		@project = current_user.projects.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to project_path(@project.id), notice: "succesfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		#@project = Project.find(params[:id])
		@project = current_user.projects.find(params[:id])
		@project.destroy
		redirect_to projects_path, notice: "succesfully deleted project #{@project.name}"
	end


	def completed_task
		self.tasks.where('is_completed=?',true)
	end

	private
	def project_params
		params[:project].permit(:name, :client_id, :description,:start_date, :end_date, :status,:estimated_budget,category_ids:[]) #any values from form which needds to saved in the form needs to be whitelisted in the params
	end
end







		
