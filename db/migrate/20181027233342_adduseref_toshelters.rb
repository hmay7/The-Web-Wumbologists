class AdduserefToshelters < ActiveRecord::Migration[5.2]
  def change
  	add_reference :shelters, :users, foreign_key: true
  end
end
