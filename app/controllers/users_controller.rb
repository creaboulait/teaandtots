class UsersController < ApplicationController
	before_action :find_user, only: [:show]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		session[:user_id] = @user.id
		redirect_to playdates_path
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
