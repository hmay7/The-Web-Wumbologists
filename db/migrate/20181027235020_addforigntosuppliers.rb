class Addforigntosuppliers < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :users, :suppliers
  end
end
