class SheltersController < ApplicationController
  def show
  	@shelters = Shelter.all
  	@shelters.sort! do | shelt1, shelt2 | 
  		return shelt1.distance_to(current_user) <=> shelt2.distance_to(current_user)
  	end
  end  
end
