class FamiliesController < ApplicationController
  def show
	@families = Family.all
  end
end
