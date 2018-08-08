class ParticipationsController < ApplicationController
	def new
		@playdate = Playdate.find(params[:playdate_id])
		@participation = Participation.new
	end

	def create
		@participation = Participation.create(playdate_id: params[:playdate_id], kid_id: params[:kid][:id])
		redirect_to user_path(@participation.kid.user_id)
	end

	def destroy
		@participation = Participation.find(params[:id])
		@participation.destroy
		redirect_to user_path(@participation.kid.user_id)
	end
end
