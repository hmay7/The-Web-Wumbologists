class SheltersController < ApplicationController
  def show
  	@shelters = Shelter.all
  end
end
