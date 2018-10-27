Rails.application.routes.draw do

  get "/", to: 'home#show'

  ##############################################################
  # ACCOUNT CONTROLS
  ##############################################################
  # This will generate /log_in and /sign_up for us
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
  }

  # Profile page viewing a profile for user named :username
  get '/users/profile/:username', to: 'users#show'

  # Generates a view which lets user view and change their settings
  # get '/users/:username/settings', to: 'users#edit'

  # This request is sent by user after they change their settings; then redirect them to profile page
  # put '/users/:username/settings', to: 'users#update'

  ##############################################################
  # ACCOUNT-SPECIFIC-CONTROLS
  ##############################################################

  # Controls for Familys
  # Show list of nearby shelters which match needs
  get '/shelters', to: 'shelters#show'

  # Controls for shelters
  # Get list of suppliers which match needs
  get '/suppliers', to: 'suppliers#show'
  # Get list of nearby families to which we may need to be able to help or distribute to
  get '/families', to: 'families#show'

  # Controls for suppliers
  # Get list of shelters in need
  get '/shelters', to: 'shelters#show'



  ##############################################################
  # ABOUT / EXTRA RESOURCES / STATIC PAGES
  ##############################################################

  # About page
  get '/about', to: 'about#show'

  # External Resources Page
  get '/resources', to: 'resources#show'

end
