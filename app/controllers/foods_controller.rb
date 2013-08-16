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
  	@user = @food.fridge.user
  	@food.destroy
	delete_count = @user.delete_count
	@user.update_attribute(:delete_count, delete_count + 1)
	sign_in @user
	redirect_to @user
  end

end