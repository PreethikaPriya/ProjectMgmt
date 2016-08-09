class ClientsController < ApplicationController

		before_action :authenticate_user!
		load_and_authorize_resource
		#before_action :authenticate_user! 

	def index
		#@clients = Client.all
		#@clients = current_user.clients
		@clients =  current_user.is_admin? ? Client.all : current_user.clients
		#clients.where('user_id =?',current_user.id)
	end

	def new
		@client = Client.new
	end

	def create 
		@client = Client.new(client_params)
		@client.user_id = current_user.id
		if @client.save
			redirect_to clients_path #goes to index and lists all clients
		else
			render action: "new"
		end
	end


	def show
		begin
			#@client = Client.find(params[:id])
			@client = current_user.clients.find(params[:id]) 
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path,notice: "Record not found"
		end
	end


	def edit
		#@client = Client.find(params[:id])  
		@client = current_user.clients.find(params[:id])    
	end

	def update
		#@client = Client.find(params[:id])
		@client = current_user.clients.find(params[:id]) 
		@client.user_id = current_user.id
		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id), notice: "succesfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		#@client = Client.find(params[:id])
		@client = current_user.clients.find(params[:id]) 
		@client.destroy
		redirect_to clients_path, notice: "succesfully deleted #{@client.name}"
	end


	private
	def client_params
		params[:client].permit(:name, :company, :email, :mobile) #any values from form which needds to saved in the form needs to be whitelisted in the params
	end
	
end


#params has a key called as client, we get a hash caled as client where key is cleint and allow keys as name, company etc
#render, params, permit, redirect to are methods availble in controlers
#render action: "new"