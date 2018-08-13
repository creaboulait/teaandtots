class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :report, :unreport, :destroy]

	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to playdates_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		@user.update(user_params)
		redirect_to user_path(@user)
	end


	def report
		if @user.reported == false
			@user.report!
			flash.now[:notice] = "Thank you for reporting this user. The admin will be in touch with you shortly to understand your concerns."
			respond_to do |format|
				format.js
			end
			@user.update(reported_by_user_id: current_user.id)
		elsif @user.reported == true
			flash.now[:alert] = "This user is currently under investigation by our admin." 
			respond_to do |format|
				format.js
			end
		end		
	end

	#This is confined to admin only & button available on admin panel
	def unreport
		redirect_to admins_path
	end

	#This is confined to admin only & button available on admin panel
	def destroy
		@user.delete
		redirect_to admins_path
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :profilepic, :bio)
	end
end
