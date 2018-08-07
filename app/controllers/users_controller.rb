class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :profilepic)
	end
end
