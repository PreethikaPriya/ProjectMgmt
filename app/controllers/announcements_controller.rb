class AnnouncementsController < ApplicationController

	before_filter :authenticate_user!

	def index
		@announcements = current_user.announcements
		#@announcements = Announcement.all
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.user_id = current_user.id
		if @announcement.save
			Notification.announcement(@announcement).deliver!
			redirect_to announcements_path,notice: "successfully announced"
		else
			render action: "new"
		end	
	end


	private
	def announcement_params
		params[:announcement].permit(:title,:body,:user_id)
	end  
end



