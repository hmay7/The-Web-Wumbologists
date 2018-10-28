class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def distance_to(user)
  	return Geocoder::Calculations.distance_between([self.longitude, self.latitude], [user.longitude, user.latitude])
  end
  # user_array = Array.new
  # count = 0
  # @users.each do |user|
  # 	user_array.insert(count, user)
  # 	count += 1
  # end
end
