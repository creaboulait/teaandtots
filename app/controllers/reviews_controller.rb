class ReviewsController < ApplicationController
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
		
		# if @review.save
		# 	user = User.find(@review.user.id)
		# 	user.update(review_count: user.review_count += 1)
		# 		#Logic to award 2 spins on every 5th review
		# 		if user.review_count % 5 == 0
		# 			user.update(spins_remaining: user.spins_remaining += 2)
		# 			flash[:notice] = "Thank you for contributing 5 reviews, here are 2 additional spins for making our marketplace better!"
		# 			#Alert that user has won 2 free spins (WIP)
		# 			#Alert review has been saved (WIP)
		# 			redirect_to company_path(@company)
		# 		else
		# 			#Alert review not saved (WIP)
		# 			redirect_to company_path(@company)
		# 		end
		# end
	end
end
