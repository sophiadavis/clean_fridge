class UsersController < ApplicationController
  def new
  	@user = User.new(params[:user])
  end
  
  def create
  	@user = User.new(params[:user])
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
