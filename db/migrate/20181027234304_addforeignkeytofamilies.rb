class Addforeignkeytofamilies < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :families, :users
  end
end
