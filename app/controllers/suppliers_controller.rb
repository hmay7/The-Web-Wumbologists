class SuppliersController < ApplicationController
  def show
  	sup_all = Supplier.all
  	@suppliers = []
  	sup_all.each do |s|
  		@suppliers.push s
  	end

  	@suppliers.sort! do | supp1, supp2 |
  		return supp1.user.distance_to(current_user) <=> supp2.user.distance_to(current_user)
  	end
  end
end
