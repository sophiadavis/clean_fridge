class UsersController < ApplicationController

before_filter :signed_in_user, only: [:edit, :update]
before_filter :correct_user, only: [:edit, :update]

  def new
  	@user = User.new(params[:user])
  end
  
  def create
  	@user = User.new(params[:user])
  	@user.delete_count = 0
  	if @user.save
  		sign_in @user
  		@fridge = @user.fridges.create(name: "My Fridge")
  		flash[:success] = "Welcome to CleanFridge!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  
  def show
  	@user = User.find(params[:id])
  	@fridge = @user.fridges.first
   	@foods = @fridge.foods
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        sign_in @user
        redirect_to @user
    else
        render 'edit'
    end
  end
  
  private
    def correct_user
        @user = User.find(params[:id])
        unless current_user? (@user)
        	redirect_to(root_path) 
			flash[:error] = "You can't access that page."
		end
    end
end
