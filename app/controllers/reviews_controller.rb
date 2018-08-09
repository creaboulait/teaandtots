class ReviewsController < ApplicationController
	before_action :find_user, only: [:create, :destroy] 

	def index
		@reviews = Review.find_by(user_id: params[:id])
	end

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.playdate_id = params[:playdate_id]
		
		if @review.save
			flash[:notice] = "Thank you for the review! Hope you enjoyed the playdate."
			redirect_to user_path(@user)
		else
			flash[:danger] = "You have reviewed this playdate before."
			redirect_to user_path(@user)
		end
	end

	#This is confined to admin only
	def destroy
		# # Assign free spin to user who reported toxic review
		# user = User.find(@review.reported_by_user_id)
		# user.update(spins_remaining: user.spins_remaining += 1)

		# Happens after free spin given
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to admins_path
	end

	private
	def review_params
		params.require(:review).permit(:title, :description, :stars)
	end

	def find_user
		@user = User.find(current_user.id)
	end
end
