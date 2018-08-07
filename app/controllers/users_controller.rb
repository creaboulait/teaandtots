class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		render :show
	end

	def show
	end

	def edit
	end

	def update
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :profilepic)
	end
end
