class AdduserintTofamilies < ActiveRecord::Migration[5.2]
  def change
  	add_column :families, :user_id, :integer
  end
end
