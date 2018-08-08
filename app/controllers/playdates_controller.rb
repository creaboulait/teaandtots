class PlaydatesController < ApplicationController
	before_action :find_playdate, only: [:show, :edit, :update, :destroy]

	def index
		@playdates = Playdate.all
	end

	def search    
    @playdates = Playdate.where(nil) # creates an anonymous scope
    @playdates = @playdates.playdate_search(filter_params[:playdate]) if filter_params[:playdate].present?
    respond_to do |format|
      format.html
      format.js
    end
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
		
	end

	def update
		@playdate.update(playdate_params)
		redirect_to user_path(@playdate.user_id)
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

	def filter_params
    params.require(:filter).permit(:playdate)
  end

end
