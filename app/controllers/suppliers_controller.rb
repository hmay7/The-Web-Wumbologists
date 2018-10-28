class SuppliersController < ApplicationController
  def show
  	@suppliers = Supplier.all
  	@suppliers.sort! do | supp1, supp2 | 
  		return supp1.distance_to(current_user) <=> supp2.distance_to(current_user)
  end
end
