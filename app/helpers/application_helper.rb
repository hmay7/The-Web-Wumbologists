module ApplicationHelper

  def user_profile_path
    return "/users/profile/#{current_user.user_name}"
  end

  def user_is_family?(user)
  	return user_signed_in? && Family.find_by_user_id(current_user.id) != nil
  end

  def user_is_supplier?(user)
    return user_signed_in? && Supplier.find_by_user_id(current_user.id) != nil
  end

  def user_is_shelter?(user)
    return user_signed_in? && Shelter.find_by_user_id(current_user.id) != nil
  end

  def 

end
