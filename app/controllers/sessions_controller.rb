class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_username((params[:session][:username]).downcase)
		if user && user.authenticate(params[:session][:password])
			flash.now[:error] = "It works!"
 			sign_in user
			redirect_to root_path
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
end
