class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@user = current_user
		@fridge = current_user.fridges.first
	end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
