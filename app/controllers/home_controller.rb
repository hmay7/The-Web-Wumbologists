class HomeController < ApplicationController

  # GET /
  def show 
  	# If we're logged in, then redirect to user's profile page
    if user_signed_in?
    	redirect_to user_profile_path
    else
    	redirect_to "/users/sign_in"
    end
  	# otherwise, redirect to log in page


  end

end
