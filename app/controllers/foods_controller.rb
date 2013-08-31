class FoodsController < ApplicationController
   require 'recipe.rb'  #  DO I NEED THIS??
#   respond_to :html, :js

  def create
  	@user = current_user
  	@food = @user.fridges.first.foods.build(params[:food])
  	flash[:success] = "You have added 1 item to your fridge!"
#   	respond_with @user
	if @food.save
  		flash[:success] = "You have added 1 item to your fridge!"
  		redirect_to @food.fridge.user
  	else
  		flash[:error] = "We're sorry, but something went wrong."
  		render 'current_user'
  	end
  end
  
  def destroy
  	@food = Food.find_by_id(params[:id])
  	@user = @food.fridge.user
  	flash[:success] = "Item successfully removed."
  	@food.destroy
	delete_count = @user.delete_count
	@user.update_attribute(:delete_count, delete_count + 1)
	sign_in @user
	redirect_to @user
  end
 
  def show
    @food = Food.find_by_id(params[:id])
    @recipes = search @food.name
    @recipe = @recipes.first
    render 'recipes/show'
  end
  
    
    
  def search food 
    yummly_id = 'c98ec941'
    yummly_key = '247edfa1dcf5b60179db7c5333497f42'
    url = "http://api.yummly.com/v1/api/recipes?_app_id=#{yummly_id}&_app_key=#{yummly_key}&q=&allowedIngredient[]=#{food}" 
    response = HTTParty.get(url).body
    recipes = ActiveSupport::JSON.decode(response)["matches"] 
  end
end 
#             an array of hashes
#             each hash has these keys:
#                             attributes, 
#                             flavors, 
#                             rating, 
#                             id, 
#                             smallImageUrls, 
#                             sourceDisplayName,
#                             totalTimeInSeconds,
#                             ingredients,
#                             recipeName