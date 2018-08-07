class KidsController < ApplicationController	

	def new
		@kid = Kid.new
	end

	def create
		@kid = Kid.new(kid_params)
		@kid.save
		redirect_to user_path(@kid.user_id)
	end

	private
	def kid_params
		params.require(:kid).permit(:name, :age, :gender, :user_id)
	end
end
