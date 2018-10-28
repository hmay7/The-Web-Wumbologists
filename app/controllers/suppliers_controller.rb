class SuppliersController < ApplicationController
  def show
  	@suppliers = Supplier.all
  end
end
