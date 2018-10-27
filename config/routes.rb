Rails.application.routes.draw do



  ##############################################################
  # ACCOUNT CONTROLS
  ##############################################################
  # This will generate /log_in and /sign_up for us
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
  }

  # Profile page viewing a profile for user named :username
  get '/users/:username'

  # Generates a view which lets user view and change their settings
  get '/users/:username/settings' 

  # This request is sent by user after they change their settings; then redirect them to profile page
  put '/users/:username/settings'

  ##############################################################
  # ACCOUNT-SPECIFIC-CONTROLS
  ##############################################################

  # Controls for Familys
  # Show list of nearby shelters which match needs
  get '/shelters'

  # Controls for shelters
  # Get list of suppliers which match needs
  get '/suppliers'
  # Get list of nearby families to which we may need to be able to help or distribute to
  get '/families'

  # Controls for suppliers
  # Get list of shelters in need
  get '/shelters'



  ##############################################################
  # ABOUT / EXTRA RESOURCES / STATIC PAGES
  ##############################################################

  # About page
  get '/about'

  # External Resources Page
  get '/resources'

end
