class AdminsController < ApplicationController
	def index
		
	end

	def destroy
		@playdate = Playdate.find(params[:id])
		@playdate.delete

		redirect_to admins_path
	end
end
