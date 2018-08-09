class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update]

	def index
		@user = User.all
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
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :profilepic, :bio)
	end
end
