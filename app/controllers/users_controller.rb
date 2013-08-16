class UsersController < ApplicationController

before_filter :signed_in_user, except: [:new, :create]

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
end
