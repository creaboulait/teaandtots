class KidsController < ApplicationController	

	def new
		@kid = Kid.new
	end

	def create
		@kid = Kid.new(kid_params)
		@kid.user_id = current_user.id
		@kid.save
		redirect_to user_path(@kid.user_id)
	end

	private
	def kid_params
		params.require(:kid).permit(:name, :age, :gender)
	end
end
