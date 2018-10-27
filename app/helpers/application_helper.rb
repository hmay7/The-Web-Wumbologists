module ApplicationHelper

  def user_profile_path
    return "/users/profile/#{current_user.username}"
  end

end
