class KidsController < ApplicationController	
	def new
		@kid = Kid.new
	end

	def create
		@kid = Kid.new(kid_params)
		@kid.save
	end

	private
	def kid_params
		params.require(:kid).permit(:name, :age, :gender)
	end
end
