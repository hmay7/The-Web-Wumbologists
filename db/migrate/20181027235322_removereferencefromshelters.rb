class Removereferencefromshelters < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :shelters, :users, foreign_key:true
  end
end
