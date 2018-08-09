class WelcomeController < ApplicationController
	def index
		if !current_user
			render "welcome/index"
		else
			redirect_to playdates_path
		end
	end
end
