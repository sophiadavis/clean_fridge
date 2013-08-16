class FoodsController < ApplicationController

  def create
  	@user = current_user
  	@food = @user.fridges.first.foods.build(params[:food])
  	if @food.save
  		flash[:success] = "You have added 1 item to your fridge!"
  		redirect_to @food.fridge.user
  	else
  		flash[:error] = "You have added 1 item to your fridge!"
  		render 'current_user'
  	end
  end
  
  def destroy
  	@food = Food.find_by_id(params[:id])
#   	@user = User.find(session[:remember_token])
  	@user = @food.fridge.user
  	debugger
  	@food.destroy
#   	Food.destroy(params[:id])
#   	@food.destroy WHY DIDN'T THIS WORK?
	delete_count = @user.delete_count
	@user.update_attribute(:delete_count, delete_count + 1)
# 	@user.save
# 	increment_delete_count
	debugger
#   	flash[:error] = @user.name
	redirect_to @user
#  	redirect_back_or root_path #GET THIS TO WORK
  end

end

#      \"hyRj274QDI0rqapf0exOGQ\"
