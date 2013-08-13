class FoodsController < ApplicationController

  def create
  	@user = current_user
  	@food = @user.fridges.first.foods.build(params[:food])
  	if @food.save
  		flash[:success] = "You have added 1 item to your fridge!"
  		redirect_to @food.fridge.user
  	else
  		flash[:success] = "You have added 1 item to your fridge!"
  		render 'current_user'
  	end
  end
  
  def destroy
  	Food.destroy(params[:id])
#   	@food.destroy WHY DIDN'T THIS WORK?
	redirect_to current_user
#  	redirect_back_or root_path #GET THIS TO WORK
  end

end
