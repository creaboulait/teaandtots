class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:danger] = 'Invalid email/password combination'
			render 'sessions/new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
