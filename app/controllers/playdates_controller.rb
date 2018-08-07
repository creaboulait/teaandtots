class PlaydatesController < ApplicationController
	before_action :find_playdate, only: [:show, :edit, :update, :destroy]

	def index
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

	def show

	end

	def edit
		# WIP
	end

	def update
		# WIP
	end

	def destroy
		@playdate.destroy
		redirect_to user_path(@playdate.user_id)
	end

	private
	def playdate_params
		params.require(:playdate).permit(:title, :description, :location, :address, :datetime)
	end

	def find_playdate
		@playdate = Playdate.find(params[:id])
	end
end
