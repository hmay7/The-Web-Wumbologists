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

  def address
  	return "#{self.city} #{self.state} #{self.zip}"
  end

  def generate_lat_long!
    location = Geocoder.search(address())
    self.longitude = location.first.coordinates[0]
    self.latitude = location.first.coordinates[1]
    # puts "\n\n\n#{address()}=#{self.latitude},#{self.longitude}\n\n\n"
  end


end
