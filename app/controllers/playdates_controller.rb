class PlaydatesController < ApplicationController

	def index
		@playdates = Playdate.all
		render 'welcome#index'
	end

	def new
		@playdate = Playdate.new
	end

	def create
		@playdate = Playdate.new(playdate_params)
		@playdate.user_id = current_user.id
		if @playdate.save
			flash[:success] = 'Your playdate has been created.'
			redirect_to user_path(@playdate.user_id)
		else
			flash[:danger] = 'Please retry.'
			render :new
		end
	end

	private
	def playdate_params
		params.require(:playdate).permit(:title, :description, :location, :address, :datetime)
	end
end
