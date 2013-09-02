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
 
#   def show
#     @food = Food.find_by_id(params[:id])
#     @recipes = search @food.name
# #     @recipe = @recipes.first
#     render 'recipes/index'
#   end

  def search
    @food = Food.find_by_name(params[:name])
    yummly_id = 'c98ec941'
    yummly_key = '247edfa1dcf5b60179db7c5333497f42'
    url = "http://api.yummly.com/v1/api/recipes?_app_id=#{yummly_id}&_app_key=#{yummly_key}&q=&allowedIngredient[]=#{@food.name}" 
    response = HTTParty.get(url, headers: {"X-Yummly-App-ID" => yummly_id, "X-Yummly-App-Key"=> yummly_key}).body
    @recipes = ActiveSupport::JSON.decode(response)["matches"] 
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
  end
  
  def findRecipe
    recipe_id = params[:recipe_id]
    yummly_id = 'c98ec941'
    yummly_key = '247edfa1dcf5b60179db7c5333497f42'
    url = "http://api.yummly.com/v1/api/recipe/#{recipe_id}"
    response = HTTParty.get(url, headers: {"X-Yummly-App-ID" => yummly_id, "X-Yummly-App-Key" => yummly_key}).body
    @recipe = ActiveSupport::JSON.decode(response)
        # hash w keys "attribution", "ingredientLines", "flavors", "nutritionEstimates", 
        # "images", "name", "yield", "totalTime", "attributes", "totalTimeInSeconds", 
        # "rating", "numberOfServings", "source", "id" 
    render 'view_recipe'
  end
end 
